import SwiftUI

struct IntroView: View {
    @ObservedObject var sceneManager: SceneManager
    @State private var isMe = false
    @State private var progress: CGFloat = 0
    @State private var isShownSheet: Bool = false
    
    var gradient1: Gradient {
        isMe ?
            Gradient(colors: [.protanopiaRed, .protanopiaGreen]) :
            Gradient(colors: [.red, .green])
    }
    var gradient2: Gradient {
        isMe ?
            Gradient(colors: [.protanopiaBlue, .protanopiaPurple]) :
            Gradient(colors: [.blue, .purple])
    }
    
    var body: some View {
            ZStack {
                background()
                VStack {
                    HStack {
                        Spacer()
                        Toggle(isOn: $isMe.animation(.easeInOut)) {
                            Text("Me")
                                .foregroundColor(.white)
                                .bold()
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                    }
                    .padding()
                    VStack(alignment: .leading) {
                        Spacer()
                        TitleView(isMe: isMe)
                            .padding()
                        Spacer()
                        
                        
                    }
                    goNext()
                }
                .padding()
                    .sheet(isPresented: $isShownSheet) {
                        CameraView()
                    }
            }
            .onAppear {
                withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: true))  {
                    progress = 1.0
                }
            }
    }
    
    private func background() -> some View {
        Rectangle()
            .animatableGradient(fromGradient: gradient1, toGradient: gradient2, progress: progress)
            .ignoresSafeArea()
    }
    
    private func goNext() -> some View {
        Button {
            if isMe {
                sceneManager.gotoNextScene()                
            } else {
                isShownSheet = true
            }

        } label: {
            HStack {
                Text("Start")
                Image(systemName: isMe ? "play" : "camera") 

            }
            .padding()
            .background(Color.white.opacity(0.5))
            .cornerRadius(8)
        }
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        let sceneManager = SceneManager()
        IntroView(sceneManager: sceneManager)
    }
}
