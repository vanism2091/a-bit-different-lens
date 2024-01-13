import SwiftUI

struct TestView: View {
    @ObservedObject var sceneManager: SceneManager
    
    @State private var isMe: Bool = false
    var body: some View {
        VStack {
            testHeader()
            Divider()
            Text("Please select the correct number you see in the image.")
                .font(.headline)
            testImage()
            Spacer()
            Button {
                sceneManager.gotoNextScene()
            } label: {
                Text("Nothing..🫥")
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
            }
            .opacity(isMe ? 1 : 0)
            
        }
    }
    
    func testHeader() -> some View {
        ZStack {
            HStack {
                Spacer()
                Text("Test")
                    .font(.largeTitle)
                    .bold()
                Spacer()
            }
            HStack {
                Spacer()
                Toggle(isOn: $isMe.animation(.easeInOut)) {
                    Text("Me")
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }
        }
        .padding()
    }
    
    func testImage() -> some View {
        ZStack {
            Image("test_normal2")
                .resizable()
                .renderingMode(.original)
                .scaledToFit()
            Image("test_prota")
                .resizable()
                .renderingMode(.original)
                .scaledToFit()
                .opacity(isMe ? 1 : 0)
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        let sceneManager = SceneManager()
        TestView(sceneManager: sceneManager)
    }
}
