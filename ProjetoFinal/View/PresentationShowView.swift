//
//  PresentationShowView.swift
//  Presentations
//
//  Created by Mateus Ottoni on 07/04/25.
//

import SwiftUI

struct PresentationShowView: View {
    
    // Acesso à viewModel
    @StateObject var viewModel = ViewModel();
    var current_code = "OuON"
    @State var current_presentation : Presentation =
    Presentation(_id: nil,
                 _rev: nil,
                 code: "AAAA",
                 title: "Teste",
                 name: "Teste",
                 pdf_url: "Teste")
    
    var body: some View {
        VStack {
            if (current_presentation._id == nil) {
                ProgressView()
                    .shadow(color: .blue ,radius: 1)
                    .shadow(color: .blue ,radius: 1)
                    .shadow(color: .blue ,radius: 1)
            } else {
                Text(current_presentation.code)
                Text(current_presentation.name)
                Text(current_presentation.pdf_url)
                Text(current_presentation.title)
                
            }
//            ForEach(viewModel.apresentacoes, id : \._id) { presentation in
//                ZStack {
//                    Circle()
//                        .frame(width: 75)
//                        .foregroundStyle(.black)
//                    Text(presentation.code)
//                        .foregroundStyle(.white)
//                }
//            }
        } // Fim VStack
        .onAppear() {
            viewModel.fetch()
//            print("Fetched _")
//            print("_")
            Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
                viewModel.apresentacoes.forEach {apresentacao in
                    if (apresentacao.code == current_code) {
//                        print("Found")
                        current_presentation = apresentacao
                    }
                }
            } // Fim Timer

        } // Fim onAppear
//        .onTapGesture {
//            viewModel.apresentacoes.forEach {apresentacao in
//                if (apresentacao.code == current_code) {
//                    print("Found")
//                    current_presentation = apresentacao
//                }
//            }
//        } // Fim onTapGesture
        
        
    } // fim body
} //

#Preview {
    PresentationShowView(current_code: "OuON")
}
