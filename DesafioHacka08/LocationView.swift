//
//  LocationView.swift
//  DesafioHacka08
//
//  Created by Mateus Ottoni on 25/03/25.
//

import SwiftUI

struct LocationView: View {
    
    @Binding var local : Location
    
    var paletaDeCores : ColorPalette =
    ColorPalette(background1: Color(red: 0.85, green: 0.60, blue: 0.95),
                 background2: Color(red: 0.6, green: 0.9, blue: 0.55),
                 text: Color.black,
                 details1: Color.white,
                 details2: Color.black)
    
    var body: some View {
        ZStack {
            LinearGradient( colors:
                    [paletaDeCores.background1,
                     paletaDeCores.background2,
                     paletaDeCores.background2],
                startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
            VStack {
                AsyncImage (url: URL(string: local.foto)) { image in
                    image.resizable()
                        .scaledToFit()
                        .padding([.leading, .trailing], 30)
                } placeholder: {
                    ProgressView()
                        .shadow(color: paletaDeCores.details2 ,radius: 1)
                }
                .frame(width:  350, height: 300)
                .border(paletaDeCores.details2, width: 6)
                .border(paletaDeCores.details1, width: 4)
                .border(paletaDeCores.details2, width: 2)
                .padding(30)
                Spacer()
                Text(local.nome)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .shadow(color: paletaDeCores.details1 ,radius: 2, x: 1, y: 1)
                    .shadow(color: paletaDeCores.details1 ,radius: 2, x: -1, y: -1)
                    .shadow(color: paletaDeCores.background1 ,radius: 1)
                    .shadow(color: paletaDeCores.background1 ,radius: 1)
                ScrollView {
                    ZStack {
                        paletaDeCores.background1
                        Text(local.descricao)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding([.leading, .trailing], 35)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    struct Preview: View {
        @State var previa : Location =
        Location(nome: "Bem Mineiro", foto: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/13/c0/e5/e3/photo0jpg.jpg?w=900&h=500&s=1", descricao: "Restaurante", latitude: -19.92372594270958, longitude: -43.96739327158192)
        var body: some View {
            LocationView(local: $previa)
        }
    }
    return Preview()
}
