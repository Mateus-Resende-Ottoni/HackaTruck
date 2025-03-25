//
//  ContentView.swift
//  DesafioHacka07
//
//  Created by Mateus Ottoni on 24/03/25.
//

import SwiftUI

struct ColorPalette {
    var background1: Color
    var background2: Color
    var text: Color
    var details: Color
}

struct Song: Identifiable {
    var id: Int
    var name: String
    var artist: String
    var year: Int
    var cover: String
}

struct Singer: Identifiable {
    var id: Int
    var name: String
    var photo: String
}

struct ContentView: View {

    var paletaDeCores : ColorPalette =
    ColorPalette(background1: Color(red: 0.80, green: 0.10, blue: 0.20),
                 background2: Color(red: 0.15, green: 0.0, blue: 0.1),
                 text: Color.white,
                 details: Color.white)
    
    var arrayMusicas = [
        Song(id: 1, name: "Lâmpadas Negras", artist: "TakaB", year: 2022, cover: "https://i.scdn.co/image/ab67616d0000b2733173b08b6c9d7cc6b777f21f"),
        Song(id: 2, name: "Alvorada", artist: "TakaB", year: 2023, cover: "https://i.scdn.co/image/ab67616d0000b273ae6acb19b87f95bc8ffe7050"),
        Song(id: 3, name: "Faces da Morte", artist: "TakaB", year: 2023, cover: "https://i.scdn.co/image/ab67616d0000b273004bc9fce575840e69d148d2"),
        Song(id: 4, name: "Universo 25", artist: "TakaB", year: 2023, cover: "https://i.scdn.co/image/ab67616d0000b2738b1aef18c0f536d673d39abf"),
        Song(id: 5, name: "Querido Demônio", artist: "TakaB", year: 2023, cover: "https://i.scdn.co/image/ab67616d0000b273a7430c1e7f671f22e5e7cae8"),
        Song(id: 6, name: "Tempo de Caos", artist: "TakaB", year: 2023, cover: "https://i.scdn.co/image/ab67616d0000b27394c146b55cc65720f0230eae"),
        Song(id: 7, name: "Lamentos de um Falcão", artist: "TakaB", year: 2024, cover: "https://i.scdn.co/image/ab67616d0000b273611dc2ea0a7e85643c406dbc"),
        Song(id: 8, name: "Rei dos Pesadelos", artist: "TakaB", year: 2024, cover: "https://i.scdn.co/image/ab67616d0000b2737496ddd694fa337981e14bb9"),
        Song(id: 9, name: "Do Lado de Cá", artist: "TakaB", year: 2024, cover: "https://i.scdn.co/image/ab67616d0000b273b600a93fcd30fa57ef27a5eb"),
        Song(id: 10, name: "Sete Mares", artist: "TakaB", year: 2024, cover: "https://i.scdn.co/image/ab67616d0000b273cf1b2b34df1de1144ed4614b"),
        Song(id: 11, name: "Meu Querido Rei", artist: "TakaB", year: 2024, cover: "https://i.scdn.co/image/ab67616d0000b27352f7625a9de746bfcc87af43"),
        Song(id: 12, name: "Cicatrizes do Tempo", artist: "Takab", year: 2024, cover: "https://i.scdn.co/image/ab67616d0000b2733e56a54984271c3cee290863"),
        Song(id: 13, name: "Dever de Consumação", artist: "RafãoMusic", year: 2024, cover: "https://i.scdn.co/image/ab67616d0000b273e363e8659c867c37c8271942"),
        Song(id: 14, name: "Tempo", artist: "RafãoMusic", year: 2024, cover: "https://i.scdn.co/image/ab67616d0000b2730e363b06e4ca848b23d3462b"),
        Song(id: 15, name: "Réquiem Carmesim", artist: "RafãoMusic", year: 2025, cover: "https://i.scdn.co/image/ab67616d0000b273ffc624a5197e98fb34b15452"),
        Song(id: 16, name: "Joker", artist: "RafãoMusic", year: 2025, cover: "https://i.scdn.co/image/ab67616d0000b273628645cb059e729a5d48dc2c"),
        Song(id: 17, name: "Razão do Vazio", artist: "RafãoMusic", year: 2025, cover: "https://i.scdn.co/image/ab67616d0000b273fa2d772e877da268ce5eab36"),
        Song(id: 18, name: "Juramento Vingativo", artist: "RafãoMusic", year: 2025, cover: "https://i.scdn.co/image/ab67616d0000b2731a69a4be6e9ec0c85ff7a936"),
        Song(id: 19, name: "Goodnight", artist: "oShaman", year: 2023, cover: "https://i.scdn.co/image/ab67616d0000b273a8789d438d8d5d3989cc7f62"),
        Song(id: 20, name: "Solidão", artist: "oShaman", year: 2023, cover: "https://i.scdn.co/image/ab67616d0000b2731821dbe2af4766865f8e3aa1"),
        Song(id: 21, name: "Crescer", artist: "oShaman", year: 2023, cover: "https://i.scdn.co/image/ab67616d0000b2735ab95342190bd78bc59f724a"),
        Song(id: 22, name: "Mudar", artist: "oShaman", year: 2023, cover: "https://i.scdn.co/image/ab67616d0000b2734a260bf80a3cea35f042eafe"),
        Song(id: 23, name: "Deriva", artist: "oShaman", year: 2024, cover: "https://i.scdn.co/image/ab67616d0000b273100edafde41a48fc2d1365ca"),
        Song(id: 24, name: "Nasci pra Atirar", artist: "oShaman", year: 2024, cover: "https://i.scdn.co/image/ab67616d0000b27392ac336c9bfe806771b404c7"),
        Song(id: 25, name: "Chamas Negras Mortais", artist: "Enygma", year: 2022, cover: "https://i.scdn.co/image/ab67616d0000b2735e0ae7e857a411f47778998d"),
        Song(id: 26, name: "Caçador de Recompensas", artist: "Enygma", year: 2022, cover: "https://i.scdn.co/image/ab67616d0000b273452a12707717beeaaded20c2"),
        Song(id: 27, name: "Terror em Londres", artist: "Enygma", year: 2022, cover: "https://i.scdn.co/image/ab67616d0000b27318464a8d3bb772c3132c79e1"),
        Song(id: 28, name: "Hades", artist: "Enygma", year: 2022, cover: "https://i.scdn.co/image/ab67616d0000b273c53167dc04801e64df976cea"),
        Song(id: 29, name: "Mágico Assassino", artist: "Enygma", year: 2022, cover: "https://i.scdn.co/image/ab67616d0000b27306b5679b8131aca0437ba487"),
        Song(id: 30, name: "Frio", artist: "Enygma", year: 2022, cover: "https://i.scdn.co/image/ab67616d0000b273ae0235fbe32669b6a38744f0")
    ]
    
