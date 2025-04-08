//
//  TextShowView.swift
//  Presentations
//
//  Created by Mateus Ottoni on 04/04/25.
//

import SwiftUI

struct TextShowView: View {
    
    @StateObject var viewModelText = ViewModelText();
    var current_code = "OuON"
    @State var current_transcription : Transcription =
    Transcription(_id: nil,
                 _rev: nil,
                 code: "AAAA",
                 text_transcription: "Ado Ado")
    
    var body: some View {
        VStack {
            if (current_transcription._id == nil) {
                ProgressView()
                    .shadow(color: .blue ,radius: 1)
                    .shadow(color: .blue ,radius: 1)
                    .shadow(color: .blue ,radius: 1)
            } else {
                Text(current_transcription.code)
                    .font(.title)
                    .padding()
                Text(current_transcription.text_transcription ?? "")
            }
            
            
        } // Fim VStack
        .onAppear() {
            viewModelText.fetch()
            print("Fetched _")
            print("-")
            print("-")
            Timer.scheduledTimer(withTimeInterval: 2.5, repeats: true) { _ in
                print("- -")
                print("Loop")
                print("- ")
                viewModelText.transcricoes.forEach {transcricao in
                    if (transcricao.code == current_code) {
                        print("Updated")
                        current_transcription = transcricao
                    }
                }
                print("- - -")
            } // Fim Timer

        } // Fim onAppear
        
        
    } // fim body
    
    
    
} // fim struct

#Preview {
    TextShowView(current_code: "OuON")
}
