//
//  UserView.swift
//  cityquest
//
//  Created by Ezequiel Gomes on 28/10/2024.
//

import Foundation
import SwiftUI

struct UserView: View {
    @Binding var  user: User
    let link = URL(string: "https://www.admin.ch")!
    var body: some View {
        NavigationStack{
            ZStack{
                Color.main.ignoresSafeArea()

                VStack{
                    EditablePhotoAndNameComponent(user: $user)

                    HStack {
                        Text("Email:").foregroundColor(.white)
                        TextField(user.email, text: $user.email).foregroundColor(.gray)
                    }.padding(.horizontal)
                    Spacer()

//                        ButtonView(label: "Partager Mon Profil", icon: "square.and.arrow.up", fontColor: .main, color: .accent).padding(.horizontal)

                        ButtonView(label: "Réinitialiser mon compte ", icon: "", fontColor: .main, color: .gray).padding(.horizontal)


                       // TextField("", text: $user.last)



                }
            }.navigationTitle("Votre profil")

        }
    }
}

#Preview {
    @Previewable @State var user = User(id: 22, firstname: "Geraldine", lastname: "Petit", username: "gegePetit", email: "geraldine.petit@example.com", avatar: nil)
    UserView(user: $user)

}
