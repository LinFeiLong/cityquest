//
//  QuestionBG.swift
//  cityquest
//
//  Created by Fernand LIME on 28/10/2024.
//

import SwiftUI

struct QuestionBG<Content: View>: View {
    var content: Content?

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        Rectangle()
            .fill(Color("MainColor"))
            .cornerRadius(25)
            .padding()
            .overlay(
                content
                    .padding()
            )
    }
}

#Preview {
    QuestionBG() {
        
    }
}
