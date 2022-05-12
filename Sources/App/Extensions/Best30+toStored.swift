extension Best30 {
    func toStored(_ friendCode: ArcaeaFriendCode) -> StoredBest30 {
        .init(plays: self, arcaeaFriendCode: friendCode)
    }
}
