//
//  VillagersView.swift
//  DesafioHacka05
//
//  Created by Mateus Ottoni on 21/03/25.
//

import SwiftUI

struct VillagersView: View {
    
    let colorV1 = Color(red: 1, green: 0.609, blue: 0.282)
    let colorV2 = Color(red: 0.878, green: 0.427, blue: 0.365)
    
    let backgroundGradient = LinearGradient(
        colors:
            [Color(red: 1, green: 0.609, blue: 0.282),
             Color(red: 0.878, green: 0.427, blue: 0.365)],
        startPoint: .top, endPoint: .bottom)
    
    var body: some View {
        ZStack {
            backgroundGradient
                .ignoresSafeArea(edges: .top)
            VStack {
                Image(systemName: "person.3")
                    .font(.custom("ComicSans", fixedSize: 160))
                    .foregroundStyle(colorV1)
                    .scaledToFit()
                    .padding(90)
                    .background(.black)
                    .clipShape(Circle())
            }
        }
        
    }
}

#Preview {
    VillagersView()
}
