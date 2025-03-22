//
//  CropsView.swift
//  DesafioHacka05
//
//  Created by Mateus Ottoni on 21/03/25.
//

import SwiftUI

struct CropsView: View {
    
    let colorC1 = Color(red: 0.148, green: 1, blue: 0.06)
    let colorC2 = Color(red: 0.196, green: 0.733, blue: 0.17)
    
    let backgroundGradient = LinearGradient(
        colors:
            [Color(red: 0.148, green: 1, blue: 0.06),
             Color(red: 0.196, green: 0.733, blue: 0.17)],
        startPoint: .top, endPoint: .bottom)
    
    var body: some View {
        ZStack {
            backgroundGradient
                .ignoresSafeArea(edges: .top)
            VStack {
                Image(systemName: "apple.meditate")
                    .font(.custom("ComicSans", fixedSize: 230))
                    .foregroundStyle(colorC1)
                    .scaledToFit()
                    .padding(50)
                    .background(.black)
                    .clipShape(Circle())
            }
        }
        
    }
}

#Preview {
    CropsView()
}
