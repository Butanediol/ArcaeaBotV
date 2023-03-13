import Fluent
import FluentPostgresDriver
import Leaf
import Vapor

import TelegramVaporBot
var connection: TGConnectionPrtcl!

// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder

    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    app.databases.use(.postgres(
        hostname: Environment.get("DATABASE_HOST") ?? "localhost",
        port: Environment.get("DATABASE_PORT").flatMap(Int.init(_:)) ?? PostgresConfiguration.ianaPortNumber,
        username: Environment.get("DATABASE_USERNAME") ?? "vapor_username",
        password: Environment.get("DATABASE_PASSWORD") ?? "vapor_password",
        database: Environment.get("DATABASE_NAME") ?? "vapor_database"
    ), as: .psql)

    app.arcaeaLimitedAPIConfiguration = ArcaeaLimitedAPIConfiguration(
        token: Environment.get("ARCAEA_LIMITED_API_TOKEN") ?? "",
        baseUrl: ArcaeaLimitedAPIConfiguration.defaultUrl
    )

    app.imageRenderer = try .init()
    try await configureTelegramBot(app)

    app.migrations.add(CreateBindingRelationship())
    app.migrations.add(CreateStoredUserInfo())
    app.migrations.add(CreateSongs())
    app.migrations.add(CreateAliases())
    app.migrations.add(CreateStoredBest30())
    app.migrations.add(CreateStoredPlay())

    app.views.use(.leaf)

    // register routes
    try routes(app)
}

private func configureTelegramBot(_ app: Application) async throws {

    let bot = TGBot(
        app: app, 
        botId: Environment.get("TELEGRAM_BOT_API") ?? "XXXXXXXXXX:YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
    )

    connection = TGLongPollingConnection(bot: bot)

    await DefaultBotHandlers.addhandlers(app: app, connection: connection)
    await InlineBotHandlers.addhandlers(app: app, connection: connection)
    await CallbackBotHandler.addhandlers(app: app, connection: connection)
    try await connection.start()
}