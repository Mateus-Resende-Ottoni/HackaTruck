import SwiftUI

struct DescricaoView: View {
    var palestra: Presentation // Recebe a palestra selecionada
    var paleta: ColorPalette?

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

                Text("Apresentador: \(palestra.author)")
                    .font(.subheadline)
                    .foregroundColor(paleta?.textColor ?? .black)

                Divider().background(paleta?.textColor ?? .black)

                Text("Descrição:")
                    .font(.headline)
                    .foregroundColor(paleta?.textColor ?? .black)

                Text("Nenhuma descrição fornecida.") // Pode ser atualizado com mais dados
                    .font(.body)
                    .foregroundColor(paleta?.textColor ?? .black)
                    .padding()
                Spacer()
                HStack(spacing: 40) {
                    Button(action: {
                        // Ação para retroceder slide
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 24))
                            .foregroundColor(paleta?.textColor ?? .black)
                            .padding()
                            .background(Color.white.opacity(0.3))
                            .clipShape(Circle())
                    }

                    Button(action: {
                        // Ação para avançar slide
                    }) {
                        Image(systemName: "chevron.right")
                            .font(.system(size: 24))
                            .foregroundColor(paleta?.textColor ?? .black)
                            .padding()
                            .background(Color.white.opacity(0.3))
                            .clipShape(Circle())
                    }
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

            }
            .padding()
        }
    }
}

#Preview {
    DescricaoView(palestra: Presentation(_id: nil, _rev: nil, code: "aaaa", title: "title", author: "author", pdf_url: "url"), paleta: paleta1)
}
