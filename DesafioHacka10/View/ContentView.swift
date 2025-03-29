//
//  ContentView.swift
//  DesafioHacka10
//
//  Created by Mateus Ottoni on 27/03/25.
//

import SwiftUI

// Struct personalizada para definir paleta de cores
struct ColorPalette {
    var background1: Color
    var background2: Color
    var background3: Color
    var background3_detail: Color
    var text1: Color
    var text1_detail: Color
    var text2: Color
    var text2_detail: Color
    var detail1: Color
    var detail1_1: Color
    var detail1_2: Color
}

struct ContentView: View {
    
    // Paleta de cores
    var paletaDeCores : ColorPalette =
    ColorPalette(background1:           Color(red: 0.05, green: 0.20, blue: 0.80),
                 background2:           Color(red: 0.10, green: 0.85, blue: 0.50),
                 background3:           Color(red: 0.99, green: 0.84, blue: 0.53),
                 background3_detail:    Color(red: 0.99, green: 0.92, blue: 0.65),
                 text1:                 Color(red: 0.87, green: 0.63, blue: 0.00),
                 text1_detail:          Color(red: 1.00, green: 0.89, blue: 0.00),
                 text2:                 Color(red: 0.87, green: 0.48, blue: 0.22),
                 text2_detail:          Color(red: 0.99, green: 0.75, blue: 0.43),
                 detail1:               Color(red: 0.04, green: 0.62, blue: 0.05),
                 detail1_1:             Color(red: 0.18, green: 0.81, blue: 0.06),
                 detail1_2:             Color(red: 0.00, green: 0.20, blue: 0.13)
    )
    
    var body: some View {
        
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "homekit")
                }
                
            CharacterView()
                .tabItem {
                    Label("Characters", systemImage: "person.2.circle")
                }
            
        } // Fim TabView
        .onAppear() {
            UITabBar.appearance().backgroundColor = UIColor(paletaDeCores.background3)
        }
        .tint(paletaDeCores.text2)
        

    }
    
    
    
}

#Preview {
    ContentView()
}
