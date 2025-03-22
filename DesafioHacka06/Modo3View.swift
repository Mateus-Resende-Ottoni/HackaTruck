//
//  Modo3View.swift
//  DesafioHacka06
//
//  Created by Mateus Ottoni on 21/03/25.
//

import SwiftUI

struct Modo3View: View {
    
    @Binding var nome: String
    @Binding var sobrenome: String
    
    @Environment(\.dismiss) private var dismiss
    
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
                Text("Sheet View")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                VStack {
                    Text("Nome: \(nome)")
                    Text("Sobrenome: \(sobrenome)")
                }
                .frame(width: 250, height: 150)
                .background(colorB)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 5)
                Spacer()
                Button {
                    dismiss()
                } label: {
                    Text("Cancelar")
                }
                .foregroundStyle(.white)
                .frame(width: 150, height: 40)
                .background(.brown)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 5)
            }
            
        }

    } // Fim do body
}

//#Preview {
    //Modo3View()
//}
