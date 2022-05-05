import Vapor

struct TGConfig {
	var botUsername: String?
}

struct TGConfigKey: StorageKey {
	typealias Value = TGConfig
}

extension Application {
    var tgConfig: TGConfig? {
        get {
            self.storage[TGConfigKey.self]
        }
        set {
            self.storage[TGConfigKey.self] = newValue
        }
    }
}