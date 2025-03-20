//
//  D1View.swift
//  DesafioHacka01
//
//  Created by Mateus Ottoni on 19/03/25.
//

import SwiftUI

struct D1View: View {
    
    var body: some View {
        VStack() {
            HStack {
                RoundedRectangle(cornerRadius: 8)
                    //.foregroundColor(.red)
                    .fill(
                        LinearGradient(gradient: Gradient(colors: [.red, .purple]), startPoint: .leading, endPoint: .trailing)
                    )
                    .frame(width: 100, height: 100)
                    .padding(.trailing)
                Spacer()
                RoundedRectangle(cornerRadius: 8)
                    //.foregroundColor(.blue)
                    .fill(
                        LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .trailing, endPoint: .leading)
                    )
                    .frame(width: 100, height: 100)
                    .padding(.leading)
            }
            Spacer()
            HStack {
                RoundedRectangle(cornerRadius: 8)
                    //.foregroundColor(.green)
                    .fill(
                        LinearGradient(gradient: Gradient(colors: [.green, .orange]), startPoint: .leading, endPoint: .trailing)
                    )
                    .frame(width: 100, height: 100)
                    .padding(.trailing)
                Spacer()
                RoundedRectangle(cornerRadius: 8)
                    //.foregroundColor(.yellow)
                    .fill(
                        LinearGradient(gradient: Gradient(colors: [.yellow, .orange]), startPoint: .trailing, endPoint: .leading)
                    )
                    .frame(width: 100, height: 100)
                    .padding(.leading)
            }
        }
    }
    
}

#Preview {
    D1View()
}
