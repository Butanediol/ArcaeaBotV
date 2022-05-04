import Fluent

struct CreateBindingRelationship: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("binding_relationship")
            .id()
            .field("telegram_user_id", .int64, .required)
            .field("arcaea_friend_code", .string, .required)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("binding_relationship").delete()
    }
}
