import SwiftUI

    // Composant card
struct CityCard: View {
    var city: City
     var progress : Double?


    var body: some View {


//            ZStack {
        Image(.imageTestMonument)
            .resizable().containerRelativeFrame(.vertical, count: 6, span: 2, spacing: 0).mask(RoundedRectangle(cornerRadius: 15, style: .continuous)).overlay {
                VStack {
                    Spacer()

                    ZStack {
                        RoundedRectangle(cornerRadius: 15, style: .continuous).fill( Color("MainColor").opacity(0.6)).containerRelativeFrame(.vertical, count: 25, span: 2, spacing: 0)



                             HStack {
                                 Text(city.name).font(.title.bold()).foregroundColor(Color("AccentColor")).padding(.trailing, 5)
                                 if progress != nil {

                                     CircularProgressView(progressAmountTarget: progress!).frame(height: 45).padding(.leading, 15)

                                 }

                        }
                           //                            Text(city.name)
                           //                                .font(.title2.bold())
                           //                                .foregroundColor(Color("AccentColor"))
                           //                                .padding(.trailing, 2)
                           //                            //  Spacer()
                           //
                           //
                           //                            NavigationLink(destination: DescriptionView(detailThing: city)) {
                           //                                HStack {
                           //                                    Image(systemName: "magnifyingglass.circle")
                           //                                    Text("Découvrir")
                           //                                        .font(.subheadline)
                           //                                }
                           //                                .padding(.horizontal, 12)
                           //                                .padding(.vertical, 5)
                           //                                .background(Color("AccentColor"))
                           //
                           //                                .foregroundColor(Color("MainColor"))
                           //                                .cornerRadius(8)
                           //                            }
                           //
                           //
                           //                                HStack {
                           //                                    Image(systemName: "play.circle")
                           //                                    Text("Jouer")
                           //                                        .font(.subheadline)
                           //                                }
                           //                                .padding(.horizontal, 12)
                           //                                .padding(.vertical, 5)
                           //                                .background(Color("AccentColor"))
                           //                                .foregroundColor(Color("MainColor"))
                           //
                           //                                .cornerRadius(8)
                           //
                           //
                           //                        } .padding(.horizontal,5)

//


                    }
                }
            }.padding(.horizontal)


            }
//            .frame(width: 360, height: 230)
//            .cornerRadius(15)
//            .shadow(radius: 5)

    }
//}

#Preview {
    NavigationStack {
        CityCard(city: cityTest)
    }

}


#Preview {
    NavigationStack {
        CityCard(city: cityTest, progress: 0.5)
    }

}
