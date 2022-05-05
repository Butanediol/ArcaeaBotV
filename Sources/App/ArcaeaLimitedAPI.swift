import Vapor

struct ArcaeaLimitedAPIConfiguration {
	var token: String
	var baseUrl: String

	static let defaultUrl = "https://arcaea-limitedapi.lowiro.com/api/v0"
}

struct ArcaeaLimitedAPIConfigurationKey: StorageKey {
    typealias Value = ArcaeaLimitedAPIConfiguration
}

extension Application {
    var arcaeaLimitedAPIConfiguration: ArcaeaLimitedAPIConfiguration? {
        get {
            self.storage[ArcaeaLimitedAPIConfigurationKey.self]
        }
        set {
            self.storage[ArcaeaLimitedAPIConfigurationKey.self] = newValue
        }
    }

    var arcaeaLimitedAPI: ArcaeaLimitedAPI {
    	.init(app: self)
    }

    struct ArcaeaLimitedAPI {
    	var app: Application

    	func request(endpoint: Endpoint, httpMethod: String, parameters: [String: String] = [:]) throws -> ClientResponse {
    		guard let arcaeaLimitedAPIConfiguration = app.arcaeaLimitedAPIConfiguration else { throw Abort(.internalServerError) }

			let uri = endpoint.uri(baseUrl: arcaeaLimitedAPIConfiguration.baseUrl)
			var headers = HTTPHeaders()
			headers.add(name: "Accept", value: "application/json")
			headers.add(name: "Authorization", value: "Bearer \(arcaeaLimitedAPIConfiguration.token)")

			return try app.client.send(.RAW(value: httpMethod), headers: headers, to: uri).wait()
		}

		func get(endpoint: Endpoint, parameters: [String: String] = [:]) throws -> ClientResponse{
			return try request(endpoint: endpoint, httpMethod: "GET")
		}

		func userInfo(friendCode: ArcaeaFriendCode) throws -> UserInfo {
			let rawResponse = try get(endpoint: .userInfo(friendCode))
			return try rawResponse.content.decode(UserInfoResponse.self).userInfo
		}
    }
}

enum Endpoint {
		case userInfo(ArcaeaFriendCode)
		// case score(Difficulty, ArcaeaFriendCode, String)
		case best(ArcaeaFriendCode)

		var path: String {
			switch self {
				case .userInfo(let friend_code):
					return "/user/\(friend_code)"
				// case .score(_, let friend_code, _):
				// 	return "/user/\(String(format: "%09d", friend_code))/score"
				case .best(let friend_code):
					return "/user/\(friend_code)/best"
			}
		}

		func uri(baseUrl: String) -> URI {
			.init(string: baseUrl.appending(self.path))
		}
}
