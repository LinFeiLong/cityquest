//
//  ContentView.swift
//  cityquest
//
//  Created by Fernand LIME on 18/10/2024.
//

import SwiftUI

struct FirstView: View {
    var body: some View {
        NavigationStack {
            TabView {
                Group {
                    DiscoverView()
                        .tabItem {
                        Label("Discover", systemImage: "magnifyingglass")
                    }
                    DiscoverViewMonudex()
                        .tabItem {
                            Label("Monudex", systemImage: "medal.star")
                        }
                    UserView()
                        .tabItem {
                            Label("Profil", systemImage: "person")
                        }
                }
//                .toolbarBackground(.green, for: .tabBar)
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarColorScheme(.dark, for: .tabBar)
            }
            .edgesIgnoringSafeArea(.all)
        }
        .preferredColorScheme(.dark)
    }
}


#Preview {
    FirstView()
}
