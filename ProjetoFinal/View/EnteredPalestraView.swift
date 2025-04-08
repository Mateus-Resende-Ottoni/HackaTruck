//
//  EnteredPalestraView.swift
//  Presentations
//
//  Created by Mateus Ottoni on 07/04/25.
//

import SwiftUI

struct EnteredPalestraView: View {
    
    @Binding var current_presentation : Presentation
    
    
    var body: some View {
        
        VStack {
            Spacer()
            VStack {
                HStack {
                    Text(current_presentation.code)
                    Text("     ")
                    Text(current_presentation.title)
                } // Fim HStack
                Text(current_presentation.pdf_url)
            } // Fim VStack

            Spacer()
            
            ZStack {
                Rectangle()
                    .frame(width: 250, height: 150)
                    .foregroundStyle(.blue)
                Text("Descrição do Slide")
                    .foregroundStyle(.white)
                    .shadow(color: .white, radius: 5)
                    .fontWeight(.bold)
            } // Fim ZStack
            
            Spacer()
            
            ZStack {
                Rectangle()
                    .frame(width: 250, height: 150)
                    .foregroundStyle(.blue)
                Text("Transcrição do Áudio")
                    .foregroundStyle(.white)
                    .shadow(color: .white, radius: 5)
                    .fontWeight(.bold)
                
            } // Fim ZStack
            
            Spacer()
        } // Fim VStack
        
        
        
    } // Fim body
    
}

#Preview {
    struct Preview: View {
        @State var current_presentation : Presentation =
        Presentation(_id: nil,
                     _rev: nil,
                     code: "AAAA",
                     title: "Teste",
                     name: "Teste",
                     pdf_url: "Teste")
        var body: some View {
            EnteredPalestraView(current_presentation: $current_presentation)
        }
    }
    return Preview()
}
