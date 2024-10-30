//
//  EditablePhotoAndNameComponent.swift
//  cityquest
//
//  Created by Ezequiel Gomes on 28/10/2024.
//

import Foundation

import SwiftUI
import PhotosUI

struct EditablePhotoComponent: View {


    @Binding  var userImageData : Data

    @State var selectedPhoto: PhotosPickerItem?

    var body: some View {
        HStack (alignment: .top) {
            PhotosPicker(selection: $selectedPhoto, matching: .images){
               
                userImageData.getImage().resizable().scaledToFit().clipShape(Circle()).frame(maxWidth: 100).padding(.leading)

            }

            }.onChange(of: selectedPhoto) { _, _ in
                if let selectedPhoto {
                    selectedPhoto.loadTransferable(type: Data.self) { result in

                            guard selectedPhoto == self.selectedPhoto else {
                                print("Failed to get the selected item.")
                                return
                            }
                            switch result {
                            case .success(let data):
                                if let safeData = data{
                                    userImageData = safeData

                                }
                            case .failure: break

                            }
                    }


                }
            }


    }
}
#Preview {
    @Previewable @State var user =  Data()
    EditablePhotoComponent(userImageData: $user)
}
