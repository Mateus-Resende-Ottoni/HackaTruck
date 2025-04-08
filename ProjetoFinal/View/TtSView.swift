//
//  TtSView.swift
//  Presentations
//
//  Created by Mateus Ottoni on 03/04/25.
//

import SwiftUI
import AVFoundation

// Classe para reprodução de texto via áudio (Text-to-Speech)
class TtS {
    // Variável para guardar texto
    var texto = ""
    // Sintetizador para o áudio
    var synthesizer = AVSpeechSynthesizer()
    // Definir linguagem da voz
    var voice = AVSpeechSynthesisVoice(language: "pt-BR")
    
    func TtS() {
        
    }
    
    func updateText(novoTexto : String) {
        texto = novoTexto
    }
     
    func play() {
        // Criar a pronúncia
        let utterance : AVSpeechUtterance = AVSpeechUtterance(string: texto)
            // Configurar a pronúncia
            utterance.rate = 0.35
            utterance.pitchMultiplier = 1.15
            utterance.postUtteranceDelay = 0.35
            utterance.volume = 1
            
            // Atribuir voz à pronúncia
            utterance.voice = voice
        
        
        // Tocar o áudio
        synthesizer.speak(utterance)
    }
}


struct TtSView: View {

    // Variável de controle para áudio
    @State private var tts: TtS = TtS()
    
    var body: some View {
        ZStack {
            
            Color.gray
            
            VStack {
                
                TextField("Input", text: $tts.texto)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .padding([.trailing, .leading], 75)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                Button {
                    tts.play()
                } label: {
                    ZStack {
                        Rectangle()
                            .foregroundStyle(.red)
                            .frame(width: 200, height: 100)
                        Text("Play")
                    }
                    .padding(.top, 150)
                } // Fim Button
                
            } // Fim VStack
            
            
        } // Fim ZStack
    } // fim body
    
    
} // fim TtSView

#Preview {
    TtSView()
}
