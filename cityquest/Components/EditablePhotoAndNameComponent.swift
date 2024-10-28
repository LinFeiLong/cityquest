//
//  EditablePhotoAndNameComponent.swift
//  cityquest
//
//  Created by Ezequiel Gomes on 28/10/2024.
//

import Foundation

import SwiftUI
import PhotosUI

struct EditablePhotoAndNameComponent: View {

    @State var editingName = false
    @Binding  var user : User
    @State var selectedPhoto: PhotosPickerItem?

    var body: some View {
        HStack (alignment: .top) {
            PhotosPicker(selection: $selectedPhoto, matching: .images){
                if user.avatar != nil {
                    Image(uiImage: user.avatar!).resizable().scaledToFit().clipShape(Circle()).frame(maxWidth: 100).padding(.leading)
                }
                else {
                    Image(systemName: "person.circle").resizable().scaledToFit().frame(maxWidth: 90, maxHeight: 90).padding(.leading)
                }

            }

                if editingName {
                    TextField("Firstname", text: $user.firstname)
                    TextField("Lastname", text: $user.lastname)

                }
                else {
                    VStack {
                        Text(user.firstname + " " + user.lastname).font(.title2).fontWeight(.bold)
                            .foregroundColor(.white).padding(.leading)
                        ShareLink(
                            item: user.username,
                               preview: SharePreview(
                                "Coucou c'est \(user.firstname) rejoint moi sur cityQuest",
                                image: Image(systemName: "person" )
                               )
                        )
                    }
                }

                Button(action: {
                    editingName.toggle()
                }) {
                    Image(systemName: "pencil.circle").font(.system(size: 25)).padding(.trailing)
                }
            }.onChange(of: selectedPhoto) { _, _ in

                if let selectedPhoto {
                    selectedPhoto.loadTransferable(type: Data.self) { result in
                        DispatchQueue.main.async {
                            guard selectedPhoto == self.selectedPhoto else {
                                print("Failed to get the selected item.")
                                return
                            }
                            switch result {
                            case .success(let data):
                                if let safeData = data{
                                    user.avatar = UIImage(data: safeData) ?? UIImage(named: "Geraldine")!
                                }

                            case .failure: break

                            }
                        }
                    }


                }
            }


    }
}
#Preview {
    @Previewable @State var user = User(id: 22, firstname: "Geraldine", lastname: "Petit", username: "gegePetit", email: "geraldine.petit@example.com", avatar: nil)
    EditablePhotoAndNameComponent(user: $user)
}
