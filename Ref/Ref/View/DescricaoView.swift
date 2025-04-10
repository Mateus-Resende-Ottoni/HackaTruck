import SwiftUI

struct DescricaoView: View {
    var palestra: Presentation
    var paleta: ColorPalette?

    @StateObject private var pdfManager = PDFTextManager()

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [paleta?.background1 ?? .white, paleta?.background2 ?? .gray]),
                           startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            VStack(spacing: 20) {
                Image("presentationsLogo")
                    .resizable()
                    .frame(width: 150, height: 150)

                Text(palestra.title)
                    .font(.title)
                    .foregroundColor(paleta?.textColor ?? .black)
                    .bold()

                HStack {
                    
                    Spacer()
                    
                    Text("Apresentador: \(palestra.author)")
                        .padding(.leading, 55)
                        .font(.subheadline)
                        .foregroundColor(paleta?.textColor ?? .black)
                    
                    Spacer()
                    
                    Button {
                        // Função
                        pdfManager.readCurrentPageText()
                    } label: {
                        Image(systemName: "volume.2.fill")
                            .foregroundStyle(paleta?.textColor ?? .black)
                            .font(.title)
                            .padding(10)
                            .background(paleta?.background2)
                            .cornerRadius(70)
                    }
                    
                    
                } // Fim HStack

                Divider().background(paleta?.textColor ?? .black)

                Text("Descrição:")
                    .font(.headline)
                    .foregroundColor(paleta?.textColor ?? .black)

                Text("Texto extraído da página atual:")
                    .font(.subheadline)
                    .foregroundColor(paleta?.textColor ?? .black)

                Text("Página \(pdfManager.currentPageIndex + 1) de \(pdfManager.pageCount)")
                    .font(.footnote)
                    .foregroundColor(paleta?.textColor ?? .black)

                ScrollView {
                    Text(pdfManager.currentPageText)
                        .foregroundColor(paleta?.textColor ?? .black)
                        .padding()
                }
                .frame(height: 150)

                HStack(spacing: 40) {
                    Button(action: {
                        pdfManager.goToPreviousPage()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 24))
                            .foregroundColor(paleta?.textColor ?? .black)
                            .padding()
                            .background(Color.white.opacity(0.3))
                            .clipShape(Circle())
                    }
                    .disabled(pdfManager.currentPageIndex == 0)

                    Button(action: {
                        pdfManager.goToNextPage()
                    }) {
                        Image(systemName: "chevron.right")
                            .font(.system(size: 24))
                            .foregroundColor(paleta?.textColor ?? .black)
                            .padding()
                            .background(Color.white.opacity(0.3))
                            .clipShape(Circle())
                    }
                    .disabled(pdfManager.currentPageIndex + 1 >= pdfManager.pageCount)
                }

                NavigationLink(destination: TranscricaoView(palestra: palestra, paleta: paleta)) {
                    Text("Ver Transcrição")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: 300)
                        .background(paleta?.buttonColor ?? .blue)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                }

                Spacer()
            }
            .padding()
            .onAppear {
                // Carrega o PDF da palestra ao abrir a tela
                let urlString = palestra.pdf_url
                    
                pdfManager.loadPDF(from: urlString) { success in
                        if !success {
                            print("Erro ao carregar o PDF da palestra.")
                        }
                    }
                
            }
        }
    }
}

#Preview {
    DescricaoView(palestra: Presentation(_id: nil, _rev: nil, code: "aaaa", title: "title", author: "author", pdf_url: "url"), paleta: paleta1)
}
