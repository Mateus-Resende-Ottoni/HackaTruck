//
//  PresentationRegisterView.swift
//  Presentations
//
//  Created by Mateus Ottoni on 04/04/25.
//

import SwiftUI

func randomString(length: Int) -> String {
  let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
  return String((0..<length).map{ _ in letters.randomElement()! })
}


struct PresentationRegisterView: View {
    
    // Acesso à viewModel
    @StateObject var viewModel = ViewModel();
    
    @State var nome     : String = ""
    @State var titulo   : String = ""
    @State var url      : String = ""
    
    var body: some View {
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
        Button {
            if (nome.count > 0 && titulo.count > 0 && url.count > 0) {
                let codigo : String = randomString(length: 4)
                viewModel.post_request(Presentation(_id: nil, _rev: nil, code: codigo, title: titulo, name: nome, pdf_url: url))
            }
        } label: {
            ZStack {
                Rectangle()
                    .frame(height: 100)
                Text("Enviar")
                    .foregroundStyle(.red)
            }
        }
    }
}

#Preview {
    PresentationRegisterView()
}
