import Foundation

public struct StringDash {
    static func camelCase(_ string: String ...) -> String {
        return string.reduce(into: "") { result, s in
            s.trimmingCharacters(in: CharacterSet.whitespaces)
                .components(separatedBy: CharacterSet.alphanumerics.inverted).joined(separator: " ")
                .lowercased()
                .split(separator: " ")
                .forEach {
                    result.append(result.isEmpty ? "\($0)".lowercased() : $0.capitalized)
                }
        }
    }

    static func capitalize(_ string: String ...) -> String {
        return string.reduce(into: "") { result, s in
            result.append(s.capitalized)
        }
    }

    static func endsWith(_ string: String, suffix: String, position: Int? = nil) -> Bool {
        guard let pos = position else { return string.hasSuffix(suffix) }
        guard pos < string.count else { return false }

        return string[string.startIndex ..< string.index(string.startIndex, offsetBy: pos + 1)].hasSuffix(suffix)
    }

    static func escape(_ string: String) -> String {
        guard string.isEmpty == false else { return string }

        var encodedStr = string
        for (p, v) in escapeCodeMapping {
            encodedStr = encodedStr.replacingOccurrences(of: v, with: p)
        }
        return encodedStr
    }

    static func unescape(_ string: String) -> String {
        guard string.isEmpty == false else { return string }

        var decodedStr = string
        for (p, v) in escapeCodeMapping {
            decodedStr = decodedStr.replacingOccurrences(of: p, with: v)
        }
        return decodedStr
    }

    static func escapeRegEx(_ string: String) -> String {
        return NSRegularExpression.escapedPattern(for: string)
    }

    static func kebabCase(_ string: String) -> String {
        let conjunction = "-"
        if string.contains("_") {
            return capitalizeSubSequences(string, conjunction: conjunction, separator: "-")
        } else if string.contains("_") {
            return capitalizeSubSequences(string, conjunction: conjunction, separator: "_")
        } else if string.contains(" ") {
            return capitalizeSubSequences(string, conjunction: conjunction, separator: " ")
        } else {
            return capitalizeSubSequences(string, conjunction: conjunction)
        }
    }

    static func lowerCase(_ string: String) -> String {
        return string.trimmingCharacters(in: CharacterSet.whitespaces)
            .components(separatedBy: CharacterSet.alphanumerics.inverted).joined(separator: " ")
            .trimmingCharacters(in: CharacterSet.whitespaces)
            .lowercased()
    }

    static func lowerFirst(_ string: String) -> String {
        return "\(string.prefix(1).lowercased())\(string.dropFirst())"
    }
}
