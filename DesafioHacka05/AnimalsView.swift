//
//  AnimalsView.swift
//  DesafioHacka05
//
//  Created by Mateus Ottoni on 21/03/25.
//

import SwiftUI

struct AnimalsView: View {
    
    var colorA1 = Color(red: 0.954, green: 0.185, blue: 0.311)
    var colorA2 = Color(red: 0.905, green: 0.114, blue: 0.208)
    
    let backgroundGradient = LinearGradient(
        colors:
            [Color(red: 0.954, green: 0.185, blue: 0.311),
             Color(red: 0.905, green: 0.114, blue: 0.208)],
        startPoint: .top, endPoint: .bottom)
    
    var body: some View {
        ZStack {
            backgroundGradient
                .ignoresSafeArea(edges: .top)
            VStack {
                Image(systemName: "cat")
                    .font(.custom("ComicSans", fixedSize: 200))
                    .foregroundStyle(colorA1)
                    .scaledToFit()
                    .padding(50)
                    .background(.black)
                    .clipShape(Circle())
            }
        }
        
    }
    
}

#Preview {
    AnimalsView()
}
