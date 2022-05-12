import Vapor

extension UserInfo {
    func formatted(app: Application) throws -> String {
        return try lastPlayedSong.formatted(app: app, userInfo: self)
    }
}
