import Foundation

struct Media: Codable, Equatable, Identifiable {
    var id = UUID()
    let cover: String?
    let width: Double?
    let height: Double?
    let url: String
}
