import Vapor
import Fluent

struct CreateSongs: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("songs")
            .id()
            .field("sid", .string, .required)
            .field("name_en", .string, .required)
            .field("name_jp", .string)
            .field("bpm", .string, .required)
            .field("bpm_base", .int, .required)
            .field("packset", .string, .required)
            .field("artist", .string, .required)
            .field("time", .int, .required)
            .field("side", .int, .required)
            .field("date", .double, .required)
            .field("version", .string, .required)
            .field("world_unlock", .bool, .required)
            .field("remote_download", .bool, .required)
            .field("rating_pst", .int, .required)
            .field("rating_prs", .int, .required)
            .field("rating_ftr", .int, .required)
            .field("rating_byd", .int)
            .field("difficulty_pst", .int, .required)
            .field("difficulty_prs", .int, .required)
            .field("difficulty_ftr", .int, .required)
            .field("difficulty_byd", .int)
            .field("notes_pst", .int, .required)
            .field("notes_prs", .int, .required)
            .field("notes_ftr", .int, .required)
            .field("notes_byd", .int)
            .field("chart_designer_pst", .string, .required)
            .field("chart_designer_prs", .string, .required)
            .field("chart_designer_ftr", .string, .required)
            .field("chart_designer_byd", .string)
            .field("jacket_designer_pst", .string, .required)
            .field("jacket_designer_prs", .string, .required)
            .field("jacket_designer_ftr", .string, .required)
            .field("jacket_designer_byd", .string)
            .field("jacket_override_pst", .bool, .required)
            .field("jacket_override_prs", .bool, .required)
            .field("jacket_override_ftr", .bool, .required)
            .field("jacket_override_byd", .bool)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("songs").delete()
    }
}
