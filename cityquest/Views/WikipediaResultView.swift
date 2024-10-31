import SwiftUI
import WebKit
import Foundation

struct WikipediaResultView: View {
    @State private var formattedUrl: String = "Loading..."
    let urlString: String

    var body: some View {
        VStack {
            if let url = URL(string: formattedUrl), formattedUrl != "Loading..." && formattedUrl != "No image source found." && formattedUrl != "Failed to fetch the page." {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 300, maxHeight: 300)
                } placeholder: {
                    ProgressView()
                }
            } else {
                Text(formattedUrl)
                    .padding()
            }
        }
        .onAppear {
            fetchWikipediaSource(urlString: urlString) { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let html):
                        if let src = extractSrc(from: html) {
                            formattedUrl = src
                        } else {
                            formattedUrl = "No image source found."
                        }
                    case .failure:
                        formattedUrl = "Failed to fetch the page."
                    }
                }
            }
        }
    }
}

func fetchWikipediaSource(urlString: String, completion: @escaping (Result<String, Error>) -> Void) {
    guard let url = URL(string: urlString) else {
        completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
        return
    }

    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            completion(.failure(error))
            return
        }

        guard let data = data, let html = String(data: data, encoding: .utf8) else {
            completion(.failure(NSError(domain: "Data conversion error", code: 0, userInfo: nil)))
            return
        }

        completion(.success(html))
    }

    task.resume()
}

func extractSrc(from html: String) -> String? {
    let spanPattern = "<span[^>]+typeof=\"mw:File/Frameless\"[^>]*>(.*?)</span>"
    guard let spanRegex = try? NSRegularExpression(pattern: spanPattern, options: .dotMatchesLineSeparators) else {
        return nil
    }
    
    let nsString = html as NSString
    let spanResults = spanRegex.matches(in: html, options: [], range: NSRange(location: 0, length: nsString.length))
    
    if let spanMatch = spanResults.first {
        let spanContent = nsString.substring(with: spanMatch.range(at: 1))
        
        let imgPattern = "<img[^>]+src=\"([^\"]+)\""
        guard let imgRegex = try? NSRegularExpression(pattern: imgPattern, options: []) else {
            return nil
        }
        
        let imgResults = imgRegex.matches(in: spanContent, options: [], range: NSRange(location: 0, length: (spanContent as NSString).length))
        
        if let imgMatch = imgResults.first {
            var src = (spanContent as NSString).substring(with: imgMatch.range(at: 1))
            if src.hasPrefix("//") {
                src = "https:" + src
            }
            return src
        }
    }
    
    return nil
}

#Preview {
    WikipediaResultView(urlString: "https://fr.wikipedia.org/wiki/Basilique_Notre-Dame-de-la-Garde")
}
