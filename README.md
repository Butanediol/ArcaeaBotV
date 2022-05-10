# Arcaea Bot V

The `V` makes it sounds cooler.

## Configuration

Rename `example.env` file to `.env`.

- `TELEGRAM_BOT_API`: Telegram Bot API Token
- `TELEGRAM_BOT_USERNAME`: Optional. Username of your Telegram Bot, the name that usually begins with `@`. If you skip this variable, bot will only respond those command without `@BotName`.
- `TELEGRAM_ADMIN_USERID`: Optional. UserID of the admin user. If you leave this empty, no user will be able to add operators or edit aliases via command. (You can always do that by modifying the database directly.)
- `WEB_APP_BASE_URL`: Optional. Web app url of your bot's telegram web app. Leave this empty so that the bot will not send web app link.
- `DATABASE_HOST`: Optional. Postgresql host address. Default is `localhost`.
- `DATABASE_USERNAME`: Optional. Postgresql username. Default is `vapor_username`.
- `DATABASE_PASSWORD`: Optional. Postgresql password. Default is `vapor_password`.
- `DATABASE_NAME`: Optional. Postgresql database name. Default is `vapor_database`.
- `ARCAEA_LIMITED_API_TOKEN`: Arcaea Limited API token.