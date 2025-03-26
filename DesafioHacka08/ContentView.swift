//
//  ContentView.swift
//  DesafioHacka08
//
//  Created by Mateus Ottoni on 25/03/25.
//

import SwiftUI
import MapKit

struct Location: Hashable {
    let nome: String
    let foto: String
    let descricao: String
    let latitude: Double
    let longitude: Double
}

struct ColorPalette {
    var background1: Color
    var background2: Color
    var text: Color
    var details1: Color
    var details2: Color
}

struct ContentView: View {
    
    @State private var selectedPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: -19.9, longitude: -44),
            span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.25) )
    )
    
    @State private var selectedLocation : Location = Location(nome: "PUC Minas Coreu", foto: "Foto", descricao: "Universidade", latitude: -19.922902528406063, longitude: -43.99289541197493)
    
    @State private var auxiliaryLocation : Location = Location(nome: "PUC Minas Coreu", foto: "Foto", descricao: "Universidade", latitude: -19.922902528406063, longitude: -43.99289541197493)
    
    @State var sheetViewOn : Bool = false
    
    @State var paletaDeCores : ColorPalette =
    ColorPalette(background1: Color(red: 0.85, green: 0.60, blue: 0.95),
                 background2: Color(red: 0.6, green: 0.9, blue: 0.55),
                 text: Color.black,
                 details1: Color.white,
                 details2: Color.black)
    
    var arrayLocais = [
        Location(nome: "Bem Mineiro", foto: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/13/c0/e5/e3/photo0jpg.jpg?w=900&h=500&s=1", descricao: "Restaurante Mineiro Familiar. É só um restaurante que eu realmente gosto.", latitude: -19.92372594270958, longitude: -43.96739327158192),
        Location(nome: "PUC Minas Coreu", foto: "https://www.pucminas.br/mundopucminas/PublishingImages/paginas-internas/destaque-coreu.jpg", descricao: "O maior entre os dez campi e unidades da PUC Minas, o Campus Coração Eucarístico oferece 48 cursos de graduação e 29 de pós-graduação stricto sensu (mestrado e doutorado). Reúne duas centenas de laboratórios em todas as áreas do conhecimento, a Biblioteca Central Padre Alberto Antoniazzi, o Museu de Ciências Naturais, o Complexo Esportivo, a Produtora de Audiovisual, o Green – um dos mais respeitados centros de estudos de energia – e as oficinas de mecânica, automação e mecatrônica, espaços de experiências para a indústria automobilística.", latitude: -19.922902528406063, longitude: -43.99289541197493),
        Location(nome: "Belo Horizonte", foto:"https://upload.wikimedia.org/wikipedia/commons/1/1b/Belo_Horizonte%2C_Brasil.jpg",  descricao: "Belo Horizonte é um município brasileiro e a capital do estado de Minas Gerais. Sua população é de 2 315 560 habitantes, segundo o censo de 2022, sendo o sexto município mais populoso do país, o terceiro da Região Sudeste e o primeiro de seu estado. Com uma área de aproximadamente 331 km², possui uma geografia diversificada, com morros e baixadas. Com uma distância de 716 quilômetros de Brasília, é a segunda capital de estado mais próxima da capital federal, depois de Goiânia. Cercada pela Serra do Curral, que lhe serve de moldura natural e referência histórica, foi planejada e construída para ser a capital política e administrativa do estado mineiro sob influência das ideias do positivismo, num momento de forte apelo da ideologia republicana no país. Sofreu um inesperado crescimento populacional acelerado, chegando a mais de um milhão de habitantes com quase setenta anos de fundação. Entre as décadas de 1930 e 1940, ocorreu também o avanço da industrialização, além de muitas construções de inspiração modernista, notadamente as casas do bairro Cidade Jardim, que ajudaram a definir a fisionomia da cidade. A capital mineira é sede da terceira concentração urbana mais populosa do país. Belo Horizonte já foi indicada pelo Population Crisis Commitee, da ONU, como a metrópole com melhor qualidade de vida na América Latina e a 45.ª entre as 100 melhores cidades do mundo (dados de 2008). Em 2010, a cidade gerou 1,4% do PIB do país, e, em 2013, era o quarto maior PIB entre os municípios brasileiros, responsável por 1,53% do total das riquezas produzidas no país. Uma evidência do desenvolvimento da cidade nos últimos tempos é a classificação da revista América Economía, na qual, já em 2009, Belo Horizonte aparecia como uma das dez melhores cidades latino-americanas para fazer negócios, segunda do Brasil (atrás de São Paulo) e à frente de cidades como Rio de Janeiro, Brasília e Curitiba.", latitude: -19.90, longitude: -44),
        Location(nome: "Buenos Aires", foto: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1e/Puerto_Madero%2C_Buenos_Aires_%2840689219792%29_%28cropped%29.jpg/2880px-Puerto_Madero%2C_Buenos_Aires_%2840689219792%29_%28cropped%29.jpg", descricao: "Buenos Aires é a capital cosmopolita da Argentina. Seu centro é a Praça de Maio, com imponentes edifícios do século 19, como a Casa Rosada, o emblemático palácio presidencial com sacadas. Outras importantes atrações são o Teatro Colón, uma casa de ópera inaugurada em 1908 com cerca de 2.500 lugares, e o moderno museu MALBA, com sua coleção de arte latino-americana. ", latitude: -34.6186214702592, longitude: -58.468321217465174),
        Location(nome: "Cidade do Leste", foto: "https://upload.wikimedia.org/wikipedia/commons/9/92/Shopping_Del_Este_%28Ciudad_Del_Este%29%2C_Paraguay.jpg", descricao: "Ciudad del Este, em espanhol, é a primeira cidade paraguaia na fronteira entre Paraguai e Foz do Iguaçu. É uma cidade muito conhecida por suas lojas de importados e grandes oportunidades para compras.", latitude: -25.51414783694116, longitude: -54.69513397531213)]
    
    var body: some View {
        ZStack {
            LinearGradient( colors:
                    [paletaDeCores.background1,
                     paletaDeCores.background2,
                     paletaDeCores.background2],
                startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
            Map(position: $selectedPosition) {
                ForEach (arrayLocais, id: \.self) { local in
                    Annotation (local.nome, coordinate: CLLocationCoordinate2D(
                        latitude: local.latitude,
                        longitude: local.longitude) ) {
                            Button {
                                sheetViewOn.toggle()
                                auxiliaryLocation = local
                            } label: {
                             Image(systemName: "exclamationmark.bubble.fill")
                                    .foregroundStyle(paletaDeCores.details2)
                                    .shadow(color: paletaDeCores.details1,radius: 4)
                                    .shadow(color: paletaDeCores.details1,radius: 1)
                                    .shadow(color: paletaDeCores.details1,radius: 1)
                                    .shadow(color: paletaDeCores.details1,radius: 1)
                            }
                            .sheet(isPresented: $sheetViewOn) {
                                
                            } content: {
                                LocationView(local: $auxiliaryLocation)
                            }
                    }
                }
            } // Fim Map
            .ignoresSafeArea()
            VStack {
                Picker("Localização Atual", selection: $selectedLocation) {
                    ForEach (arrayLocais, id: \.self) { local in
                        Text(local.nome).tag(local)
                    }
                } // Fim Picker
                .tint(paletaDeCores.text)
                .padding()
                .background(paletaDeCores.background1)
                .padding(.top, 10)
                .shadow(color: paletaDeCores.details1, radius: 2)
                .shadow(color: paletaDeCores.details2, radius: 3)
                .onChange (of: selectedLocation) {
                    selectedPosition = MapCameraPosition.region(
                        MKCoordinateRegion(
                            center: CLLocationCoordinate2D(latitude: selectedLocation.latitude, longitude: selectedLocation.longitude),
                            span: MKCoordinateSpan(latitudeDelta: 0.75, longitudeDelta: 0.75) )
                    )
                } // Fim onChange
                Spacer()
                Text("Simplesmente locais")
                    .font(.title)
                    .padding()
                    .background(paletaDeCores.background1)
                    .padding(.bottom, 10)
                    .shadow(color: paletaDeCores.details1, radius: 2)
                    .shadow(color: paletaDeCores.details2, radius: 3)
            } // Fim VStack
        } // Fim ZStack
    }
}

#Preview {
    ContentView()
}
