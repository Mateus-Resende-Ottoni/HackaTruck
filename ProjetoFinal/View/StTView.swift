//
//  StTView.swift
//  Presentations
//
//  Created by Mateus Ottoni on 03/04/25.
//

// Basicamente uma cópia de https://github.com/ktustanowski/sounddemo/blob/main/TheSoundAnalysisDemo/ContentView.swift
// Obrigado Kamil Tustanowski

import SwiftUI
import Speech


// Classe para obter texto de áudio (Speech-to-Text)
final class StT: NSObject, ObservableObject, SFSpeechRecognizerDelegate {
    
    // Variáveis
    private let audioEngine = AVAudioEngine()

    @Published var recognizedText: String?
    @Published var isProcessing: Bool = false
    
    private var inputNode: AVAudioInputNode?
    
    private var speechRecognizer: SFSpeechRecognizer?
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?
    
    func teste1() {
        self.recognizedText = "Teste1"
        print(recognizedText ?? "nada")
    }
    func teste2() {
        self.recognizedText = "Teste2"
        print(recognizedText ?? "nada")
    }
    
    func start() {
        print("Começando a detectar")
        
        //print("start_teste1")
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.record, mode: .measurement, options: .duckOthers)
            try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
        } catch {
            print("Erro configurando a sessão de áudio")
        }
        
        self.inputNode = self.audioEngine.inputNode
        
        //print("start_teste2")
        self.speechRecognizer = SFSpeechRecognizer()
        // Propriedade para manter a análise limitada ao próprio dispositivo
        // ou mandá-la ao servidor (pode afetar a depender da linguagem)
        // if (speechRecognizer.supportsOnDeviceRecognition) {
        //  recognitionRequest?.requiresOnDeviceRecognition = true
        // }
        // Definir linguagem como português brasileiro
        self.speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "pt_BR"))
        
        self.recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
            
        // Não enviar resultados parciais (esperar término do
        // envio de áudio)
        // self.recognitionRequest?.shouldReportPartialResults = false
        
        //print("start_teste3")
        guard let speechRecognizer = self.speechRecognizer,
              speechRecognizer.isAvailable,
              let recognitionRequest = self.recognitionRequest,
              let inputNode = self.inputNode
        else {
            assertionFailure("Incapaz de começar reconhecimento de voz!")
            return
        }
        
        //print("start_teste4")
        speechRecognizer.delegate = self
        
        //print("start_teste5")
        // Obter áudio ao vivo
        let recordingFormat = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer: AVAudioPCMBuffer, when: AVAudioTime) in
            recognitionRequest.append(buffer)
        }
        
        //print("start_teste6")
        //
        self.recognitionTask = speechRecognizer.recognitionTask(with: recognitionRequest) { [weak self] result, error in
            self?.recognizedText = result?.bestTranscription.formattedString
            
            guard error != nil || result?.isFinal == true else { return }
            self?.stop()
        }
        
        //print("start_teste7")
        audioEngine.prepare()

        //print("start_teste8")
        do {
            try audioEngine.start()
            self.isProcessing = true
        } catch {
            print("Erro ao iniciar sistema de áudio")
            self.stop()
        }
        
        print("Parando de detectar")
    } // Fim da função Start
    
    func stop() {
        print("Começando a parar")
        print("Texto reconhecido:")
        print(self.recognizedText ?? "null")
        
        //print("stop_teste1")
        self.recognitionTask?.cancel()
  
        //print("stop_teste2")
        self.audioEngine.stop()
  
        //print("stop_teste3")
        self.inputNode?.removeTap(onBus: 0)
        self.inputNode = nil
        
        //print("stop_teste4")
        self.isProcessing = false
        
        //print("stop_teste5")
        self.recognitionRequest = nil
        self.recognitionTask = nil
        self.speechRecognizer = nil
        
        print("Parando de parar")
        print("Texto final:")
        print(self.recognizedText ?? "null")
    } // Fim da função stop
    
    public func speechRecognizer(_ speechRecognizer: SFSpeechRecognizer, availabilityDidChange available: Bool) {
        if available {
            print("✅ Available")
        } else {
            print("🔴 Unavailable")
            self.recognizedText = "Text recognition unavailable. Sorry!"
            stop()
        }
    }
    
    
} // Fim class Speech Analyzer

struct StTView: View {
    
    @State var stt : StT = StT()
    
    
    @State var teste : Bool = false
    
    var body: some View {
        Rectangle()
            .frame(height: 100)
            .ignoresSafeArea()
            .foregroundStyle(.blue)
        
        Spacer()
        
        Text(stt.recognizedText ?? "Tap to begin")
        
        Spacer()
        
        HStack {
            ZStack {
                Rectangle()
                    .frame(height: 100)
                    .foregroundStyle(.blue)
                Button {
                    toggleSpeechRecognition()
                } label : {
                    ZStack {
                        Circle()
                            .frame(height: 100)
                            .foregroundStyle(.red)
                            .shadow(radius: 5)
                        Text("Record")
                            .foregroundStyle(.black)
                            .fontWeight(.bold)
                    } // Fim ZStack
                } // Fim Button
            } // Fim ZStack
            
            Button {
                toggleTeste()
            } label : {
                ZStack {
                    Circle()
                        .frame(height: 100)
                        .foregroundStyle(.red)
                        .shadow(radius: 5)
                    Text("Teste")
                        .foregroundStyle(.black)
                        .fontWeight(.bold)
                } // Fim ZStack
            } // Fim Button
            
        } // Fim HStack
        
    } // fim body
    
} // fim StTView

// Para ligar/desligar o speech recognition
private extension StTView {
    func toggleSpeechRecognition() {
        if stt.isProcessing {
            stt.stop()
        } else {
            stt.start()
        }
    }
    
    func toggleTeste() {
        if !teste {
            stt.teste1()
            teste = true
        } else {
            stt.teste2()
            teste = false
        }
    }
}

#Preview {
    StTView()
}
