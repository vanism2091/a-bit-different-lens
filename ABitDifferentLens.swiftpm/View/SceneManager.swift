import SwiftUI

class SceneManager: ObservableObject {
    enum Scene {
        case intro, test, result, message1, message2
        
        var nextScene: Scene? {
            switch self {
            case .intro:
                return .test
            case .test:
                return .result
            case .result:
                return .message1
            case .message1:
                return .message2
            case .message2:
                return .intro
            }
        }
    }
    
    private let initialScene: Scene
    @Published private var currentScene: Scene
    
    init(scene: Scene = .intro) {
        self.initialScene = scene
        self.currentScene = scene
    }
    
    func getCurrentScene() -> Scene {
        currentScene
    }
    
    func gotoNextScene() {
        withAnimation {
            if let nextScene = currentScene.nextScene {
                currentScene = nextScene
            }
        }
    }
}
