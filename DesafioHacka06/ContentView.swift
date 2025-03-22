//
//  ContentView.swift
//  DesafioHacka06
//
//  Created by Mateus Ottoni on 21/03/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var nome: String = "Usuario"
    @State var sobrenome: String = "Silva"
    @State var presentSheet: Bool = false
    
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
        NavigationStack {
        ZStack {
            backgroundGradient
                .ignoresSafeArea(edges: [.top, .bottom])
            VStack {
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .padding(25)
                    .padding(.bottom, 100)
                Spacer()
                VStack {
                    NavigationLink(destination: Modo1View(nome: $nome, sobrenome: $sobrenome)) {
                        VStack{
                            Text("Modo 1")
                                .fontWeight(.bold)
                                .font(.title)
                                .shadow(radius: 1)
                        }
                        .frame(width: 250, height: 80)
                        .background(colorB)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(radius: 5)
                    }
                    NavigationLink(destination: Modo2View(nome: $nome, sobrenome: $sobrenome)) {
                        VStack {
                            Text("Modo 2")
                                .fontWeight(.bold)
                                .font(.title)
                                .shadow(radius: 1)
                        }
                        .frame(width: 250, height: 80)
                        .background(colorB)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(radius: 5)
                    }
                    Button {
                        presentSheet.toggle()
                    } label: {
                        Text("Modo 3")
                            .fontWeight(.bold)
                            .font(.title)
                            .shadow(radius: 1)
                    }
                    .frame(width: 250, height: 80)
                    .background(colorB)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(radius: 5)
                    .sheet(isPresented: $presentSheet) {
                        print("Sheet dismissed!")
                    } content: {
                        Modo3View(nome: $nome, sobrenome: $sobrenome)
                    }
                    Spacer()
                } // Fim VStack
                
            } // Fim VStack maior
                
            } // Fim NavigationStack
        }
        
    }
}

#Preview {
    ContentView()
}
