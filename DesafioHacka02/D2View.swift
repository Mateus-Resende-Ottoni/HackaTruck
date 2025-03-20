//
//  D2View.swift
//  DesafioHacka02
//
//  Created by Mateus Ottoni on 19/03/25.
//

import SwiftUI

struct D2View: View {
    var body: some View {
        HStack(alignment: .center) {
            Image("Limoeiro")
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
            VStack(spacing: 5) {
                Text("Bairro do Limoeiro")
                    .font(.caption)
                    .foregroundStyle(.red)
                    .padding(.bottom, 5)
                Text("Local de Turma da Mônica")
                    .font(.caption)
                    .foregroundStyle(.blue)
                    .padding(.bottom, 5)
                Text("Talvez exista, eu não sei")
                    .font(.caption)
                    .foregroundStyle(.yellow)
            }
            .padding(.trailing)
        }
    }
}

#Preview {
    D2View()
}
