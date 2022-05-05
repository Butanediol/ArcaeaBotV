import Fluent

struct CreateStoredUserInfo: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("stored_user_info")
            .id()
            .field("arcaea_friend_code", .string, .required)
            .field("display_name", .string, .required)
            .field("potential", .int)
            .field("created_at", .double)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("stored_user_info").delete()
    }
}
