//
//  ContentView.swift
//  cityquest
//
//  Created by Fernand LIME on 18/10/2024.
//

import SwiftUI

struct FirstView: View {
    var body: some View {
        TabView {
            Tab("Discover", systemImage: "magnifyingglass") {
                DiscoverView()
            }
            
            Tab("Monudex", systemImage: "medal.star") {
                DiscoverViewMonudex()
            }
            
            Tab("Profil", systemImage: "person") {
                UserView()
            }
        }.preferredColorScheme(.dark)
    }
}

#Preview {
    FirstView()
}
