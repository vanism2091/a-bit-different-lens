import SwiftUI

struct MessageListView: View {
    @State private var messages: [Message] = []
    @State private var isEndOfScrollView = false
    var isFirst: Bool = false
    
    var body: some View {
            LazyVStack(spacing: 0) {
                ForEach(messages) { message in
                    MessageRow(
                        message: message,
                        isMe: message.member.name == Member.me.name
                    )
                    .id(message.id)
                }
                Color.clear
                    .frame(height: UIScreen.main.bounds.height / 10)
            }
        .onAppear{
            load()
        }
        
    }
    
    func load() {
        guard messages.isEmpty else { return }
        messages = isFirst ? Message.all1 : Message.all2
    }
}

struct MessageListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MessageListView(isFirst: true)
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (11-inch) (4th generation)"))
            MessageListView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
        }
    }
}
