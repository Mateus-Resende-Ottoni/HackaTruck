//
//  CreatePalestraView.swift
//  Presentations
//
//  Created by Mateus Ottoni on 08/04/25.
//

import SwiftUI

struct CreatePalestraView: View {
    
    @Binding var meu_codigo : String
    @Binding var my_presentation : Presentation
    @Binding var palestrante : Bool
    
    // Acesso à viewModel
    @StateObject var viewModel = ViewModel();
    
    @State var success : Bool = false
    
    @State var nome     : String = ""
    @State var titulo   : String = ""
    @State var url      : String = ""
    
    var body: some View {
        if (success) {
            Spacer()
            Text("Cadastrado com sucesso!")
                .font(.title)
                .fontWeight(.bold)
            Spacer()
        } else {
            Spacer()
            TextField ("Titulo", text: $titulo)
                .multilineTextAlignment(.center)
                .padding(.bottom, 10)
            Spacer()
            TextField ("Nome", text: $nome)
                .multilineTextAlignment(.center)
                .padding(.bottom, 10)
            Spacer()
            TextField ("url", text: $url)
                .multilineTextAlignment(.center)
                .padding(.bottom, 10)
            Spacer()
        }
        Button {
            if (nome.count > 0 && titulo.count > 0 && url.count > 0) {
                let codigo : String = randomString(length: 4)
                let createdPresentation : Presentation =
                Presentation(_id: nil,
                             _rev: nil,
                             code: codigo,
                             title: titulo,
                             name: nome,
                             pdf_url: url)
                success = viewModel.post_request(createdPresentation)
                Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
                    if (success) {
                        meu_codigo = codigo
                        palestrante = true
                        
                        my_presentation = createdPresentation
                        
                    }
                } // Fim Timer
            }
        } label: {
            ZStack {
                Rectangle()
                    .frame(height: 100)
                Text("Enviar")
                    .foregroundStyle(.red)
            } // Fim ZStack
        } // Fim Button
    } // fim body
}

#Preview {
    struct Preview: View {
        @State var meu_codigo : String = "AAAA"
        @State var palestrante : Bool = false
        @State var my_presentation : Presentation = 
        Presentation(_id: nil,
                     _rev: nil,
                     code: "AAAA",
                     title: "Teste",
                     name: "Teste",
                     pdf_url: "Teste")
        
        var body: some View {
            CreatePalestraView(meu_codigo: $meu_codigo, my_presentation: $my_presentation, palestrante: $palestrante)
        }
    }
    return Preview()
}
