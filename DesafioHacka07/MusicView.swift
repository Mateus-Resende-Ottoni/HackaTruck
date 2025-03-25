//
//  MusicView.swift
//  DesafioHacka07
//
//  Created by Mateus Ottoni on 24/03/25.
//

import SwiftUI

struct MusicView: View {
    
    @State var musica : Song
    
    var paletaDeCores : ColorPalette =
    ColorPalette(background1: Color(red: 0.80, green: 0.10, blue: 0.20),
                 background2: Color(red: 0.05, green: 0.0, blue: 0.1),
                 text: Color.white,
                 details: Color.white)
    
    var body: some View {
        ZStack {
            LinearGradient( colors:
                    [paletaDeCores.background1,
                     paletaDeCores.background2,
                     paletaDeCores.background2],
                startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
            VStack {
                Spacer()
                VStack {
                    AsyncImage (url: URL(string: musica.cover)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                            .shadow(color: paletaDeCores.details ,radius: 1)
                    }
                    .frame(width: 350, height: 350)
                    .padding()
                    Text(musica.name)
                        .foregroundStyle(paletaDeCores.text)
                    Text(musica.artist)
                        .font(.caption)
                        .foregroundStyle(paletaDeCores.text)
                }
                Spacer()
                HStack {
                    Image(systemName: "shuffle")
                        .font(.custom("ComicSans", size: 30))
                        .foregroundStyle(.black)
                        .shadow(color: paletaDeCores.details, radius: 1)
                        .shadow(color: paletaDeCores.details, radius: 1)
                        .shadow(color: paletaDeCores.details, radius: 1)
                        .shadow(color: paletaDeCores.details, radius: 2)
                        .shadow(color: paletaDeCores.details, radius: 2)
                    Spacer()
                    Image(systemName: "backward.end.fill")
                        .font(.custom("ComicSans", size: 40))
                        .foregroundStyle(.black)
                        .shadow(color: paletaDeCores.details, radius: 1)
                        .shadow(color: paletaDeCores.details, radius: 1)
                        .shadow(color: paletaDeCores.details, radius: 1)
                        .shadow(color: paletaDeCores.details, radius: 2)
                        .shadow(color: paletaDeCores.details, radius: 2)
                    Spacer()
                    Image(systemName: "play.fill")
                        .font(.custom("ComicSans", size: 60))
                        .fontWeight(.bold)
                        .foregroundStyle(.black)
                        .shadow(color: paletaDeCores.details, radius: 1)
                        .shadow(color: paletaDeCores.details, radius: 1)
                        .shadow(color: paletaDeCores.details, radius: 1)
                        .shadow(color: paletaDeCores.details, radius: 2)
                        .shadow(color: paletaDeCores.details, radius: 2)
                    Spacer()
                    Image(systemName: "forward.end.fill")
                        .font(.custom("ComicSans", size: 40))
                        .foregroundStyle(.black)
                        .shadow(color: paletaDeCores.details, radius: 1)
                        .shadow(color: paletaDeCores.details, radius: 1)
                        .shadow(color: paletaDeCores.details, radius: 1)
                        .shadow(color: paletaDeCores.details, radius: 2)
                        .shadow(color: paletaDeCores.details, radius: 2)
                    Spacer()
                    Image(systemName: "repeat")
                        .font(.custom("ComicSans", size: 30))
                        .foregroundStyle(.black)
                        .shadow(color: paletaDeCores.details, radius: 1)
                        .shadow(color: paletaDeCores.details, radius: 1)
                        .shadow(color: paletaDeCores.details, radius: 1)
                        .shadow(color: paletaDeCores.details, radius: 2)
                        .shadow(color: paletaDeCores.details, radius: 2)
                }
                .padding([.trailing, .leading], 10)
                Spacer()
            }
        }
    }
}

#Preview {
    MusicView(musica: Song(id: 5, name: "Teste", artist: "Testudo", year: 2001, cover: "https://i.scdn.co/image/ab67616d0000b273af6662633178b2e1d4a206f6"))
}
