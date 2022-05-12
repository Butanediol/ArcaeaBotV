// MARK: - UserInfo

struct UserInfo: Codable, UserInfoProtocol {
    let displayName: String
    let potential: Int?
    let partner: Partner
    let lastPlayedSong: Play

    enum CodingKeys: String, CodingKey {
        case displayName = "display_name"
        case potential, partner
        case lastPlayedSong = "last_played_song"
    }
}
