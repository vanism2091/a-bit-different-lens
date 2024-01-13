import Foundation

struct Message: Codable, Equatable, Identifiable {
    var id = UUID()
    let image: Media?
    var emoji: Emoji?
    let member: Member
    let text: String?
    let type: MessageType
    
    enum MessageType: String, Codable, Equatable {
        case text
        case image
    }
}

struct Emoji: Codable, Equatable {
    let name: String
}

extension Message {
    static let all1: [Message] = [
        Message(
            image: Media(cover: nil, width: nil, height: nil, url: "result_prota"),
            emoji: Emoji(name: "me_sad"),
            member: .me,
            text: "color blind test result",
            type: .image
        ),
        Message(
            image: nil,
            emoji: nil,
            member: .me,
            text: "Hey, look at this, I'm colorblind.",
            type: .text
        ),
        Message(
            image: nil,
            emoji: nil,
            member: .me,
            text: "I've been looking at the world all wrong.",
            type: .text
        ),
        Message(
            image: nil,
            emoji: Emoji(name: "you_sorry"),
            member: .you,
            text: "Are you okay? You must have freaked out.",
            type: .text
        ),
        Message(
            image: nil,
            emoji: Emoji(name: "you_hmm"),
            member: .you,
            text: "Well..",
            type: .text
        ),
        Message(
            image: Media(cover: nil, width: nil, height: nil, url: "dress"),
            emoji: nil,
            member: .you,
            text: "The picture of dress",
            type: .image
        ),
        Message(
            image: nil,
            emoji: nil,
            member: .you,
            text: "Have you seen this picture?",
            type: .text
        ),
        Message(
            image: nil,
            emoji: nil,
            member: .you,
            text: "Regardless of color blindness, what color does this dress look like?",
            type: .text
        ),
        Message(
            image: nil,
            emoji: nil,
            member: .you,
            text: "white-gold? black-blue?",
            type: .text
        ),
    ]
        
    static let all2: [Message] = [
        Message(
            image: nil,
            emoji: Emoji(name: "me_hmm"),
            member: .me,
            text: "Is this it? What's the answer?",
            type: .text
        ),
        Message(
            image: nil,
            emoji: Emoji(name: "you_serious"),
            member: .you,
            text: "From what I've heard, it doesn't matter what the correct answer is.",
            type: .text
        ),
        Message(
            image: nil,
            emoji: nil,
            member: .you,
            text: "There are two processes involved in perceiving color",
            type: .text
        ),
        Message(
            image: nil,
            emoji: nil,
            member: .you,
            text: "the activation of cells in the retina",
            type: .text
        ),
        Message(
            image: nil,
            emoji: nil,
            member: .you,
            text: "and the interpretation by the brain",
            type: .text
        ),
        Message(
            image: nil,
            emoji: nil,
            member: .you,
            text: "As the brain interprets the stimulus from the cone, the same stimulus can be interpreted differently by different people based on their experience and context..",
            type: .text
        ),
        Message(
            image: nil,
            emoji: nil,
            member: .you,
            text: "But different people have different levels of cone activation, different experiences, and probably very few people see the exact same colors..",
            type: .text
        ),
        Message(
            image: nil,
            emoji: Emoji(name: "you_hmm"),
            member: .you,
            text: "So maybe you don't see the color wrong, you just see it differently.?",
            type: .text
        ),
        Message(
            image: nil,
            emoji: Emoji(name: "me_smile"),
            member: .me,
            text: "Oh, I hadn't thought of it that way",
            type: .text
        ),        Message(
            image: nil,
            emoji: nil,
            member: .me,
            text: "I think so 😋",
            type: .text
        ),
        Message(
            image: nil,
            emoji: Emoji(name: "you_excited"),
            member: .you,
            text: "I want to know how you see the world.",
            type: .text
        ),
        Message(
            image: nil,
            emoji: Emoji(name: "me_hehe"),
            member: .me,
            text: "It won't be perfect because of your interpretation, but do you want to see it?",
            type: .text
        ),
        Message(
            image: nil,
            emoji: nil,
            member: .you,
            text: "Sure..!",
            type: .text
        )
    ]
}
