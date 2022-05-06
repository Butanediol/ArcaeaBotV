import Fluent
import Vapor

struct CreateStoredPlay: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("stored_play")
            .id()
            .field("arcaea_friend_code", .string, .required)
            .field("sid", .string, .required)
            .field("difficulty", .int, .required)
            .field("score", .int, .required)
            .field("shiny_pure_count", .int, .required)
            .field("pure_count", .int, .required)
            .field("far_count", .int, .required)
            .field("lost_count", .int, .required)
            .field("recollection_rate", .int, .required)
            .field("time_played", .int, .required)
            .field("gauge_type", .int, .required)
            .field("potential_value", .double)
            .field("created_at", .double)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("stored_play").delete()
    }
}
