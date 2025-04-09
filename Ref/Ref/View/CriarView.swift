import SwiftUI

func randomString(length: Int) -> String {
  let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
  return String((0..<length).map{ _ in letters.randomElement()! })
}

struct CriarView: View {
    @Binding var presentations: [Presentation]
    var paleta: ColorPalette?
    
    @StateObject var viewModel = ViewModel()
    
    @State private var tituloApresentacao: String = ""
    @State private var nomePalestrante: String = ""
    @State private var pdfPath: String = ""
    
    @State var success : Bool = false
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [paleta?.background1 ?? .white, paleta?.background2 ?? .gray]),
                               startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    Image("presentationsLogo")
                        .resizable()
                        .frame(width: 200, height: 200)
                    
                    TextField("Título da Apresentação", text: $tituloApresentacao)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    TextField("Nome do Palestrante", text: $nomePalestrante)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    TextField("Anexe o PDF da apresentação", text: $pdfPath)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    Spacer()
                    
                    Button(action: criarPalestra) {
                        Text("Criar")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: 300)
                            .background(paleta?.buttonColor ?? .blue)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                }
                .padding()
            }
        }
    }
    
    func criarPalestra() {
        let novaPalestra = Presentation(
            _id: nil,
            _rev: nil,
            code: randomString(length: 4),
            title: tituloApresentacao,
            author: nomePalestrante,
            pdf_url: pdfPath)
        
        success = viewModel.post_request(novaPalestra)
        presentations.append(novaPalestra) // Adiciona a nova palestra ao array
        
        // Resetar os campos
        tituloApresentacao = ""
        nomePalestrante = ""
        pdfPath = ""
    }
}

#Preview {
    CriarView(presentations: .constant([]), paleta: paleta1)
}
