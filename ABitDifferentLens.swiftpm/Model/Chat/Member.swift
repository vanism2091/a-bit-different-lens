import Foundation

struct Member: Codable, Equatable, Identifiable {
    var id = UUID()
    let background: String?
    let name: String
    let icon: String?
}

extension Member {
    static let you = Member(
        background: nil,
        name: "You",
        icon: "you_wink"
    )
    
    static let me = Member(
        background: nil,
        name: "Me",
        icon: nil
    )
}
