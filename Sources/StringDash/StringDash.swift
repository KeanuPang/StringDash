import Foundation

public struct StringDash {
    public static func camelCase(_ string: String ...) -> String {
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

    public static func capitalize(_ string: String ...) -> String {
        return string.reduce(into: "") { result, s in
            result.append(s.capitalized)
        }
    }

    public static func endsWith(_ string: String, suffix: String, position: Int? = nil) -> Bool {
        guard let pos = position else { return string.hasSuffix(suffix) }
        guard pos < string.count else { return false }

        return string[string.startIndex ..< string.index(string.startIndex, offsetBy: pos + 1)].hasSuffix(suffix)
    }

    public static func escape(_ string: String) -> String {
        guard string.isEmpty == false else { return string }

        var encodedStr = string
        for (p, v) in escapeCodeMapping {
            encodedStr = encodedStr.replacingOccurrences(of: v, with: p)
        }
        return encodedStr
    }

    public static func unescape(_ string: String) -> String {
        guard string.isEmpty == false else { return string }

        var decodedStr = string
        for (p, v) in escapeCodeMapping {
            decodedStr = decodedStr.replacingOccurrences(of: p, with: v)
        }
        return decodedStr
    }

    public static func escapeRegEx(_ string: String) -> String {
        return NSRegularExpression.escapedPattern(for: string)
    }

    public static func kebabCase(_ string: String) -> String {
        let conjunction = "-"
        if string.contains("-") {
            return capitalizeSubSequences(string, conjunction: conjunction, separator: "-")
        } else if string.contains("_") {
            return capitalizeSubSequences(string, conjunction: conjunction, separator: "_")
        } else if string.contains(" ") {
            return capitalizeSubSequences(string, conjunction: conjunction, separator: " ")
        } else {
            return capitalizeSubSequences(string, conjunction: conjunction)
        }
    }

    public static func lowerCase(_ string: String) -> String {
        return string.trimmingCharacters(in: CharacterSet.whitespaces)
            .components(separatedBy: CharacterSet.alphanumerics.inverted).joined(separator: " ")
            .trimmingCharacters(in: CharacterSet.whitespaces)
            .lowercased()
    }

    public static func lowerFirst(_ string: String) -> String {
        return "\(string.prefix(1).lowercased())\(string.dropFirst())"
    }

    public static func pad(_ string: String, length: Int = 0, padding: String = " ") -> String {
        guard length > string.count else { return string }

        let firstPadCount = Int(((Double(length - string.count) / 2.0).rounded(.down) / Double(padding.count)).rounded(.up))
        return (String(repeating: padding, count: firstPadCount) + string).padding(toLength: length, withPad: padding, startingAt: 0)
    }

    public static func padEnd(_ string: String, length: Int = 0, padding: String = " ") -> String {
        guard length > string.count else { return string }

        return string.padding(toLength: length, withPad: padding, startingAt: 0)
    }

    public static func padStart(_ string: String, length: Int = 0, padding: String = " ") -> String {
        guard length > string.count else { return string }

        let temp = String(String(string.reversed()).padding(toLength: length, withPad: padding, startingAt: 0).reversed())
        return "\(String(temp.replacingOccurrences(of: string, with: "").reversed()))\(string)"
    }

    public static func snakeCase(_ string: String) -> String {
        let conjunction = "_"
        if string.contains("_") {
            return capitalizeSubSequences(string, conjunction: conjunction, separator: "_")
        } else if string.contains("-") {
            return capitalizeSubSequences(string, conjunction: conjunction, separator: "-")
        } else if string.contains(" ") {
            return capitalizeSubSequences(string, conjunction: conjunction, separator: " ")
        } else {
            return capitalizeSubSequences(string, conjunction: conjunction)
        }
    }

    public static func split(_ string: String, separator: String, limit: Int? = nil) -> [String] {
        let array = string.components(separatedBy: separator).filter { $0.isEmpty == false }

        guard let limit = limit else { return array }

        return array.prefix(limit).map { String($0) }
    }

    public static func startCase(_ string: String) -> String {
        return string.trimmingCharacters(in: CharacterSet.whitespaces)
            .components(separatedBy: CharacterSet.alphanumerics.inverted)
            .map {
                guard $0.uppercased() == $0 else { return $0.capitalized }
                return $0
            }
            .joined(separator: " ")
            .trimmingCharacters(in: CharacterSet.whitespaces)
    }

    public static func trim(_ string: String) -> String {
        string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }

    public static func upperCase(_ string: String) -> String {
        return string.trimmingCharacters(in: CharacterSet.whitespaces)
            .components(separatedBy: CharacterSet.alphanumerics.inverted).joined(separator: " ")
            .trimmingCharacters(in: CharacterSet.whitespaces)
            .uppercased()
    }

    public static func upperFirst(_ string: String) -> String {
        guard string.uppercased() == string else { return string.capitalized }
        return string
    }
}
