//
//  ContentView.swift
//  DesafioHacka04
//
//  Created by Mateus Ottoni on 20/03/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var dist: Double = 0
    @State private var temp: Double = 0
    @State private var vel: Double = 1
    @State private var vel_string: String = "0,00"
    @State private var image: String = "Questao"
    @State private var background: Color = .gray
    
    func updateResult() {
        if (vel >= 0.0 && vel <= 9.9) {
            image = "Tartaruga"
            background = .verdeClaro
        } else if (vel >= 10.0 && vel <= 29.9) {
            image = "Elefante"
            background = .azulClaro
        } else if (vel >= 30.0 && vel <= 69.9) {
            image = "Avestruz"
            background = .laranjaClaro
        } else if (vel >= 70.0 && vel <= 89.9) {
            image = "Leao"
            background = .amareloClaro
        } else if (vel >= 90.0 && vel <= 130) {
            image = "Guepardo"
            background = .vermelhoClaro
        } else {
            image = "Questao"
            background = .gray
        }
    }
    
    var body: some View {
        VStack {
            Group {
                HStack {
                    Text("Digite a")
                    Text("distância")
                        .fontWeight(.bold)
                    Text("(Km)")
                }
                TextField("Distância", value: $dist, format: .number)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .padding([.trailing, .leading], 75)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
            }
            Group {
                HStack {
                    Text("Digite o")
                    Text("tempo")
                        .fontWeight(.bold)
                    Text("(h)")
                }
                TextField("Horas", value: $temp, format: .number)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .padding([.trailing, .leading], 75)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
            }
            Spacer()
            Button {
                if (temp != 0) {
                    vel = dist / temp
                }
                else {
                    vel = dist / 1
                }
                vel_string = String(format: "%.2f", vel)
                updateResult()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 150, height: 40)
                        .foregroundStyle(.black)
                    Text("Calcular")
                        .foregroundStyle(.orange)
                        .fontWeight(.bold)
                }
                
            }
            Spacer()
            Group { // Resultado
                Text(vel_string + "km/h")
                    .font(.largeTitle)
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 50))
                    .overlay(
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(
                                .white,
                                style: StrokeStyle(lineWidth: 5)
                            )
                    )
                    .padding(5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 60)
                            .stroke(
                                background,
                                style: StrokeStyle(lineWidth: 5)
                            )
                    )
                    .padding(5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 60)
                            .stroke(
                                .white,
                                style: StrokeStyle(lineWidth: 5)
                            )
                    )
                    
            }
            Spacer()
            Group { // Tabela de resultados
                VStack {
                    HStack {
                        Text("TARTARUGA")
                            .foregroundStyle(.white)
                        Spacer()
                        Text("(0 - 9,9km/h)")
                            .foregroundStyle(.white)
                        Spacer()
                        Circle()
                            .size(CGSize(width: 25, height: 25))
                            .aspectRatio(1.0, contentMode: ContentMode.fit)
                            .foregroundColor(Color.verdeClaro)
                    }
                    HStack {
                        Text("ELEFANTE")
                            .foregroundStyle(.white)
                        Spacer()
                        Text("(10 - 29,9km/h)")
                            .foregroundStyle(.white)
                        Spacer()
                        Circle()
                            .size(CGSize(width: 25, height: 25))
                            .aspectRatio(1.0, contentMode: ContentMode.fit)
                            .foregroundColor(Color.azulClaro)
                    }
                    HStack {
                        Text("AVESTRUZ")
                            .foregroundStyle(.white)
                        Spacer()
                        Text("(30 - 69,9km/h)")
                            .foregroundStyle(.white)
                        Spacer()
                        Circle()
                            .size(CGSize(width: 25, height: 25))
                            .aspectRatio(1.0, contentMode: ContentMode.fit)
                            .foregroundColor(Color.laranjaClaro)
                    }
                    HStack {
                        Text("LEÃO")
                            .foregroundStyle(.white)
                        Spacer()
                        Text("(70 - 89,9km/h)")
                            .foregroundStyle(.white)
                        Spacer()
                        Circle()
                            .size(CGSize(width: 25, height: 25))
                            .aspectRatio(1.0, contentMode: ContentMode.fit)
                            .foregroundColor(Color.amareloClaro)
                    }
                    HStack {
                        Text("GUEPARDO")
                            .foregroundStyle(.white)
                        Spacer()
                        Text("(90 - 130km/h)")
                            .foregroundStyle(.white)
                        Spacer()
                        Circle()
                            .size(CGSize(width: 25, height: 25))
                            .aspectRatio(1.0, contentMode: ContentMode.fit)
                            .foregroundColor(Color.vermelhoClaro)
                    }
                    } // Fim do VStack
                    .padding()
                    .background(.black)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    .padding()
            }
        }
        .padding([.trailing, .leading])
        .background(background)
    }
}

#Preview {
    ContentView()
}
