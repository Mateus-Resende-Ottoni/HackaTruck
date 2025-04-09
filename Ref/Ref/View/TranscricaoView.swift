import SwiftUI

struct TranscricaoView: View {
    var palestra: Presentation // Recebe a palestra selecionada
    var paleta: ColorPalette?
    
    @StateObject var viewModelText = ViewModelText()
    @State var transcription : Transcription =
    Transcription(_id: nil,
                 _rev: nil,
                 code: "AAAA",
                 text_transcription: nil)

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [paleta?.background1 ?? .white, paleta?.background2 ?? .gray]),
                           startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 20) {
                    Image("presentationsLogo")
                        .resizable()
                        .frame(width: 150, height: 150)

                    Text(palestra.title)
                        .font(.title)
                        .foregroundColor(paleta?.textColor ?? .black)
                        .bold()

                    Divider().background(paleta?.textColor ?? .black)

                    Text("Transcrição da Palestra:")
                        .font(.headline)
                        .foregroundColor(paleta?.textColor ?? .black)

                    if (transcription.text_transcription == nil) {
                        Text("Nenhuma transcrição disponível no momento.")
                            .font(.body)
                            .foregroundColor(paleta?.textColor ?? .black)
                            .padding()
                    } else if (transcription.text_transcription?.count ?? 0 < 1) {
                        Text("Nenhuma transcrição disponível no momento.")
                            .font(.body)
                            .foregroundColor(paleta?.textColor ?? .black)
                            .padding()
                    } else {
                        Text(transcription.text_transcription ?? "Nenhuma transcrição disponível no momento.") // Conteúdo da palestra
                            .font(.body)
                            .foregroundColor(paleta?.textColor ?? .black)
                            .padding()
                    }

                    Spacer()
                } // Fim VStack
                
                
                .padding()
            } // Fim Scroll View
            .onAppear() {
                viewModelText.fetch()
                Timer.scheduledTimer(withTimeInterval: 2.5, repeats: true) { _ in
                    viewModelText.transcricoes.forEach {transcricao in
                        if (transcricao.code == palestra.code) {
                            transcription = transcricao
                        }
                    }
                } // Fim Timer
            } // Fim onAppear
        }
    }
}


#Preview {
    TranscricaoView(palestra: Presentation(_id: nil, _rev: nil, code: "aaaa", title: "title", author: "author", pdf_url: "url"), paleta: paleta1)
}
