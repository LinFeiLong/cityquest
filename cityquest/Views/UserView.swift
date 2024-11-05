//
//  UserView.swift
//  cityquest
//
//  Created by Ezequiel Gomes on 28/10/2024.
//

import Foundation
import SwiftUI
import SwiftData
import Combine

struct UserView: View {

    @Environment(\.modelContext) var context
    @State var editingName: Bool = false
    @State var imageData = Data()
    @Query var  user : [User]
    @State var fields : [String]  = ["","",""]
    @State private var debouncedFields: [String] = ["", "", ""]
    @State private var debounceTimers: [AnyCancellable?] = [nil, nil, nil]
    var body: some View {
        NavigationStack{
            ZStack{
                Color(.color).ignoresSafeArea()

                VStack (alignment: .trailing) {
                    Button(action: {
                        editingName.toggle()
                        if !editingName {
                            saveModification()
                        }
                    }) {
                        Image(systemName: "pencil.circle").font(.system(size: 25)).padding(.trailing)
                    }
                    VStack (alignment: .leading ){
                        HStack  {
                            EditablePhotoComponent(userImageData: $imageData)
                            
                            if editingName || user.isEmpty {
                                ForEach(0..<2, id: \.self) { index in
                                    TextField(index == 0 ? "Prénom" : "Nom", text: $fields[index])
                                        .padding()
                                        .background(.white.opacity(0.3))
                                        .clipShape(RoundedRectangle(cornerRadius: 15))
                                        .onChange(of: fields[index]) { newValue in
                                            debounceTimers[index]?.cancel()
                                            debounceTimers[index] = Just(newValue)
                                                .delay(for: .milliseconds(300), scheduler: RunLoop.main)
                                                .sink { debouncedValue in
                                                    debouncedFields[index] = debouncedValue
                                                }
                                        }
                                }
                            }
                            else {
                                VStack {
                                    Text(user[0].firstname + " " + user[0].lastname).font(.title2).fontWeight(.bold)
                                        .foregroundColor(.white).padding(.leading)
                                    ShareLink(
                                        item: user[0].username,
                                        preview: SharePreview(
                                            "Coucou c'est \(user[0].firstname) rejoint moi sur cityQuest",
                                            image: Image(systemName: "person" )
                                        )
                                    )
                                }
                            }
                            Spacer()

                        }
                        HStack {
                            Text("Email:").foregroundColor(.white)
                            if editingName || user.isEmpty {
                                TextField("Entrez votre email" , text: $debouncedFields[2])
                                    .keyboardType(.emailAddress)
                                    .textInputAutocapitalization(.never)
                                    .padding()
                                    .background(.white.opacity(0.3))
                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                            } else{
                                Text(user[0].email).foregroundColor(.white).padding()
                            }

                        }.padding(.horizontal)
                        Spacer()
                        
                        VStack {
                            Button {
                                saveModification()
                            }
                            label: {
                                ButtonView(label: "Enregistrer les modifications ", icon: "", fontColor: .color, color: .accent).padding(.horizontal)
                            }
                            if !user.isEmpty {
                                Button {
                                    imageData = Data()
                                    for index in fields.indices {
                                        fields[index] = ""
                                    }
                                    context.delete(user[0])
                                    try? context.save()
                                } label: {
                                    ButtonView(label: "Réinitialiser mon compte ", icon: "", fontColor: .color, color: .white).padding(.horizontal)

                                }
                            }
                        }.padding(.vertical)
                        
                    }.onAppear {
                        
                        if !user.isEmpty {
                            imageData = user[0].avatarData ?? Data()
                            fields[0] =  user[0].firstname
                            fields[1] = user[0].lastname
                            fields[2] = user[0].email
                        }
                    }
                }
            }.navigationTitle("Votre profil").navigationBarTitleTextColor(.accentColor)

        }
    }


}

extension UserView {
    func saveModification()  {
        if user.isEmpty {
            let newuser = User(firstname: debouncedFields[0], lastname: debouncedFields[1], username: "", email: debouncedFields[2])
            newuser.avatarData = imageData
            context.insert(newuser)
            try? context.save()
        }
        else {
            user[0].firstname = debouncedFields[0]
            user[0].lastname = debouncedFields[1]
            user[0].email = debouncedFields[2]
            user[0].avatarData = imageData
            try? context.save()}

        if editingName {
            editingName = false
        }

    }
}

#Preview {

    UserView().modelContainer(PreviewContainer.mc)

}
