import Fluent

struct CreateAliases: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("aliases")
            .id()
            .field("sid", .string, .required)
            .field("alias", .string, .required)
            .unique(on: "alias")
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("aliases").delete()
    }
}
