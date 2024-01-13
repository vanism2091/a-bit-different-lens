import SwiftUI

struct TitleView: View {
    var isMe: Bool
    
    var body: some View {
        VStack {
            GeometryReader { proxy in
                let size = proxy.size
                VStack(alignment: .leading) {
                    TitleText(content: isMe ? "I\nSee\nmy Own" : "Everybody\nSees\ntheir Own")
                    TitleText(content: "Colorful", isColorful: true)
                    TitleText(content: "World")
                }
                .scaleEffect(scale(thatFits: size), anchor: .topLeading)
            }
            
            
            Spacer()
        }
        .padding()
    }
    
    private func scale(thatFits size: CGSize) -> CGFloat {
        min(size.width, size.height) / DrawingConstants.fontScaleDenumerator
    }
    
    private struct DrawingConstants {
        static let fontSize: CGFloat = 32
        static let fontScaleDenumerator: CGFloat = 200
        static let opacity: CGFloat = 0.5
    }
}

struct TitleText: View {
    var content: String
    var isColorful: Bool = false
    var body: some View {
        Text(content)
            .font(.largeTitle)
            .bold()
            .foregroundColor(isColorful ? .white : .black)
            .kerning(isColorful ? 7 : 1)
            .opacity(0.8)
    }
}
