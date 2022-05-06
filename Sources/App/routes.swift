import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req async throws -> View in
        try await req.view.render("index", ["title": "Arcaea Bot V!"])
    }

    app.get("hello") { _ -> String in
        "Hello, world!"
    }
}
