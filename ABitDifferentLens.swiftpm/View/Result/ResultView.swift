import SwiftUI

struct ResultView: View {
    @ObservedObject var sceneManager: SceneManager
    
    var body: some View {
        VStack {
            Image("result_prota")
                .resizable()
                .renderingMode(.original)
                .scaledToFit()
                .padding(.bottom)
            explain()
            Spacer()
            Button {
                sceneManager.gotoNextScene()
            } label: {
                Text("OMG...😣")
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
            }
        }
    }
    
    func explain() -> some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("You are a moderate Protania.")
                    .font(.title)
                Text("Why does color blindness happen?")
                    .bold()
                scaledFitImage("colcon")
                Text("Color blindness or color vision deficiency (CVD) is the decreased ability to see color or differences in color.")
                Text("The most common cause of color blindness is an inherited problem or variation in the functionality of one or more of **the three classes of cone cells** in the retina, which mediate color vision.")
                Text("Color blindness can also result from **physical or chemical damage** to the eye, the optic nerve, or parts of the brain.")
                scaledFitImage("color_blindness")
            }.padding()
        }
        
    }
    
    func scaledFitImage(_ imageName: String) -> some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .padding()
            
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        let sceneManager = SceneManager()
        ResultView(sceneManager: sceneManager)
    }
}
