//
//  Extension.swift
//  cityquest
//
//  Created by Ezequiel Gomes on 30/10/2024.
//

import Foundation
import SwiftUI

extension Data {

    func getImage() -> Image {
        if  let uiImage = UIImage(data: self) {
                    return Image(uiImage: uiImage)
                }
        return Image(systemName: "person.crop.circle")

    }

}

extension View {
    @available(iOS 14, *)
    func navigationBarTitleTextColor(_ color: Color) -> some View {
        let uiColor = UIColor(color)
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: uiColor ]
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: uiColor ]
        return self
    }
}
