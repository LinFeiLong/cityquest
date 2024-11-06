import SwiftUI

struct CityCard: View {
    var city: City
    var progress: Double?

    var body: some View {
        ZStack {
            if let url = city.wikipedia_page_url {
                WikipediaImage(url: url, isCover: true)
                    .frame(maxWidth: .infinity)
                    .frame(height: 193)
                    .overlay {
                        VStack {
                            Spacer()
                            ZStack {
                                RoundedCorner(radius: 15, corners: [.bottomLeft, .bottomRight])
                                    .fill(Color("MainColor").opacity(0.8))
                                    .containerRelativeFrame(.vertical, count: 25, span: 2, spacing: 0)
                                HStack {
                                    Text(city.name).font(.title.bold()).foregroundColor(
                                        Color("AccentColor")
                                    )
                                    .padding(.trailing, 5)
                                    if progress != nil {
                                        CircularProgressView(progressAmountTarget: progress!).frame(
                                            height: 45
                                        ).padding(.leading, 15)
                                    }
                                }
                                .padding(.horizontal, 5)
                            }
                        }
                    }
            } else {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(maxWidth: .infinity)
                    .frame(height: 193)
            }
        }
        .background(Color("MainColor"))
        .cornerRadius(15)
        .shadow(radius: 5)
        .padding(.horizontal)
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

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
