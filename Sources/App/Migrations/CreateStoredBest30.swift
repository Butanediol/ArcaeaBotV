import Fluent
import Vapor

struct CreateStoredBest30: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("stored_best30")
            .id()
            .field("plays", .array(of: .array(of: .custom(Play.self))), .required)
            .field("arcaea_friend_code", .string, .required)
            .field("created_at", .double)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("stored_best30").delete()
    }
}
