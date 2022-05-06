import Vapor

struct ArcaeaLimitedAPIConfiguration {
    var token: String
    var baseUrl: String

    static let defaultUrl = "https://arcaea-limitedapi.lowiro.com/api/v0"
}

struct APIError: LocalizedError, Codable {
    let message: String
    let errors: String

    public var errorDescription: String {
        "\(message): \(errors)"
    }

    static let networkError = APIError(message: "Network Error", errors: "Should blame 616.")
    static let unknownError = APIError(message: "Unknown Error", errors: "Unknown Error")
}

struct ArcaeaLimitedAPIConfigurationKey: StorageKey {
    typealias Value = ArcaeaLimitedAPIConfiguration
}

extension Application {
    var arcaeaLimitedAPIConfiguration: ArcaeaLimitedAPIConfiguration? {
        get {
            storage[ArcaeaLimitedAPIConfigurationKey.self]
        }
        set {
            storage[ArcaeaLimitedAPIConfigurationKey.self] = newValue
        }
    }

    var arcaeaLimitedAPI: ArcaeaLimitedAPI {
        .init(app: self)
    }

    struct ArcaeaLimitedAPI {
        var app: Application

        private func request(endpoint: Endpoint, httpMethod: String,
                             parameters _: [String: String] = [:]) throws -> ClientResponse
        {
            guard let arcaeaLimitedAPIConfiguration = app.arcaeaLimitedAPIConfiguration
            else { throw Abort(.internalServerError) }

            let uri = endpoint.uri(baseUrl: arcaeaLimitedAPIConfiguration.baseUrl)
            var headers = HTTPHeaders()
            headers.add(name: "Accept", value: "application/json")
            headers.add(name: "Authorization", value: "Bearer \(arcaeaLimitedAPIConfiguration.token)")

            return try app.client.send(.RAW(value: httpMethod), headers: headers, to: uri).wait()
        }

        private func get(endpoint: Endpoint, parameters _: [String: String] = [:]) throws -> ClientResponse {
            return try request(endpoint: endpoint, httpMethod: "GET")
        }

        func userInfo(friendCode: ArcaeaFriendCode) -> Result<UserInfo, APIError> {
            guard let rawResponse = try? get(endpoint: .userInfo(friendCode))
            else { return .failure(APIError.networkError) }
            if let userInfo = try? rawResponse.content.decode(UserInfoResponse.self).userInfo {
                try? userInfo.toStored(friendCode: friendCode).save(on: app.db).wait()
                return .success(userInfo)
            }
            if let apiError = try? rawResponse.content.decode(APIError.self) {
                return .failure(apiError)
            }
            return .failure(APIError.unknownError)
        }

        func scoreInfo(friendCode: ArcaeaFriendCode, difficulty: Difficulty,
                       songId: String) -> Result<Play, APIError>
        {
            guard let rawResponse = try? get(endpoint: .score(difficulty, friendCode, songId))
            else { return .failure(APIError.networkError) }
            if let bestPlay = try? rawResponse.content.decode(ScoreResponse.self).bestPlay {
                return .success(bestPlay)
            }
            if let apiError = try? rawResponse.content.decode(APIError.self) {
                return .failure(apiError)
            }
            return .failure(APIError.unknownError)
        }

        func bestInfo(friendCode: ArcaeaFriendCode) -> Result<Best30, APIError> {
            guard let rawResponse = try? get(endpoint: .best(friendCode))
            else { return .failure(APIError.networkError) }
            if let best30 = try? rawResponse.content.decode(Best30Response.self).best30 {
                return .success(best30)
            }
            if let apiError = try? rawResponse.content.decode(APIError.self) {
                return .failure(apiError)
            }
            return .failure(APIError.unknownError)
        }
    }
}

enum Endpoint {
    case userInfo(ArcaeaFriendCode)
    case score(Difficulty, ArcaeaFriendCode, String)
    case best(ArcaeaFriendCode)

    var path: String {
        switch self {
        case let .userInfo(friend_code):
            return "/user/\(friend_code)"
        case let .score(difficulty, friend_code, songId):
            return "/user/\(friend_code)/score?song_id=\(songId)&difficulty=\(difficulty.rawValue)"
        case let .best(friend_code):
            return "/user/\(friend_code)/best"
        }
    }

    func uri(baseUrl: String) -> URI {
        .init(string: baseUrl.appending(path))
    }
}
