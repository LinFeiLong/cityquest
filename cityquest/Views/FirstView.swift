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
            
            Tab("Monudex", systemImage: "tray.and.arrow.down.fill") {
                DiscoverViewMonudex()
              //  MonudexView(monuments: cityTest)
            }
            
            Tab("Profil", systemImage: "person") {
                UserView()
            }
            
            Tab("Wikipedia", systemImage: "book") {
                WikipediaResultView()
            }
        }
    }
}

#Preview {
    FirstView()
}
