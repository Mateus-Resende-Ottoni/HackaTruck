//
//  PaletteView.swift
//  Presentations
//
//  Created by Mateus Ottoni on 03/04/25.
//
//

import SwiftUI

// Struct personalizada para definir paleta de cores
struct ColorPalette {
    var background1: Color
    var background1_detail: Color
    var background2: Color
    var background2_detail: Color
    var detail1: Color
    var detail2: Color
    var detail3: Color
    var text1: Color
    var text1_detail: Color
}

struct PaletteView: View {
    
    // Paleta de cores
    var paleta1 = ColorPalette(
        background1:        Color(red: 0.53, green: 0.80, blue: 0.92),
        background1_detail: Color(red: 0.35, green: 0.60, blue: 0.85),
        background2:        Color.white,
        background2_detail: Color(red: 0.75, green: 0.75, blue: 0.80),
        detail1:            Color(red: 0.95, green: 0.70, blue: 0.15),
        detail2:            Color(red: 0.95, green: 0.55, blue: 0.15),
        detail3:            Color(red: 0.95, green: 0.40, blue: 0.15),
        text1:              Color.black,
        text1_detail:       Color(red: 0.40, green: 0.15, blue: 0.20) )
    
    var paleta2 = ColorPalette(
        background1:        Color(red: 1.00, green: 0.75, blue: 0.79),
        background1_detail: Color(red: 0.95, green: 0.50, blue: 0.65),
        background2:        Color.white,
        background2_detail: Color(red: 0.80, green: 0.75, blue: 0.75),
        detail1:            Color(red: 0.15, green: 0.80, blue: 0.95),
        detail2:            Color(red: 0.15, green: 0.60, blue: 0.95),
        detail3:            Color(red: 0.15, green: 0.40, blue: 0.95),
        text1:              Color.black,
        text1_detail:       Color(red: 0.30, green: 0.15, blue: 0.40) )
    
    var paleta3 = ColorPalette(
        background1:        Color(red: 0.31, green: 0.78, blue: 0.46),
        background1_detail: Color(red: 0.10, green: 0.65, blue: 0.30),
        background2:        Color.white,
        background2_detail: Color(red: 0.75, green: 0.80, blue: 0.75),
        detail1:            Color(red: 0.75, green: 0.10, blue: 0.55),
        detail2:            Color(red: 0.65, green: 0.10, blue: 0.60),
        detail3:            Color(red: 0.50, green: 0.10, blue: 0.75),
        text1:              Color.black,
        text1_detail:       Color(red: 0.20, green: 0.20, blue: 0.40) )
    
    @State var paleta : ColorPalette = ColorPalette(
        background1:        Color(red: 0.53, green: 0.80, blue: 0.92),
        background1_detail: Color(red: 0.35, green: 0.60, blue: 0.85),
        background2:        Color.white,
        background2_detail: Color(red: 0.75, green: 0.75, blue: 0.80),
        detail1:            Color(red: 0.95, green: 0.70, blue: 0.15),
        detail2:            Color(red: 0.95, green: 0.55, blue: 0.15),
        detail3:            Color(red: 0.95, green: 0.40, blue: 0.15),
        text1:              Color.black,
        text1_detail:       Color(red: 0.40, green: 0.15, blue: 0.20) )
    
    @State var estado : Int = 0
    
    var body: some View {
        ZStack {
            
            Color.gray
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Button {
                        if (estado == 0) {
                            paleta = paleta1
                            estado = 1
                        } else if (estado == 1) {
                            paleta = paleta2
                            estado = 2
                        } else if (estado == 2) {
                            paleta = paleta3
                            estado = 3
                        } else if (estado == 3){
                            paleta = paleta1
                            estado = 1
                        }
                    } label: {
                        Text("Mudar paleta")
                            .fontWeight(.bold)
                            .foregroundStyle(.black)
                    } // Fim Button
                } // Fim HStack
                Rectangle()
                    .foregroundStyle(paleta.background1)
                Rectangle()
                    .foregroundStyle(paleta.background1_detail)
                Rectangle()
                    .foregroundStyle(paleta.background2)
                Rectangle()
                    .foregroundStyle(paleta.background2_detail)
                Rectangle()
                    .foregroundStyle(paleta.detail1)
                Rectangle()
                    .foregroundStyle(paleta.detail2)
                Rectangle()
                    .foregroundStyle(paleta.detail3)
                Rectangle()
                    .foregroundStyle(paleta.text1)
                Rectangle()
                    .foregroundStyle(paleta.text1_detail)
                
            } // Fim VStack
            .padding()
            
        } // Fim ZStack
    }
}

#Preview {
    PaletteView()
}
