import SwiftUI

struct MessageRow: View {
    let message: Message
    let isMe: Bool
    private var hasTail: Bool {
        message.emoji != nil
    }
    enum MessageRowConstant {
        static let avatarWidth: CGFloat = max(32, UIScreen.main.bounds.width / 20)
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            if isMe { Spacer() } else { Avatar(icon: message.emoji) }
            
            switch message.type {
            case .text:
                TextMessage(
                    isMe: isMe,
                    hasTail: hasTail,
                    text: message.text ?? ""
                )
            case .image:
                if let imageUrl = message.image?.url {
                    ImageMessage(
                        isMe: isMe,
                        hasTail: hasTail,
                        url: imageUrl
                    )
                }
            }
            
            if !isMe { Spacer() } else { Avatar(icon: message.emoji) }
        }
        .padding(.init(top: 8, leading: 12, bottom: 8, trailing: 12))
    }
    
    struct Avatar: View {
        let icon: Emoji?
        
        var body: some View {
            Group {
                if let icon {
                    Image(icon.name)
                        .resizable()
                        .frame(width: MessageRowConstant.avatarWidth, height: MessageRowConstant.avatarWidth)
                } else {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: MessageRowConstant.avatarWidth, height: 0)
                }
            }
            
            
        }
    }
    
    struct ImageMessage: View {
        let isMe: Bool
        let hasTail: Bool
        let url: String
        
        var body: some View {
            HStack {
                Image(url)
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .frame(maxWidth: UIScreen.main.bounds.width / 2)
                    .background(Background(isMe: isMe))
            }
            .tailing(isMe: isMe, hasTail: hasTail)
        }
    }
    
    struct TextMessage: View {
        let isMe: Bool
        let hasTail: Bool
        let text: String
        
        var body: some View {
            HStack {
                Text(text)
                    .font(.title3)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 10)
                    .foregroundColor(.white)
                    .background(Background(isMe: isMe))
            }
            .tailing(isMe: isMe, hasTail: hasTail)
        }
    }
    
    
}

fileprivate struct Background: View {
    var isMe: Bool
    
    var body: some View {
        RoundedRectangle(cornerRadius: 4)
            .foregroundColor(isMe ? Color.protanopiaBlue : Color(uiColor: UIColor.systemGray3))
    }
}

struct MessageRow_Previews: PreviewProvider {
    static var previews: some View {
        MessageRow(message: Message.all1[0], isMe: false)
            .previewLayout(.sizeThatFits)
        MessageRow(message: Message.all1[1], isMe:true)
            .previewLayout(.sizeThatFits)
    }
}
