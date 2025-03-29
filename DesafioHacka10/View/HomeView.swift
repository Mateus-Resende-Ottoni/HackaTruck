//
//  HomeView.swift
//  DesafioHacka10
//
//  Created by Mateus Ottoni on 27/03/25.
//

import SwiftUI

struct HomeView: View {
    
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
        ZStack {
            Image("Home_Wallpaper")
                .resizable()
                .ignoresSafeArea()
            VStack {
                Spacer()
                Image("Home_Logo")
                    .resizable()
                    .scaledToFit()
                    .padding()
                Spacer()
            } // Fim VStack
                    
        } // Fim ZStack
    }
}

#Preview {
    HomeView()
}
