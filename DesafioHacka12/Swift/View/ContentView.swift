//
//  ContentView.swift
//  DesafioHacka12
//
//  Created by Mateus Ottoni on 01/04/25.
//

import SwiftUI

struct ContentView: View {
    
    // Acesso à viewModel
    @StateObject var viewModel = ViewModel();
    
    
    var body: some View {
        ZStack {
            //Color.gray
            //    .ignoresSafeArea()
            ScrollView {
                Text("Registros de Umidade")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 15)
                VStack {
                    ForEach(viewModel.registros, id: \._id) { registro in
                        
                        let umidade_float = Float(registro.umidade)
                        
                        HStack {
                            if (umidade_float ?? 0.0 > 75.0) {
                                Image(systemName: "drop.fill")
                                    .resizable()
                                    .frame(width: 150, height: 200)
                                    .foregroundStyle(.blue)
                            } else if (umidade_float ?? 0.0 > 37.5){
                                Image(systemName: "drop.halffull")
                                    .resizable()
                                    .frame(width: 150, height: 200)
                                    .foregroundStyle(.blue)
                            } else {
                                Image(systemName: "drop")
                                    .resizable()
                                    .frame(width: 150, height: 200)
                                    .foregroundStyle(.blue)
                            }
                            Text(registro.umidade)
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(.leading, 20)
                        } // Fim HStack
                        .padding(.bottom, 15)
                        
                    } // Fim ForEach
                } // Fim VStack
                .onAppear() {
                    viewModel.fetch()
                }
            } // Fim ScrollView
            .padding(.top, 20)
        } // Fim ZStack
    } // Fim body
}

#Preview {
    ContentView()
}
