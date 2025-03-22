//
//  Modo2AltView.swift
//  DesafioHacka06
//
//  Created by Mateus Ottoni on 21/03/25.
//

import SwiftUI

struct Modo2AltView: View {

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
                    Text("Volte, \(nome) \(sobrenome)!!! ")
                        .font(.title)
                        .fontWeight(.bold)
                }
                .frame(width: 350, height: 225)
                .background(colorB)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 5)
                Spacer()
            }

        }

    }
}

//#Preview {
    //Modo2AltView()
//}
