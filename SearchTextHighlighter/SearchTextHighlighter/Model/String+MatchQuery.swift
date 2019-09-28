//
//  String+MatchQuery.swift
//  SearchTextHighlighter
//
//  Created by Maxim on 28/09/2019.
//  Copyright © 2019 Maxim Ivunin. All rights reserved.
//

import Foundation

extension String {
    
    func matchesQuery(for searchWords: [String]) -> Bool {
        var mutableElements = searchWords
        let queryWordList = lowercased()
            .toLatin()
            .components(separatedBy: " ")
            .sorted { $0.count > $1.count }
        
        for queryWord in queryWordList {
            if let indexFound = mutableElements.firstIndex(where: { $0.hasPrefix(queryWord) }) {
                mutableElements.remove(at: indexFound)
            } else {
                return false
            }
        }
        return true
    }
    
    var cyrillicToLatinMap: [Character: String] {
        return ["щ":"shch", "ш":"sh", "а": "a", "б": "b", "в": "v", "г":"g", "д":"d", "е":"e", "ё":"yo", "ж":"zh", "з":"z", "и":"i", "й":"j",
                "к":"k", "л":"l", "м":"m", "н":"n", "о":"o", "п":"p", "р":"r", "с":"s",
                "т":"t", "у":"u", "ф":"f", "х":"h", "ц":"ts",
                "ч":"ch",  "ъ":"'", "ы":"y", "ь":"'", "э":"e", "ю":"yu", "я":"ya"]
    }
    
    private var latinToCyrillicMap: [String: String] {
        return ["shch": "щ", "zh": "ж", "ts": "ц", "ch": "ч",
                "sh": "ш", "yu": "ю", "ya": "я", "yo": "ё",
                "ye": "ъе", "a": "а", "b": "б", "c": "к",
                "d": "д", "e": "е", "f": "ф", "g": "г",
                "h": "х", "i": "и", "j": "й", "k": "к",
                "l": "л", "m": "м", "n": "н", "o": "о",
                "p": "п", "q": "к", "r": "р", "s": "с",
                "t": "т", "u": "у", "v": "в", "w": "в",
                "x": "кс", "y": "ы", "z": "з", "'": "ь"]
    }
    
    
    func toLatin() -> String {
        return lowercased().map { cyrillicToLatinMap[$0] ?? String($0) }.joined()
    }
    
    func toCyrillic() -> String {
        var tmp = lowercased()
        let keys: [String] = latinToCyrillicMap.keys.sorted(by: { $0.count > $1.count})
        keys.forEach { tmp = tmp.replacingOccurrences(of: $0, with: latinToCyrillicMap[$0] ?? $0) }
        return tmp
    }
    
}