    var arrayArtistas = [
    Singer(id: 1, name: "Rodrigo Zin", photo: "https://yt3.googleusercontent.com/5TZ08juI7iVIkU7B1ayFOHDR6tAX5fpB8TOWlkqfRimgJ0WEGHroIOGpjyV-NeVDwL2AUyeV=s160-c-k-c0x00ffffff-no-rj"),
    Singer(id: 2, name: "TakaB", photo: "https://i.scdn.co/image/ab67616100005174d3c465a866c51048a3048c52"),
    Singer(id: 3, name: "Chrono", photo: "https://i.scdn.co/image/ab6761610000e5eb3e9f7b144bbf065cdfceeec8"),
    Singer(id: 4, name: "Novatroop", photo: "https://yt3.googleusercontent.com/F3oki5DQBKxMmYFcI7p6gAebpY1Eed9eC5L3We-Z-Dj4m8oQ4Q0HPn86H3cAlBeM8LSLlU1jRWc=s900-c-k-c0x00ffffff-no-rj"),
    Singer(id: 5, name: "Henrique Mendonça", photo: "https://yt3.googleusercontent.com/1bD4CHZOf3Q1cz-2L9ElINzqoHVIo8mYbhrB27G-tBKO9uV5JahzxEbpvL-lJXwvoMwa90w=s176-c-k-c0x00ffffff-no-rj-mo"),
    Singer(id: 6, name: "oShaman", photo: "https://yt3.googleusercontent.com/GqZW4T0sVeiyJSwAG2S7KiXIbgWGuvwAdumH1IbaRv-gUjWKTf8bgndwpsEFXpDWSj6oBL0F04g=s900-c-k-c0x00ffffff-no-rj"),
    Singer(id: 7, name: "Anny", photo: "https://yt3.googleusercontent.com/U0sgzPJjII71XVEuUA3niwegOAmZ0CK-rwBtk4Q1S2ZleYoTUGJ6dvyBa4FQhKCvlD2npwDjEvw=s900-c-k-c0x00ffffff-no-rj"),
    Singer(id: 8, name: "Enygma", photo: "https://i.scdn.co/image/ab6761610000e5eb6ab81cf8cf869ce14a31fade"),
    Singer(id: 9, name: "RafãoMusic", photo: "https://yt3.googleusercontent.com/DAegCC9w2OMdQAoX7PVciE_gQLC6I6ScRAzcoXG5AUqXOxpAD405hFpXXvcYZvEpI6Z1_WS4Fw=s900-c-k-c0x00ffffff-no-rj"),
    Singer(id: 10, name: "VMZ", photo: "https://yt3.googleusercontent.com/uMN1cJrCTrxqooWElNv5LRQlPpLpK_p9QoYzJpOCxdUdbcQSA2lRkttVWvLfT66x1FiGnwoO9Q=s900-c-k-c0x00ffffff-no-rj")
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient( colors:
                        [paletaDeCores.background1,
                         paletaDeCores.background2,
                         paletaDeCores.background2],
                    startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
                VStack {
                    ScrollView {
                        Image("AlbumCover")  // Capa do álbum
                            .resizable()
                            .frame(width: 189, height: 204)
                            .shadow(color: paletaDeCores.details,radius: 2)
                            .padding()
                        Text("MateusFM")         // Nome do álbum
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundStyle(paletaDeCores.text)
                            .fontWeight(.bold)
                            .font(.title)
                            .padding(.leading, 10)
                        HStack {
                            AsyncImage (url: URL(string: "https://avatars.githubusercontent.com/u/161080996?v=4")) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                                    .shadow(color: paletaDeCores.details ,radius: 1)
                            }
                            .frame(width: 45, height: 45)
                            Text("Mateus Ottoni")           // Nome do criador
                                .foregroundStyle(paletaDeCores.text)
                            Spacer()
                        }
                        .padding(.leading, 10)
                        .padding(.bottom, 20)
                        ForEach(arrayMusicas, id: \.id) { music in
                            HStack {
                                AsyncImage (url: URL(string: music.cover)) { image in
                                    image.resizable()
                                } placeholder: {
                                    ProgressView()
                                        .shadow(color: paletaDeCores.details ,radius: 1)
                                }
                                .frame(width: 100, height: 100)
                                VStack {
                                    Text(music.name)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .foregroundStyle(paletaDeCores.text)
                                    Text(music.artist)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .font(.caption)
                                        .foregroundStyle(paletaDeCores.text)
                                }
                                Spacer()
                                NavigationLink {
                                    MusicView(musica: music)
                                } label: {
                                    Image(systemName: "ellipsis")
                                        .foregroundStyle(paletaDeCores.details)
                                        .shadow(color: paletaDeCores.details, radius: 5)
                                }
                            }
                            .padding([.trailing, .leading], 15)
                            .padding(.bottom, 10)
                        }
                        Spacer()
                        
                        Text("Sugeridos")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(paletaDeCores.text)
                        
                        .padding(.leading, 15)
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(arrayArtistas, id: \.id) { artista in
                                    VStack {
                                        AsyncImage (url: URL(string: artista.photo)) { image in
                                            image.resizable()
                                        } placeholder: {
                                            ProgressView()
                                                .shadow(color: paletaDeCores.details ,radius: 1)
                                        }
                                        .frame(width: 200, height: 200)
                                        Text(artista.name)
                                            .fontWeight(.bold)
                                            .foregroundStyle(paletaDeCores.text)
                                    }
                                    .padding(.leading, 10)
                                }
                            } // Fim HStack
                        } // Fim ScrollView


                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
