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
    @State var my_presentation : Presentation =
    Presentation(_id: nil,
                 _rev: nil,
                 code: "AAAA",
                 title: "Teste",
                 name: "Teste",
                 pdf_url: "Teste")
    
    @State var palestrante : Bool = false
    @State var meu_codigo : String = ""
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                VStack { // Inserção de código
                    
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
                                    } // Fim for
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
                                .font(.title)
                                .shadow(color: .black, radius: 2)
                                .shadow(color: .black, radius: 2)
                                .shadow(color: .black, radius: 2)
                                .shadow(color: .black, radius: 2)
                                .shadow(color: .black, radius: 2)
                        } // Fim ZStack
                        
                    } // Fim NavigationLink
                    
                    
                } // Fim VStack
                
                
                
                VStack { // Acesso à criação de palestra
                    
                    Spacer()
                    
                    if (palestrante) {
                        
                        NavigationLink(destination: InfoPalestraView(meu_codigo: $meu_codigo, my_presentation: $my_presentation)) {
                            ZStack {
                                Rectangle()
                                    .frame(width: 250, height: 70)
                                    .foregroundStyle(.blue)
                                    .shadow(color: .red, radius: 2)
                                Text("Minha Palestra")
                                    .foregroundStyle(.white)
                                    .shadow(color: .black, radius: 2)
                                    .shadow(color: .black, radius: 2)
                                    .shadow(color: .black, radius: 2)
                                    .shadow(color: .black, radius: 2)
                                    .shadow(color: .black, radius: 2)
                            } // Fim ZStack
                            
                        } // Fim NavigationLink
                        .padding()
                        .onAppear() {
                            for apresentacao in viewModel.apresentacoes {
                                if (apresentacao.code == meu_codigo) {
                                    my_presentation = apresentacao
                                }
                            } // Fim for
                        }
                        .onTapGesture() {
                            for apresentacao in viewModel.apresentacoes {
                                if (apresentacao.code == meu_codigo) {
                                    // Se for compatível, salvar
                                    my_presentation = apresentacao
                                }
                            } // Fim for
                            
                        }
                        
                    } else {
                        
                        NavigationLink(destination: CreatePalestraView(meu_codigo: $meu_codigo, my_presentation: $my_presentation, palestrante: $palestrante)) {
                            ZStack {
                                Rectangle()
                                    .frame(width: 250, height: 70)
                                    .foregroundStyle(.purple)
                                    .shadow(color: .red, radius: 2)
                                Text("Criar Palestra")
                                    .foregroundStyle(.white)
                                    .font(.title)
                                    .shadow(color: .black, radius: 1)
                                    .shadow(color: .black, radius: 1)
                                    .shadow(color: .black, radius: 1)
                                    .shadow(color: .black, radius: 1)
                                    .shadow(color: .black, radius: 1)
                        
                                
                            } // Fim ZStack
                            
                        } // Fim NavigationLink
                        .padding()
                        
                    }
                    
                    
                } // Fim VStack
                
                
            } // Fim ZStack
            
            
        } // Fim NavigationStack
        .onAppear() {
            viewModel.fetch()
        }
        
    } // Fim body
    
    
}

#Preview {
    EnterPalestraView()
}
