//
//  EnterPalestraView.swift
//  Presentations
//
//  Created by Mateus Ottoni on 07/04/25.
//

import SwiftUI

struct EnterPalestraView: View {
    
    @State var codigo_paletra : String = ""
    @State var current_presentation : Presentation =
    Presentation(_id: nil,
                 _rev: nil,
                 code: "AAAA",
                 title: "Teste",
                 name: "Teste",
                 pdf_url: "Teste")
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                Rectangle()
                    .frame(width: 350, height: 50)
                    .foregroundStyle(.gray)
                TextField("Code", text: $codigo_paletra)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.white)
                    .font(.title)
                    .shadow(color: .black, radius: 1)
                    .shadow(color: .black, radius: 1)
                    .shadow(color: .black, radius: 1)
                    // Quando valor da variável mudar
                    .onChange(of: codigo_paletra) {
                        // Caso ela tenha os necessários 4 dígitos do código
                        if (codigo_paletra.count == 4) {
                            // Conferir no array se algum deles é compatível
                            for apresentacao in viewModel.apresentacoes {
                                if (apresentacao.code == codigo_paletra) {
                                    // Se for compatível, salvar
                                    current_presentation = apresentacao
                                }
                            }
                        } // Fim if (codigo_paletra.count == 4)
                        
                        
                    }
            } // Fim ZStack
        
            NavigationLink(destination: EnteredPalestraView(current_presentation: $current_presentation)) {
                ZStack {
                    Rectangle()
                        .frame(width: 250, height: 70)
                        .foregroundStyle(.pink)
                        .shadow(color: .blue, radius: 2)
                    Text("Acessar")
                        .foregroundStyle(.white)
                        .shadow(color: .black, radius: 2)
                        .shadow(color: .black, radius: 2)
                        .shadow(color: .black, radius: 2)
                        .shadow(color: .black, radius: 2)
                        .shadow(color: .black, radius: 2)
                } // Fim ZStack
                
            } // Fim NavigationLink
            
            
            
            
        } // Fim NavigationStack
        .onAppear() {
            viewModel.fetch()
        }
        
    } // Fim body
    
    
}

#Preview {
    EnterPalestraView()
}
