
import AVFoundation
import SwiftUI
import os.log
import CoreImage
import CoreImage.CIFilterBuiltins

final class DataModel: ObservableObject {
    let camera = Camera()
    //    let photoCollection = PhotoCollection(smartAlbum: .smartAlbumUserLibrary)
    
    @Published var viewfinderImage: Image?
    @Published var filteredImage: Image?
    @Published var thumbnailImage: Image?
    
    var isPhotosLoaded = false
    @Published var filterType = ColorBlindType.protanopia
    
    init() {
        Task {
            await handleCameraPreviews()
        }
    }
    
    func changeFilterType(to filter: ColorBlindType) {
        filterType = filter
        Task {
            await handleCameraPreviews()
        }
    }
    
    func handleCameraPreviews() async {
        Task {
            if filterType != .none {
                for await image in camera.previewStream {
                    Task { @MainActor in
                        filteredImage = applyEffect(to: image)
                    }
                }
            } else {
                let imageStream = camera.previewStream
                    .map { $0.image }
                for await image in imageStream {
                    Task { @MainActor in
                        viewfinderImage = image
                    }
                }
            }
        }
        
    }
    
    // filter function
    func applyEffect(to inputImage: CIImage) -> Image? {
        let context = CIContext()
        let filterName = "CIColorCrossPolynomial"
        guard let filter = CIFilter(name: filterName, parameters: filterType.colorVector) else {
            return nil
        }
        filter.setValue(inputImage, forKey: kCIInputImageKey)
        if let output = filter.outputImage {
            if let cgimg = context.createCGImage(output, from: output.extent) {
                let processedUIImage = UIImage(cgImage: cgimg)
                return Image(uiImage: processedUIImage)
            }
        }
        return nil
    }
}

fileprivate struct PhotoData {
    var thumbnailImage: Image
    var thumbnailSize: (width: Int, height: Int)
    var imageData: Data
    var imageSize: (width: Int, height: Int)
}

fileprivate extension CIImage {
    var image: Image? {
        let ciContext = CIContext()
        guard let cgImage = ciContext.createCGImage(self, from: self.extent) else { return nil }
        return Image(decorative: cgImage, scale: 1, orientation: .up)
    }
}

fileprivate extension CGImage {
    var image: Image? {
        return Image(decorative: self, scale: 1, orientation: .up)
    }
}

fileprivate extension Image.Orientation {
    
    init(_ cgImageOrientation: CGImagePropertyOrientation) {
        switch cgImageOrientation {
        case .up: self = .up
        case .upMirrored: self = .upMirrored
        case .down: self = .down
        case .downMirrored: self = .downMirrored
        case .left: self = .left
        case .leftMirrored: self = .leftMirrored
        case .right: self = .right
        case .rightMirrored: self = .rightMirrored
        }
    }
}

fileprivate let logger = Logger(subsystem: "com.apple.swiftplaygroundscontent.capturingphotos", category: "DataModel")
