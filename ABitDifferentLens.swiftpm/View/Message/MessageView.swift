import SwiftUI

struct MessageView: View {
    @ObservedObject var sceneManager: SceneManager
    @State var isFirst = false
    @State var isShownSheet = false
    @State var isShownCamera = false
    
    var body: some View {
        VStack {
            VStack {
                if let youIcon = Member.you.icon {
                    Image(youIcon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                }
                Text(Member.you.name)
                
            }
            Divider()
            ScrollView {
                MessageListView(isFirst: isFirst)
                    .fadeInOut()
                buttons()
            }
        }
        .sheet(isPresented: $isShownSheet) {
            CameraView()
        }
    }
    
    @ViewBuilder
    func buttons() -> some View {
        if isFirst {
            blackOrWhiteButton()
        } else {
            sureButton()
        }
    }
    
    func blackOrWhiteButton() -> some View {
        HStack {
            Button {
                sceneManager.gotoNextScene()
            } label: {
                Text("White-Gold")
                    .padding()
                    .background(Color.gray.opacity(0.25))
                    .cornerRadius(8)
            }
            Button {
                sceneManager.gotoNextScene()
            } label: {
                Text("Black-Blue")
                    .padding()
                    .background(Color.gray.opacity(0.25))
                    .cornerRadius(8)
            }
        }
    }
    
    func sureButton() -> some View {
        VStack {
            Button {
                isShownSheet = true
                isShownCamera = true
            } label: {
                Text("Sure, let me see your world!")
                    .padding()
                    .background(Color.gray.opacity(0.25))
                    .cornerRadius(8)
            }
            Button {
                sceneManager.gotoNextScene()
            } label: {
                Text("Back to the Main")
                    .padding()
                    .background(Color.gray.opacity(0.25))
                    .cornerRadius(8)
            }
            .opacity(isShownCamera ? 1 : 0)
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static let sceneManager = SceneManager()
    
    static var previews: some View {
        MessageView(sceneManager: sceneManager)
        MessageView(sceneManager: sceneManager, isFirst: true)
    }
}
