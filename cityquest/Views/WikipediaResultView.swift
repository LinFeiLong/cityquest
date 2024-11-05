import SwiftUI

struct WikipediaResultView: View {
    @State private var monuments: [Monument] = []

    var body: some View {
        VStack {
            List {
                if !monuments.isEmpty {
                    ForEach(monuments) { monument in
                        Text(monument.name)
                    }
                } else {
                    Text("No results found.")
                }
            }
        }
        .onAppear {
            monuments = loadMonuments() ?? []
        }
    }
}

func loadMonuments() -> [Monument]? {
    guard let url = Bundle.main.url(forResource: "marseille", withExtension: "json") else {
        print("Failed to locate marseille.json in bundle.")
        return nil
    }
    
    do {
        let data = try Data(contentsOf: url)
        print(data)
        let decoder = JSONDecoder()
        let monuments = try decoder.decode([Monument].self, from: data)
        return monuments
    } catch {
        print("Failed to load or decode marseille.json: \(error)")
        return nil
    }
}

#Preview {
    WikipediaResultView()
}
