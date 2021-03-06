import Fluent
import FluentPostgresDriver
import Leaf
import Vapor

import telegram_vapor_bot

// configures your application
public func configure(_ app: Application) throws {
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

    app.migrations.add(CreateBindingRelationship())
    app.migrations.add(CreateStoredUserInfo())
    app.migrations.add(CreateSongs())
    app.migrations.add(CreateAliases())
    app.migrations.add(CreateStoredBest30())
    app.migrations.add(CreateStoredPlay())

    app.views.use(.leaf)

    try configureTelegramBot(app)

    // register routes
    try routes(app)
}

private func configureTelegramBot(_ app: Application) throws {
    TGBot.configure(
        connection: TGLongPollingConnection(),
        botId: Environment.get("TELEGRAM_BOT_API") ?? "XXXXXXXXXX:YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY",
        vaporClient: app.client
    )
    app.tgConfig = .init(
        botUsername: Environment.get("TELEGRAM_BOT_USERNAME"),
        adminUserId: Environment.get("TELEGRAM_ADMIN_USERID"),
        webAppBaseUrl: Environment.get("WEB_APP_BASE_URL")
    )
    try TGBot.shared.start()
    TGBot.log.logLevel = app.logger.logLevel
    DefaultBotHandlers.addhandlers(app: app, bot: TGBot.shared)
    InlineBotHandlers.addhandlers(app: app, bot: TGBot.shared)
    CallbackBotHandler.addhandlers(app: app, bot: TGBot.shared)
}
