//
//  CharacterDetailView.swift
//  DesafioHacka10
//
//  Created by Mateus Ottoni on 27/03/25.
//

import SwiftUI

struct CharacterDetailView: View {
    
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
    
    @State var personagem: SDV
    
    var body: some View {
        
        ZStack {
            LinearGradient(colors: [paletaDeCores.background2,
                                    paletaDeCores.background1,
                                    paletaDeCores.background1,
                                    paletaDeCores.background1,
                                    paletaDeCores.background2],
                           startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
            VStack {
                
                HStack {
                    
                    ZStack {
                        AsyncImage (url: URL(string: personagem.photo ?? "")) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                                .shadow(color: paletaDeCores.text1 ,radius: 1)
                                .shadow(color: paletaDeCores.text1 ,radius: 1)
                                .shadow(color: paletaDeCores.text1 ,radius: 1)
                        } // Fim AsyncImage
                        .frame(width: 125, height: 125)
                        .shadow(color:paletaDeCores.background3 , radius: 1)
                        .shadow(color:paletaDeCores.background3 , radius: 1)
                        .shadow(color:paletaDeCores.background3 , radius: 1)
                        .shadow(color:paletaDeCores.background3 , radius: 1)
                        
                        VStack {
                            if (personagem.marriage ?? false) {
                                Image("Marriage")
                                    .resizable()
                                    .frame(width: 35, height: 35)
                                    .shadow(color: .white, radius: 1)
                                    .shadow(color: .white, radius: 1)
                                    .shadow(color: .white, radius: 1)
                                    .shadow(color: .white, radius: 1)
                                    .padding(.top, 100)
                                    .padding(.leading, 100)
                            }
                        } // Fim VStack
                        
                    } // Fim ZStack
                    .padding([.trailing, .leading], 5)
                    
                    Spacer()

                    VStack {
                        Text(personagem.name)
                            .font(.custom("Stardew Valley", size: 40))
                            .shadow(color: paletaDeCores.text2_detail ,radius: 1)
                            .shadow(color: paletaDeCores.text2_detail ,radius: 1)
                            .shadow(color: paletaDeCores.text2_detail ,radius: 1)
                            .padding(.bottom, 20)
                        
                        HStack {
                            
                            Group { // Para imagem da estação
                                if (personagem.birthday_season == "Spring") {
                                    Image("Season_Spring")
                                } else if (personagem.birthday_season == "Summer") {
                                    Image("Season_Summer")
                                } else if (personagem.birthday_season == "Fall") {
                                    Image("Season_Fall")
                                } else if (personagem.birthday_season == "Winter") {
                                    Image("Season_Winter")
                                }
                            } // Fim Group
                            
                            if (personagem.birthday_day ?? -1 > 0) { // Dia do aniversário
                                
                                Text("\(personagem.birthday_day ?? 0)")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundStyle(paletaDeCores.text2)
                                    .shadow(color: paletaDeCores.text1        ,radius: 1, x: -2)
                                    .shadow(color: paletaDeCores.text2_detail ,radius: 1, x:  1)
                                    .shadow(color: paletaDeCores.text2_detail ,radius: 1, x:  1)
                                
                            } // Fim if
                                
                            
                        } // Fim HStack

                    } // Fim VStack
                    .padding(.trailing, 50)
                    
                } // Fim HStack
                .padding([.top, .bottom], 15)
                .background(paletaDeCores.background3_detail)
                .shadow(color: paletaDeCores.text2 ,radius: 2)
                .shadow(color: paletaDeCores.text2 ,radius: 2)
                .shadow(color: paletaDeCores.text2 ,radius: 2)
                .shadow(color: paletaDeCores.text2 ,radius: 2)
                .shadow(color: paletaDeCores.text2 ,radius: 2)
                .shadow(color: paletaDeCores.text2 ,radius: 1)
                .shadow(color: paletaDeCores.text2 ,radius: 1)
                .padding()
                .padding(.bottom, 30)
                
                if (personagem.lives_in?.count ?? 0 > 0 ||
                    personagem.lives_in?.count ?? 0 > 0 ||
                    personagem.family?.count ?? 0 > 0) {
                    
                    VStack {
                        
                        Group { // Para endereço
                            VStack {
                                
                                if (personagem.lives_in?.count ?? 0 > 0) {
                                    HStack {
                                        
                                        Text("Lives in: ")
                                        Spacer()
                                        if (personagem.lives_in == "Cindersap Forest") {
                                            Image("Place_CindersapForest")
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                        } else if (personagem.lives_in == "Ginger Island") {
                                            Image("Place_GingerIsland")
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                        } else if (personagem.lives_in == "Pelican Town") {
                                            Image("Place_PelicanTown")
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                        } else if (personagem.lives_in == "The Beach") {
                                            Image("Place_TheBeach")
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                        } else if (personagem.lives_in == "The Desert") {
                                            Image("Place_TheDesert")
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                        } else if (personagem.lives_in == "The Mountain") {
                                            Image("Place_TheMountain")
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                        } else if (personagem.lives_in == "Witch's Swamp") {
                                            Image("Place_WitchSwamp")
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                        }
                                        Text(personagem.lives_in ?? "")
                                        
                                    } // Fim HStack
                                } // Fim if
                                
                                if (personagem.lives_in?.count ?? 0 > 0) {
                                    HStack {
                                        
                                        Text("Address: ")
                                        Spacer()
                                        Text(personagem.address ?? "")
                                        
                                    } // Fim HStack
                                } // Fim if
                                
                            } // Fim VStack
                        } // Fim Group
                        .padding(.bottom, 5)
                        
                        Group { // Para lista de família
                            if (personagem.family?.count ?? 0 > 0) {
                                HStack {
                                    Text("Family: ")
                                    Spacer()
                                    ForEach(personagem.family ?? [""], id: \.self) { parente in
                                        Text(parente)
                                    }
                                }
                            }
                        } // Fim Group
                        
                    } // Fim VStack
                    .padding()
                    .background(paletaDeCores.background3_detail)
                    .shadow(color: paletaDeCores.text2 ,radius: 2)
                    .shadow(color: paletaDeCores.text2 ,radius: 2)
                    .shadow(color: paletaDeCores.text2 ,radius: 2)
                    .shadow(color: paletaDeCores.text2 ,radius: 2)
                    .shadow(color: paletaDeCores.text2 ,radius: 2)
                    .shadow(color: paletaDeCores.text2 ,radius: 1)
                    .shadow(color: paletaDeCores.text2 ,radius: 1)
                    .padding()
                    
                }
                
                Group { // Para lista de itens favoritos
                    if (personagem.loved_gifts?.count ?? 0 > 0) {
                        HStack {
                            Text("Favorites: ")
                            VStack {
                                ForEach(personagem.loved_gifts ?? [""], id: \.self) { item_amado in
                                    Text(item_amado)
                                }
                            }
                        }
                    }
                } // Fim Group
                .padding()
                .background(paletaDeCores.background3_detail)
                .shadow(color: paletaDeCores.text2 ,radius: 2)
                .shadow(color: paletaDeCores.text2 ,radius: 2)
                .shadow(color: paletaDeCores.text2 ,radius: 2)
                .shadow(color: paletaDeCores.text2 ,radius: 2)
                .shadow(color: paletaDeCores.text2 ,radius: 2)
                .shadow(color: paletaDeCores.text2 ,radius: 1)
                .shadow(color: paletaDeCores.text2 ,radius: 1)
                .padding()
                
                Spacer()
                
            } // Fim VStack
            
        } // Fim ZStack
        
    } // Fim body
}
#Preview {
    CharacterDetailView(personagem: SDV(
        _id: "teste",
        _rev: "teste",
        name: "Abigail",
        photo: "https://stardewvalleywiki.com/mediawiki/images/8/88/Abigail.png",
        birthday_day: 13,
        birthday_season: "Fall",
        lives_in: "Pelican Town",
        address: "Pierre's General Store",
        family: ["Pierre", "Caroline"],
        marriage: true,
        clinic_visit_day: 4,
        clinic_visit_season: "Spring",
        loved_gifts: [ "Amethyst",
                       "Banana Pudding",
                       "Blackberry Cobbler",
                       "Chocolate Cake",
                       "Monster Compendium",
                       "Pufferfish",
                       "Pumpkin",
                       "Spicy Eel"
    ]))
}
