//
//  ListView.swift
//  DesafioHacka05
//
//  Created by Mateus Ottoni on 21/03/25.
//

import SwiftUI

struct ListView: View {
    
    
    var colorA2 = Color(red: 0.905, green: 0.114, blue: 0.208)
    let colorC2 = Color(red: 0.196, green: 0.733, blue: 0.17)
    let colorV2 = Color(red: 0.878, green: 0.427, blue: 0.365)
    
    let backgroundGradient = LinearGradient(
        colors: [Color.white, Color.gray],
        startPoint: .top, endPoint: .bottom)
    
    var body: some View {
        ZStack {
            backgroundGradient
                .ignoresSafeArea(edges: .top)
            VStack {
                Text("Lista")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 20)
                List {
                    HStack {
                        Text("Animals")
                        Spacer()
                        Image(systemName: "cat")
                            .foregroundStyle(colorA2)
                    }
                    HStack {
                        Text("Crops")
                        Spacer()
                        Image(systemName: "apple.meditate")
                            .foregroundStyle(colorC2)
                    }
                    HStack {
                        Text("Villagers")
                        Spacer()
                        Image(systemName: "person.3")
                            .foregroundStyle(colorV2)
                    }
                }
            }
        }
        
    }
}

#Preview {
    ListView()
}
