//
//  Constants.swift
//
//
//  Created by Keanu Pang on 2022/1/26.
//

import Foundation

internal let escapeCodeMapping: KeyValuePairs = [
    "&amp;": "&",
    "&quot;": "\"",
    "&apos;": "'",
    "&lt;": "<",
    "&gt;": ">",
]

// from the awesome library https://github.com/rwbutler/LetterCase
internal func capitalizeSubSequences(_ string: String, conjunction: String = "", separator: String.Element? = nil) -> String {
    var result = ""
    let subSequences: [String.SubSequence]
    if let separator = separator {
        subSequences = string.split(separator: separator)
    } else {
        subSequences = capitalizedSubSequences(string)
    }
    for subSequence in subSequences {
        if let firstChar = subSequence.first {
            let suffix = String(subSequence.dropFirst())
            result += String(firstChar).lowercased() + suffix.lowercased() + conjunction
        }
    }
    if !conjunction.isEmpty, !result.isEmpty {
        result = String(result.dropLast())
    }

    return result
}

private func capitalizedSubSequences(_ string: String) -> [String.SubSequence] {
    let input = string
    var seqStartIndex = input.startIndex
    var subSequences: [String.SubSequence] = []
    for index in input.indices {
        let currentCharacter = input[index]
        if currentCharacter.isUppercase {
            if index != input.startIndex {
                let seqEndIndex = input.index(before: index)
                let subSequence = input[seqStartIndex ... seqEndIndex]
                subSequences.append(subSequence)
            }
            seqStartIndex = index
        }
    }
    let subSequence = input[seqStartIndex ..< input.endIndex]
    subSequences.append(subSequence)
    return subSequences
}
