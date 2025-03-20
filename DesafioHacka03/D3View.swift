//
//  D3View.swift
//  DesafioHacka03
//
//  Created by Mateus Ottoni on 19/03/25.
//

import SwiftUI

struct D3View: View {
    
    @State private var alert_state = false
    @State private var username = "Usuário"
    
    var body: some View {
        ZStack {
            VStack { // Imagem de fundo
                Image("Wallpaper_StardewValley")
                    .resizable()
                    .scaledToFill()
                    .offset(CGSize(width: 0, height: -13.5))
                    .opacity(0.3)
            }
            VStack { // Tela inicial e input de nome
                Text("Boas Vindas, Fazendeiro " + username)
                    .foregroundStyle(.black)
                    .shadow(color: .white, radius: 5)
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .padding(.top, 50)
                TextField(
                    "Usuário",
                    text: $username
                )
                .foregroundStyle(.black)
                .shadow(color: .white, radius: 5)
                .font(.title)
                .multilineTextAlignment(.center)
                .padding([.leading, .trailing], 20)
                Spacer()
                Image("Logo_StardewValley")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
                    .shadow(color: .brown, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .rotationEffect(.degrees(-5))
                    .padding()
                Image("Icon_StardewValley")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 125)
                    .shadow(color: .brown, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .padding(.bottom, 100)
                Spacer()
                Button {
                    alert_state = true
                } label: {
                    Text("Começar")
                        .foregroundStyle(.blue)
                        .shadow(color: .teal, radius: 5)
                        .font(.title)
                        .fontWeight(.bold)
                }
                .padding(.bottom, 40)
                .alert("Alerta!", isPresented: $alert_state) {
                    Button {
                        
                    } label: {
                        Text("Vamos Lá!")
                    }
                } message: {
                    Text("Vá jogar Stardew Valley!")
                        .font(.title)
                }
            }
        }
    }
}

#Preview {
    D3View()
}
