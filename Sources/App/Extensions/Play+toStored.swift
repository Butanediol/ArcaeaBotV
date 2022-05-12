extension Play {
    /// This function convert a play record to a stored play record in convenience of storing it to database.
    func toStored(arcaeaFriendCode: ArcaeaFriendCode) -> StoredPlay {
        .init(
            arcaeaFriendCode: arcaeaFriendCode,
            songID: songID,
            difficulty: difficulty,
            score: score,
            shinyPureCount: shinyPureCount,
            pureCount: pureCount,
            farCount: farCount,
            lostCount: lostCount,
            recollectionRate: recollectionRate,
            timePlayed: timePlayed,
            gaugeType: gaugeType,
            potentialValue: potentialValue
        )
    }
}
