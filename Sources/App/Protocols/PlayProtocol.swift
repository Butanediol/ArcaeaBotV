protocol PlayProtocol {
    var songID: String { get }
    var timePlayed: Int { get }
    var difficulty: Difficulty { get }
    var score: Int { get }
    var pureCount: Int { get }
    var shinyPureCount: Int { get }
    var farCount: Int { get }
    var lostCount: Int { get }
}
