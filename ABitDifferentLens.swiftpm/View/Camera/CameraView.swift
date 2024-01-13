
import SwiftUI

struct CameraView: View {
    @Environment(\.dismiss) var dismiss
    
    @StateObject private var model = DataModel()
    
    private static let barHeightFactor = 0.15
    private static let filterSize = CGSize(width: 200, height:200)
    @State private var showingFilterType = false
    
    var body: some View {
        GeometryReader { geometry in
            Group {
                if model.filterType != .none {
                    ViewfinderView(image:  $model.filteredImage )
                } else {
                    ViewfinderView(image:  $model.viewfinderImage )
                }
                
            }
            .overlay(alignment: .top) {
                ZStack {
                    Color.black
                        .opacity(0.75)
                        .frame(height: geometry.size.height * Self.barHeightFactor)
                    HStack {
                        Button {
                            dismiss()
                        } label : {
                            Text("< Back")
                                .padding()
                        }
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        Text(model.filterType.filterData.typeName)
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.white)
                        Spacer()
                    }
                    
                }
                
            }
            .overlay(alignment: .bottom) {
                VStack {
                    filterScrollView()
                    buttonsView()
                        .frame(height: geometry.size.height * Self.barHeightFactor)
                        .background(.black.opacity(0.75))
                }
            }
            .overlay(alignment: .center)  {
                Color.clear
                    .frame(height: geometry.size.height * (1 - (Self.barHeightFactor * 2)))
                    .accessibilityElement()
                    .accessibilityLabel("View Finder")
                    .accessibilityAddTraits([.isImage])
            }
            .background(.black)
        }
        .task {
            await model.camera.start()
        }
        .navigationTitle("Camera")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarHidden(true)
        .ignoresSafeArea()
        .statusBar(hidden: true)
    }
    
    private func filterScrollView() -> some View {
        ScrollView(.horizontal) {
            HStack(alignment: .bottom) {
                
                ForEach(ColorBlindType.allCases, id: \.self) { item in
                    Button {
                        model.changeFilterType(to: item)
                        withAnimation {
                            showingFilterType = false
                        }
                    } label : {
                        FilterTypeStaticSliderView(data: item.filterData)
                    }
                }
                .frame(width: Self.filterSize.width, height: Self.filterSize.height)
            }
        }
        .opacity(showingFilterType ? 1 : 0)
        
    }
    
    private func buttonsView() -> some View {
        HStack(spacing: 60) {
            Spacer()
            Button {
                model.camera.switchCaptureDevice()
            } label: {
                Label("Switch Camera", systemImage: "arrow.triangle.2.circlepath")
                    .font(.system(size: 36, weight: .bold))
                    .foregroundColor(.white)
            }
            
            Button {
                showingFilterType.toggle()
            } label: {
                if model.filterType != .none {
                    Label("Filter Off", systemImage: "camera.macro.circle.fill")
                        .font(.system(size: 36, weight: .bold))
                        .foregroundColor(.white)
                } else {
                    Label("Filter On", systemImage: "camera.macro.circle")
                        .font(.system(size: 36, weight: .bold))
                        .foregroundColor(.white)
                }
            }
            Spacer()
            
        }
        .buttonStyle(.plain)
        .labelStyle(.iconOnly)
        .padding()
    }
    
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
            .preferredColorScheme(.dark)
        CameraView()
            .preferredColorScheme(.light)
    }
}
