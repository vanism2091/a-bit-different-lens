import SwiftUI

struct ContentView: View {
    @ObservedObject var sceneManager: SceneManager
    
    private var currentScene: SceneManager.Scene {
        sceneManager.getCurrentScene()
    }
    
    var body: some View {
        Group {
            switch currentScene {
            case .intro:
                IntroView(sceneManager: sceneManager)
            case .test:
                TestView(sceneManager: sceneManager)
            case .result:
                ResultView(sceneManager: sceneManager)
            case .message1:
                MessageView(sceneManager: sceneManager, isFirst: true)
            case .message2:
                MessageView(sceneManager: sceneManager)
            }
        }
    }
}
