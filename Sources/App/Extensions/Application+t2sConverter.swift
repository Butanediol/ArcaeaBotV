import OpenCC
import Vapor

extension Application {
    static let t2sConverter = try! ChineseConverter(options: [.simplify, .hkStandard])
}
