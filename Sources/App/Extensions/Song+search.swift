import Fluent
import Vapor

extension Song {
    enum SongSearchOptions {
        case exactMatch
        case includeAliases
    }

    static func search<T: StringProtocol>(_ searchText: T, in app: Application,
                                          options: SongSearchOptions...) throws -> EventLoopFuture<[Song]>
    {
        let text = "\(searchText)"
        let alias: Alias? = options.contains(.includeAliases) ? try Alias.query(on: app.db)
            .filter(\.$alias == text).first().wait() : nil

        if let alias = alias {
            return Song.query(on: app.db).filter(\.$sid, .equal, alias.sid).all()
        }

        let songs = Song.query(on: app.db).group(.or) { group in
            if options.contains(.exactMatch) {
                group.filter(\.$sid == text)
                group.filter(\.$nameEn == text)
                group.filter(\.$nameJp == text)
            } else {
                group.filter(\.$sid ~~ text)
                group.filter(\.$nameEn ~~ text)
                group.filter(\.$nameJp ~~ text)
            }

        }.all()
        return songs
    }
}
