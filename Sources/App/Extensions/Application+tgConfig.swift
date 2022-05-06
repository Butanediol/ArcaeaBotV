import Vapor

struct TGConfig {
    var botUsername: String?
    var adminUserId: String?
}

struct TGConfigKey: StorageKey {
    typealias Value = TGConfig
}

extension Application {
    var tgConfig: TGConfig? {
        get {
            storage[TGConfigKey.self]
        }
        set {
            storage[TGConfigKey.self] = newValue
        }
    }
}
