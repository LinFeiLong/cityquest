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
                MonudexView(monuments: monuments)
                }

            Tab("Monudex", systemImage: "tray.and.arrow.down.fill") {
                MonudexView(monuments: monuments)
                }
            Tab("Profil", systemImage: "person") {
              UserView()
                }

        }
    }
}

#Preview {
    FirstView()
}
