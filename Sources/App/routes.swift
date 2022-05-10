import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req async throws -> View in
        try await req.view.render("index", ["title": "Arcaea Bot V!"])
    }

    app.get("userInfo", ":telegramUserId") { req async throws -> View in
        guard let telegramUserId = Int64(req.parameters.get("telegramUserId") ?? "") else { throw Abort(.badRequest) }
        guard let relationship = try await BindingRelationship.query(on: req.db)
            .filter(\.$telegramUserId, .equal, telegramUserId).first() else { throw Abort(.badRequest) }
        let stored_user_infos = try await StoredUserInfo.query(on: req.db).filter(\.$arcaeaFriendCode, .equal, relationship.arcaeaFriendCode).sort(\.$createdAt, .ascending).all()

        return try await req.view.render("userInfo", ["userInfos": stored_user_infos])
    }
}
