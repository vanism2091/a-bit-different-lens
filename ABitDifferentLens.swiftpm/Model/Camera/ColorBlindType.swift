
import Foundation
import CoreImage

enum ColorBlindType: String, CaseIterable {
    case none
    case deuteranomaly
    case protanopia
    case deuteranopia
    case protanomaly
    case tritanopia
    
    var filterData: FilterData {
        switch self {
        case .none:
            return FilterData(typeName: "None", first: 2, second: 2, thrid: 2)
        case .deuteranomaly:
            return FilterData(typeName: "Deuteranomaly", first: 2, second: 1, thrid: 2)
        case .protanopia:
            return FilterData(typeName: "Protanopia", first: 0, second: 2, thrid: 2)
        case .deuteranopia:
            return FilterData(typeName: "Deuteranopia", first: 2, second: 0, thrid: 2)
        case .protanomaly:
            return FilterData(typeName: "Protanomaly", first: 1, second: 2, thrid: 2)
        case .tritanopia:
            return FilterData(typeName: "Tritanopia", first: 2, second: 2, thrid: 0)
        }
    }
    
    var colorVector: [String: CIVector] {
        switch self {
        case .none:
            return ["inputRedCoefficients" : CIVector(values: [1, 0, 0, 0, 0, 0, 0, 0, 0, 0], count: 10),
                    "inputGreenCoefficients" : CIVector(values: [0, 1, 0, 0, 0, 0, 0, 0, 0, 0], count: 10),
                    "inputBlueCoefficients" : CIVector(values: [0, 0, 1, 0, 0, 0, 0, 0, 0, 0], count: 10)]
        case .deuteranomaly:
            return ["inputRedCoefficients" : CIVector(values: [0.8, 0.2, 0, 0, 0, 0, 0, 0, 0, 0], count: 10),
                    "inputGreenCoefficients" : CIVector(values: [0.25833, 0.74167, 0, 0, 0, 0, 0, 0, 0, 0], count: 10),
                    "inputBlueCoefficients" : CIVector(values: [0, 0.14167, 0.85833, 0, 0, 0, 0, 0, 0, 0], count: 10)]
        case .protanopia:
            return ["inputRedCoefficients" : CIVector(values: [0.1121, 0.8853, -0.0005, 0, 0, 0, 0, 0, 0, 0], count: 10),
                    "inputGreenCoefficients" : CIVector(values: [0.1127, 0.8897, -0.0001, 0, 0, 0, 0, 0, 0, 0], count: 10),
                    "inputBlueCoefficients" : CIVector(values: [0.0045, 0, 1.00191, 0, 0, 0, 0, 0, 0, 0], count: 10)]
        case .deuteranopia:
            return ["inputRedCoefficients" : CIVector(values: [0.2920, 0.7054, -0.0003, 0, 0, 0, 0, 0, 0, 0], count: 10),
                    "inputGreenCoefficients" : CIVector(values: [0.2934, 0.7089, 0, 0, 0, 0, 0, 0, 0, 0], count: 10),
                    "inputBlueCoefficients" : CIVector(values: [-0.02098, 0.02559, 1.0019, 0, 0, 0, 0, 0, 0, 0], count: 10)]
        case .protanomaly:
            return ["inputRedCoefficients" : CIVector(values: [0.81667, 0.18333, 0, 0, 0, 0, 0, 0, 0, 0], count: 10),
                    "inputGreenCoefficients" : CIVector(values: [0.33333, 0.66667, 0, 0, 0, 0, 0, 0, 0, 0], count: 10),
                    "inputBlueCoefficients" : CIVector(values: [0, 0.125, 0.875, 0, 0, 0, 0, 0, 0, 0], count: 10)]
        case .tritanopia:
            return ["inputRedCoefficients" : CIVector(values: [1.01595, 0.1351, 0.1488, 0, 0, 0, 0, 0, 0, 0], count: 10),
                    "inputGreenCoefficients" : CIVector(values: [-0.01542, 0.8683, 0.1448, 0, 0, 0, 0, 0, 0, 0], count: 10),
                    "inputBlueCoefficients" : CIVector(values: [0.1002, 0.8168, 0.1169, 0, 0, 0, 0, 0, 0, 0], count: 10)]
        }
    }
}
