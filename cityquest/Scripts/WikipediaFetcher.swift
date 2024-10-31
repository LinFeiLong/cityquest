import Foundation

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

