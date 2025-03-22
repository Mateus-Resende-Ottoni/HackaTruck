//
//  ContentView.swift
//  DesafioHacka05
//
//  Created by Mateus Ottoni on 21/03/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView {
            AnimalsView()
                .tabItem {
                    Label("Animals",
                          systemImage: "cat")
                }
            CropsView()
                .tabItem {
                    Label("Crops",
                          systemImage: "apple.meditate")
                }
            VillagersView()
                .tabItem {
                    Label("Villagers",
                         systemImage: "person.3")
                }
            ListView()
                .tabItem {
                    Label ("Lista",
                           systemImage: "list.bullet")
                }
        }
    }
}

#Preview {
    ContentView()
}
