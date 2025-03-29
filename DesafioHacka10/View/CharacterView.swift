//
//  CharacterView.swift
//  DesafioHacka10
//
//  Created by Mateus Ottoni on 27/03/25.
//

import SwiftUI

struct CharacterView: View {
    
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
    
    // Acesso à viewModel
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            
            
            ZStack {
                LinearGradient(colors: [paletaDeCores.background2, paletaDeCores.background1], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                ScrollView {
                    
                    VStack {
                        
                        ForEach(viewModel.personagens, id: \._id) {
                            personagem in
                            
                            HStack {
                                AsyncImage (url: URL(string: personagem.photo ?? "")) { image in
                                    image.resizable()
                                         .scaledToFit()
                                         .padding([.leading, .trailing], 30)
                                } placeholder: {
                                    ProgressView()
                                        .shadow(color: paletaDeCores.text1 ,radius: 1)
                                        .shadow(color: paletaDeCores.text1 ,radius: 1)
                                        .shadow(color: paletaDeCores.text1 ,radius: 1)
                                } // Fim AsyncImage
                                .frame(width: 155)
                                Text(personagem.name)
                                    .font(.custom("Stardew Valley", size: 35))
                                    .shadow(color: paletaDeCores.text2_detail ,radius: 1, x:  1)
                                    .shadow(color: paletaDeCores.text2_detail ,radius: 1, x:  1)
                                    .shadow(color: paletaDeCores.text2_detail ,radius: 1, x:  1)
                                Spacer()
                                NavigationLink {
                                    CharacterDetailView(personagem: personagem)
                                } label: {
                                    Image(systemName: "ellipsis")
                                        .font(.title)
                                        .padding(.trailing, 20)
                                        .foregroundStyle(paletaDeCores.text2)
                                        .shadow(color: paletaDeCores.text1        ,radius: 1, x: -2)
                                        .shadow(color: paletaDeCores.text2_detail ,radius: 1, x:  1)
                                        .shadow(color: paletaDeCores.text2_detail ,radius: 1, x:  1)
                                }
                            } // Fim HStack
                            .padding([.top, .bottom], 10)
                            .background(paletaDeCores.background3)
                            .shadow(color: paletaDeCores.text2 ,radius: 1)
                            .shadow(color: paletaDeCores.text2 ,radius: 1)
                            .shadow(color: paletaDeCores.text2 ,radius: 1)
                            .shadow(color: paletaDeCores.text2 ,radius: 1)
                            .shadow(color: paletaDeCores.text2 ,radius: 1)
                            .shadow(color: paletaDeCores.text2 ,radius: 1)
                            .shadow(color: paletaDeCores.text2 ,radius: 1)
                            .shadow(color: paletaDeCores.text2 ,radius: 1)
                            .shadow(color: paletaDeCores.text2 ,radius: 1)
                            .shadow(color: paletaDeCores.text2 ,radius: 1)
                            .padding([.top, .bottom], 12)
                            
                            
                            
                        } // Fim ForEach
                        
                        
                        
                    } // Fim VStack
                    .onAppear() {
                        viewModel.fetch()
                    }
                    
                    
                } // Fim ScrollView
                
                
                
            } // Fim ZStack
            
            
            
            
        } // Fim NavigationStack
        
    }
}

#Preview {
    CharacterView()
}
