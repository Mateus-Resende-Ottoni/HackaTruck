import SwiftUI

struct GravarPalestraView: View {
    var palestra: Presentation
    var paleta: ColorPalette?
    
    @State private var isRecording = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [paleta?.background1 ?? .white, paleta?.background2 ?? .gray]),
                           startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                Image("presentationsLogo")
                    .resizable()
                    .frame(width: 200, height: 200)
                
                Text(palestra.title)
                    .font(.title)
                    .foregroundColor(paleta?.textColor ?? .black)
                    .bold()
                    .padding()
                
                Divider().background(paleta?.textColor ?? .black)
                
                Text("Transcrição da Palestra:")
                    .font(.headline)
                    .foregroundColor(paleta?.textColor ?? .black)
                    .padding()
                
                Text("Texto da transcrição aparecerá aqui...") // Aqui a transcrição seria exibida
                
                Spacer()
                
                Button(action: toggleRecording) {
                    Text(isRecording ? "Parar Gravação" : "Iniciar Gravação")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: 300)
                        .background(paleta?.buttonColor ?? .blue)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                }
                .padding(.bottom, 50)
            }
            .padding()
        }
    }
    
    func toggleRecording() {
        // Implementação para iniciar/parar a gravação do áudio
        // Aqui você pode adicionar a lógica para gravar o áudio ou simular
        isRecording.toggle()
    }
}
