import SwiftUI

    // Composant card
struct CityCard: View {
    var cityName: String = "Paris"
    var onDiscover: () -> Void
    var onPlay: () -> Void
    var image: ImageResource

    var body: some View {
        ZStack {
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .clipped()
                .mask(RoundedRectangle(cornerRadius: 15, style: .continuous))

            VStack {
                Spacer()

                HStack {
                    Text(cityName)
                        .font(.title.bold())
                        .foregroundColor(Color("AccentColor"))
                    Spacer()

                    Button(action: onDiscover) {
                        HStack {
                            Image(systemName: "magnifyingglass.circle")
                            Text("Découvrir")
                                .font(.subheadline)
                        }
                        .padding(4)
                        .background(Color("AccentColor"))
                        .foregroundColor(Color("MainColor"))
                        .cornerRadius(8)
                    }

                    Button(action: onPlay) {
                        HStack {
                            Image(systemName: "play.circle")
                            Text("Jouer")
                                .font(.subheadline)
                        }
                        .padding(4)
                        .background(Color("AccentColor"))
                        .foregroundColor(Color("MainColor"))
                        .cornerRadius(8)
                    }
                }
                .padding()
                .background(Color("MainColor").opacity(0.6))
            }
        }
        .frame(width: 360, height: 230)
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}

#Preview {
    CityCard(
        onDiscover: { print("Découvrir action") },
        onPlay: { print("Jouer action") },
        image: .marseilleVueDepuisLaBasiliqueNotreDameDeLa1
    )
}
