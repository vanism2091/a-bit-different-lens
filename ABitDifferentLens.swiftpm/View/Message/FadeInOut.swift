import SwiftUI

struct FadeInOut: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .mask {
                Rectangle()
                    .overlay(alignment: .bottom) {
                        ScrollMask(isTop: false)
                    }
            }
    }
    
    struct ScrollMask: View {
        let isTop: Bool
        
        var body: some View {
            LinearGradient(colors: [.black, .clear], startPoint: UnitPoint(x: 0.5, y: isTop ? 0 : 1), endPoint: UnitPoint(x: 0.5, y: isTop ? 1 : 0))
                .frame(height: 150)
                .frame(maxWidth: .infinity)
                .blendMode(.destinationOut)
        }
    }
}

extension View {
    func fadeInOut() -> some View {
        self.modifier(FadeInOut())
    }
}
