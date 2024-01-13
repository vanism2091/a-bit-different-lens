import SwiftUI

@main
struct MyApp: App {
    private let sceneManager = SceneManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView(sceneManager: sceneManager)
        }
    }
}
