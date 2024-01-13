import SwiftUI

struct Tailing: ViewModifier {
    let isMe: Bool
    let hasTail: Bool
    
    func body(content: Content) -> some View {
        HStack(alignment: .top, spacing: 0) {
            if !isMe { Arrow(isMe: isMe, hasTail: hasTail) }
            content
            if isMe { Arrow(isMe: isMe, hasTail: hasTail) }
        }
        
    }
    
    struct Arrow: View {
        let isMe: Bool
        let hasTail: Bool
        
        var pathColor: Color {
            if !hasTail { return .clear }
            return isMe ? Color.protanopiaBlue : Color(uiColor: UIColor.systemGray3)
        }
        
        var body: some View {
            Path { path in
                path.move(to: .init(x: isMe ? 0 : 6, y: 14))
                path.addLine(to: .init(x: isMe ? 0 : 6, y: 26))
                path.addLine(to: .init(x: isMe ? 6 : 0, y: 20))
                path.addLine(to: .init(x: isMe ? 0 : 6, y: 14))
            }
            .fill(pathColor)
            .frame(width: 6, height: 30)
        }
    }
}

extension View {
    func tailing(isMe: Bool, hasTail: Bool) -> some View {
        self.modifier(Tailing(isMe: isMe, hasTail: hasTail))
    }
}
