import Fluent
import Vapor

final class Alias: Content, Model {
    static let schema = "aliases"

    @ID(key: .id)
    var id: UUID?

    @Field(key: "sid")
    var sid: String

    @Field(key: "alias")
    var alias: String

    init() {}

    init(sid: String, alias: String) {
        self.sid = sid
        self.alias = alias
    }
}
