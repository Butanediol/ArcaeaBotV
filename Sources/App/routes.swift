import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req async throws -> View in
        try await req.view.render("index", ["title": "Arcaea Bot V!"])
    }

    app.get("userInfo", ":telegramUserId") { req async throws -> View in
        guard let telegramUserId = Int64(req.parameters.get("telegramUserId") ?? "")
        else { throw Abort(.badRequest) }
        guard let relationship = try await BindingRelationship.query(on: req.db)
            .filter(\.$telegramUserId, .equal, telegramUserId).first() else { throw Abort(.badRequest) }
        let stored_user_infos = try await StoredUserInfo.query(on: req.db)
            .filter(\.$arcaeaFriendCode, .equal, relationship.arcaeaFriendCode).sort(\.$createdAt, .ascending)
            .all()

        return try await req.view.render("userInfo", ["userInfos": stored_user_infos])
    }

    app.get("img", ":songId", ":difficulty") { req async throws -> Response in
        guard let songId = req.parameters.get("songId"),
              let difficultyStr = req.parameters.get("difficulty"), let difficultyInt = Int(difficultyStr),
              let difficulty = Difficulty(rawValue: difficultyInt) else { throw Abort(.badRequest) }

        guard let song = try await Song.query(on: req.db).filter(\.$sid, .equal, songId).first()
        else { throw Abort(.notFound) }

        let filename: String = {
            switch difficulty {
            case .past:
                return song.jacketOverridePst ? "0.jpg" : "base.jpg"
            case .present:
                return song.jacketOverridePrs ? "1.jpg" : "base.jpg"
            case .future:
                return song.jacketOverrideFtr ? "2.jpg" : "base.jpg"
            case .beyond:
                return song.jacketOverrideByd == true ? "3.jpg" : "base.jpg"
            }
        }()

        let dirPrefix = song.remoteDownload == true ? "dl_" : ""

        return req.fileio
            .streamFile(at: app.directory.publicDirectory + "songs/\(dirPrefix)\(songId)/\(filename)")
    }

    app.get("img", "best30", ":id") { req async throws -> Response in
        guard let recordId = req.parameters.get("id"),
              let recordUuid = UUID(uuidString: recordId) else { throw Abort(.badRequest) }

        let renderer = try Best30ImageRenderer()

        let songs = try await Song.query(on: req.db).all()

        guard let best30 = try await StoredBest30.query(on: req.db)
            .filter(\.$id == recordUuid)
            .first() else { throw Abort(.internalServerError) }

        let image = try renderer.render(
            best30,
            songs: songs
        )

        return .init(status: .ok, body: .init(data: try image.export()))
    }
}
