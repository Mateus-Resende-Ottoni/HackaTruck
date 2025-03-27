//
//  MusicView.swift
//  DesafioHacka09
//
//  Created by Mateus Ottoni on 26/03/25.
//

import SwiftUI

struct CharacterView: View {
    
    @State var personagem : HaPo
    
    // Paleta de cores
    var paletaDeCores : ColorPalette =
    ColorPalette(background1: Color(red: 0.67, green: 0, blue: 0.01),
                 background2: Color(red: 0.82, green: 0.65, blue: 0.14),
                 text: Color.white,
                 details1: Color(red: 0.45, green: 0.01, blue: 0.01),
                 details2: Color(red: 0.93, green: 0.72, blue: 0.18),
                 details3: Color.black)
    
    var body: some View {
        
        ZStack {
            paletaDeCores.background1
                .ignoresSafeArea()
            VStack {
                ZStack {
                    AsyncImage (url: URL(string: personagem.image ?? "")) { image in
                        image.resizable()
                            .scaledToFit()
                            .padding([.leading, .trailing], 30)
                    } placeholder: {
                        AsyncImage (url: URL(string: "https://www.reddit.com/media?url=https%3A%2F%2Fpreview.redd.it%2Fq08mlyj6xxc21.jpg%3Fauto%3Dwebp%26s%3D902e2b7bc5f4edb2f0ec645e495de662d032bdda&rdt=43928")) { image in
                            image.resizable()
                                .scaledToFit()
                                .padding([.leading, .trailing], 30)
                        } placeholder: {
                            ProgressView()
                                .shadow(color: paletaDeCores.details3 ,radius: 1)
                                .shadow(color: paletaDeCores.details3 ,radius: 1)
                                .shadow(color: paletaDeCores.details3 ,radius: 1)
                        } // Fim AsyncImage
                    } // Fim AsyncImage
                    .clipShape(Circle())
                    .frame(width: 355)
                    .shadow(color:paletaDeCores.details3 , radius: 3)
                    .shadow(color:paletaDeCores.background2 , radius: 1)
                    .shadow(color:paletaDeCores.background2 , radius: 1)
                    .shadow(color:paletaDeCores.background2 , radius: 1)
                    .shadow(color:paletaDeCores.background2 , radius: 1)
                    .padding(45)
                    VStack {
                        Text(personagem.name ?? "Personagem Misterioso")
                            .font(.title)
                            .fontWeight(.bold)
                            .shadow(color:paletaDeCores.background2 ,radius: 2)
                        Spacer()
                        HStack {
                            if (personagem.wizard ??  false) {
                                Image(systemName: "wand.and.stars")
                                    .font(.custom("ComicSans", fixedSize: 35))
                                    .foregroundStyle(paletaDeCores.details2)
                                    .shadow(color:paletaDeCores.details3 , radius: 2)
                                    .shadow(color:paletaDeCores.details3 , radius: 2)
                            }
                            if (personagem.hogwartsStudent ?? false) {
                                Image(systemName: "graduationcap.fill")
                                    .font(.custom("ComicSans", fixedSize: 35))
                                    .foregroundStyle(paletaDeCores.details2)
                                    .shadow(color:paletaDeCores.details3 , radius: 2)
                                    .shadow(color:paletaDeCores.details3 , radius: 2)
                            }
                            if (personagem.hogwartsStaff ?? false) {
                                Image(systemName: "shared.with.you.circle")
                                    .font(.custom("ComicSans", fixedSize: 35))
                                    .foregroundStyle(paletaDeCores.details2)
                                    .shadow(color:paletaDeCores.details3 , radius: 2)
                                    .shadow(color:paletaDeCores.details3 , radius: 2)
                            }
                            if (personagem.alive ?? true) {
                                Image(systemName: "cross.fill")
                                    .font(.custom("ComicSans", fixedSize: 35))
                                    .foregroundStyle(paletaDeCores.details2)
                                    .shadow(color:paletaDeCores.details3 , radius: 2)
                                    .shadow(color:paletaDeCores.details3 , radius: 2)
                            } else {
                                ZStack {
                                    Image(systemName: "cross")
                                        .font(.custom("ComicSans", fixedSize: 35))
                                        .foregroundStyle(paletaDeCores.details2)
                                        .shadow(color:paletaDeCores.details3 , radius: 2)
                                        .shadow(color:paletaDeCores.details3 , radius: 2)
                                    Image(systemName: "xmark")
                                        .font(.custom("ComicSans", fixedSize: 40))
                                        .foregroundStyle(paletaDeCores.details3)
                                        .shadow(color:paletaDeCores.details2 , radius: 2)
                                        .shadow(color:paletaDeCores.details2 , radius: 2)
                                } // Fim ZStack
                            }
                        } // Fim HStack
                    }
                } // Fim ZStack
                
                ZStack {
                    paletaDeCores.background2
                    VStack {
                        Text("\(personagem.gender ?? "Genderless") \(personagem.species ?? "Being")")
                        Text("\(personagem.hairColour ?? "Colorless") hair")
                        Text("\(personagem.eyeColour ?? "Colorless") eyes")
                        Text("Interpreted by \(personagem.actor ?? "someone")")
                    }
                } // Fim ZStack
                
            } // Fim VStack
            
            
        } // Fim ZStack
        
    } // Fim body
}

//#Preview {
    //CharacterView(personagem: nil)
//}
