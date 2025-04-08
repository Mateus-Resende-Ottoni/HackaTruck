//
//  InfoPalestraView.swift
//  Presentations
//
//  Created by Mateus Ottoni on 08/04/25.
//

import SwiftUI

struct InfoPalestraView: View {
    
    @Binding var meu_codigo : String
    @Binding var my_presentation : Presentation
    
    var body: some View {
        VStack {
            if (my_presentation.code.count != 4) {
                ProgressView()
                    .shadow(color: .blue ,radius: 1)
                    .shadow(color: .blue ,radius: 1)
                    .shadow(color: .blue ,radius: 1)
            } else {
                Text(my_presentation.title)
                    .padding(.bottom, 15)
                Text(my_presentation.code)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
            }
        } // Fim VStack
        
    } // fim body
}

#Preview {
    struct Preview: View {
        @State var meu_codigo : String = ""
        @State var my_presentation : Presentation =
        Presentation(_id: nil,
                     _rev: nil,
                     code: "AAAA",
                     title: "Teste",
                     name: "Teste",
                     pdf_url: "Teste")
        
        var body: some View {
            InfoPalestraView(meu_codigo: $meu_codigo, my_presentation: $my_presentation)
        }
    }
    return Preview()
}
