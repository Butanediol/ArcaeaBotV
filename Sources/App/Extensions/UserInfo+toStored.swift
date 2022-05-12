extension UserInfo {
    func toStored(friendCode: ArcaeaFriendCode) -> StoredUserInfo {
        .init(friendCode: friendCode, displayName: displayName, potential: potential)
    }
}
