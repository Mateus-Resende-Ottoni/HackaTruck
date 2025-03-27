//
//  ContentView.swift
//  DesafioHacka09
//
//  Created by Mateus Ottoni on 26/03/25.
//

import SwiftUI

// Struct personalizada para definir paleta de cores
struct ColorPalette {
    var background1: Color
    var background2: Color
    var text: Color
    var details1: Color
    var details2: Color
    var details3: Color
}

struct ContentView: View {
    
    // Acesso à viewModel
    @StateObject var viewModel = ViewModel()
    
    // Paleta de cores
    var paletaDeCores : ColorPalette =
    ColorPalette(background1: Color(red: 0.45, green: 0.01, blue: 0.01),
                 background2: Color(red: 0.82, green: 0.65, blue: 0.14),
                 text: Color.white,
                 details1: Color(red: 0.67, green: 0, blue: 0.01),
                 details2: Color(red: 0.93, green: 0.72, blue: 0.18),
                 details3: Color.black)
    
    
    var body: some View {
            
        NavigationStack {
            ZStack {
                paletaDeCores.background1
                    .ignoresSafeArea()
                ZStack {
                    Image("Gryffindor_CommonRoom")
                        .resizable()
                        .frame(width: 400, height: 275)
                        .ignoresSafeArea()
                        .colorMultiply(paletaDeCores.details1)
                        .blur(radius: 1.5)
                    Image("Gryffindor_Logo")
                        .resizable()
                        .frame(width: 135, height: 150)
                        .padding(.bottom, 120)
                        .shadow(color: paletaDeCores.details2 , radius: 5)
                    
                } // Fim ZStack Topo
                .padding(.bottom, 490)
                
                ScrollView {
                    VStack {
                        ForEach(viewModel.personagens, id: \.id) { personagem in
                            
                            HStack {
                                AsyncImage (url: URL(string: personagem.image ?? "")) { image in
                                    image.resizable()
                                        .scaledToFit()
                                        .padding([.leading, .trailing], 30)
                                } placeholder: {
                                    ProgressView()
                                        .shadow(color: paletaDeCores.details3 ,radius: 1)
                                        .shadow(color: paletaDeCores.details3 ,radius: 1)
                                        .shadow(color: paletaDeCores.details3 ,radius: 1)
                                } // Fim AsyncImage
                                .clipShape(Circle())
                                .frame(width: 155)
                                
                                Text(personagem.name ?? "Personagem")
                                    .foregroundStyle(paletaDeCores.text)
                                    .fontWeight(.bold)
                                
                                Spacer()
                                NavigationLink {
                                    CharacterView(personagem: personagem)
                                } label: {
                                    Image(systemName: "ellipsis")
                                        .foregroundStyle(paletaDeCores.text)
                                } // Fim NavigationLink
                                
                            } // Fim HStack
                            .padding(.trailing, 20)
                            .padding(.bottom, 15)
                            
                        } // Fim ForEach(viewModel.personagens)
                    } // Fim VStack
                    .onAppear() {
                        viewModel.fetch()
                    }
                    
                } // Fim ScrollView
                .padding(.top, 250)
            } // Fim ZStack
        } // Fim NavigationStack

    } // Fim body
}

#Preview {
    ContentView()
}
