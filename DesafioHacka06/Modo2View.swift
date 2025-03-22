//
//  Modo2View.swift
//  DesafioHacka06
//
//  Created by Mateus Ottoni on 21/03/25.
//

import SwiftUI

struct Modo2View: View {
    
    @Binding var nome: String
    @Binding var sobrenome: String
    
    var colorB = Color(red: 0.95, green: 0.85, blue: 0.5)
    
    let backgroundGradient = LinearGradient(
        colors:
            [Color(red: 0.8, green: 0.8, blue: 0.9),
             Color(red: 0.5, green: 0.8, blue: 1),
             Color(red: 0.2, green: 0.8, blue: 1),
             Color(red: 0.2, green: 0.6, blue: 0.9),
             Color(red: 0.3, green: 0.3, blue: 0.8)],
        startPoint: .top, endPoint: .bottom)
    
    var body: some View {
        ZStack {
            backgroundGradient
                .ignoresSafeArea(edges: [.top, .bottom])
            VStack {
                Text("Modo 2")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                VStack {
                    HStack {
                        TextField ("Nome", text: $nome)
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 10)
                        Spacer()
                        TextField ("Sobrenome", text: $sobrenome)
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 10)
                    }

                    
                    Text("Bem Vindo, \(nome) ")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    NavigationLink(destination: Modo2AltView(nome: $nome, sobrenome: $sobrenome) ) {
                        VStack{
                            Text("Acessar Tela")
                                .foregroundStyle(.white)
                                .fontWeight(.bold)
                        }
                        .frame(width: 150, height: 40)
                        .background(.brown)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(radius: 5)
                        
                    }
                }
                .frame(width: 350, height: 225)
                .background(colorB)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 5)
                Spacer()
            }

        }

    } // Fim do body
}

//#Preview {
    //Modo2View()
//}
