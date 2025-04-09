import SwiftUI

// Struct personalizada para definir paleta de cores
struct ColorPalette: Hashable {
    var name: String
    var background1: Color
    var background2: Color
    var buttonColor: Color
    var textColor: Color
}

// Definição de paletas de cores
let paleta1 = ColorPalette(
    name: "Azul Clássico",
    background1: Color(red: 0.5, green: 0.80, blue: 0.9),
    background2: Color.white,
    buttonColor: Color(red: 0.45, green: 0.30, blue: 0.45),
    textColor: Color.black
)

let paleta2 = ColorPalette(
    name: "Rosa Suave",
    background1: Color(red: 1.00, green: 0.75, blue: 0.79),
    background2: Color.white,
    buttonColor: Color(red: 0.15, green: 0.80, blue: 0.95),
    textColor: Color.black
)

let paleta3 = ColorPalette(
    name: "Verde Floresta",
    background1: Color(red: 0.30, green: 0.60, blue: 0.30),
    background2: Color(red: 0.85, green: 0.95, blue: 0.85),
    buttonColor: Color(red: 0.20, green: 0.40, blue: 0.25),
    textColor: Color.black
)
struct PresentationsView: View {
    @State private var showLaunchScreen = true
    @State var paleta: ColorPalette = paleta1
    let temas = [paleta1, paleta2, paleta3]
    
    @State var presentations: [Presentation] = [] // Lista de apresentações
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        if showLaunchScreen {
            LaunchScreenView(paleta: paleta)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        showLaunchScreen = false
                    }
                }
        } else {
            NavigationStack {
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [paleta.background1, paleta.background2]),
                                   startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                    
                    ScrollView(.vertical) {
                        VStack(spacing: 20) {
                            Image("presentationsLogo")
                                .resizable()
                                .frame(width: 150, height: 150)
                            
                            Text("Acessar:")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(paleta.textColor)
                                .font(.title)
                                .fontWeight(.bold)
                                .shadow(radius: 10)
                                .padding()
                            
                            Spacer()
                            
                            NavigationLink(destination: AcompanharView(my_presentations: presentations, paleta: paleta)) {
                                Text("Acompanhar Apresentação")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: 300)
                                    .background(paleta.buttonColor)
                                    .cornerRadius(10)
                                    .shadow(radius: 5)
                            }
                            
                            NavigationLink(destination: CriarView(presentations: $presentations, paleta: paleta)) {
                                Text("Criar Apresentação")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: 300)
                                    .background(paleta.buttonColor)
                                    .cornerRadius(10)
                                    .shadow(radius: 5)
                            }
                            
                            
                            // Lista de apresentações criadas
                            VStack {
                                Text("Minhas Palestras:")
                                    .font(.headline)
                                    .foregroundColor(paleta.textColor)
                                    
                                
                                ForEach(presentations, id: \._id) { pres in
                                    VStack {
                                        NavigationLink(destination: GravarPalestraView(palestra: pres, paleta: paleta)) {
                                            Text(pres.title)
                                                .font(.title3)
                                                .foregroundColor(.white)
                                                .frame(maxWidth: 300)
                                                .background(paleta.buttonColor)
                                                .cornerRadius(10)
                                                .shadow(radius: 5)
                                        }
                                    }
                                    .padding(.horizontal)
                                }
                            }
                                VStack(alignment: .leading) {
                                    Text("Tema:")
                                        .font(.headline)
                                        .foregroundColor(paleta.textColor)
                                        .padding(.horizontal)
                                    
                                    Picker("Selecionar Tema", selection: $paleta) {
                                        ForEach(temas, id: \ .self) { tema in
                                            Text(tema.name).tag(tema)
                                        }
                                    }
                                    .pickerStyle(SegmentedPickerStyle())
                                    .padding(.horizontal)
                                }
                                .padding(.top, 100)
                            }
                        }
                    }
                } // Fim NavigationStack
                .tint(.blue)
                .onAppear() {
                    viewModel.fetch()
                    Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
                        presentations = viewModel.apresentacoes
                        
                    } // Fim Timer
                }
            
            }
        }
    }
    #Preview {
        PresentationsView()
    }
