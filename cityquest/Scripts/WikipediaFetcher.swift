import Foundation

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
        
        guard let data = data, let htmlString = String(data: data, encoding: .utf8) else {
            completion(.failure(NSError(domain: "Data conversion error", code: 0, userInfo: nil)))
            return
        }
        
        completion(.success(htmlString))
    }
    
    task.resume()
}

func extractHref(from html: String) -> String? {
    let pattern = #"<span typeof="mw:File/Frameless">.*?<a href="([^"]+)""#
    
    do {
        let regex = try NSRegularExpression(pattern: pattern, options: .dotMatchesLineSeparators)
        let nsrange = NSRange(html.startIndex..<html.endIndex, in: html)
        
        if let match = regex.firstMatch(in: html, options: [], range: nsrange) {
            if let hrefRange = Range(match.range(at: 1), in: html) {
                return String(html[hrefRange])
            }
        }
    } catch {
        print("Invalid regex: \(error.localizedDescription)")
    }
    
    return nil
}

