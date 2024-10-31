import SwiftUI
import WebKit
import Foundation

struct WikipediaResultView: View {
    @State private var formattedUrl: String = "Loading..."
    let urlString: String

    var body: some View {
        VStack {
            Text(formattedUrl)
                .padding()
        }
        .onAppear {
            fetchWikipediaSource(urlString: urlString) { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let html):
                        if let url = extractHref(from: html) {
                            let correctedUrl = url.replacingOccurrences(of: "/wiki/Fichier:", with: "/wiki/File:")
                            formattedUrl = "https://commons.wikimedia.org\(correctedUrl)?uselang=fr"
                        } else {
                            formattedUrl = "No URL found."
                        }
                    case .failure:
                        formattedUrl = "Failed to fetch the page."
                    }
                }
            }
        }
    }
}

#Preview {
    WikipediaResultView(urlString: "https://fr.wikipedia.org/wiki/Basilique_Notre-Dame-de-la-Garde")
} 
