//
//  FilterTypeStaticSliderView.swift
//  
//
//  Created by sei on 2023/04/20.
//

import SwiftUI

struct FilterTypeStaticSliderView: View {
    var data: FilterData
    var body: some View {
        VStack {
            Text(data.typeName)
                .font(.title3)
                .bold()
            Slider(value: .constant(data.first), in: 0...2, step: 1)
                .tint(.red)
            Slider(value: .constant(data.second), in: 0...2, step: 1)
                .tint(.green)
            Slider(value: .constant(data.thrid), in: 0...2, step: 1)
                .tint(.blue)
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.gray)
                .opacity(0.5)
//                .border(Color.black, width: 2)
                
            
        )
       
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        FilterTypeStaticSliderView(data: FilterData(typeName:"Protanopia" ,first: 0, second: 2, thrid: 2))
        FilterTypeStaticSliderView(data: FilterData(typeName:"Protanopia2" ,first: 1, second: 1, thrid: 1))
       
    }
}
