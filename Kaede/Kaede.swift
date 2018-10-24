//
//  Kaede.swift
//  Kaede
//
//  Created by Takuto Nakamura on 2018/10/07.
//  Copyright © 2018 Takuto Nakamura. All rights reserved.
//

import Foundation

open class Kaede: NSObject {
    
    private var list = [[Word]]()
    
    
    public override init() {
        super.init()
        inputCSV()
    }
    
    private func inputCSV() {
        if let filePath = Bundle(for: type(of: self)).path(forResource: "dictionary", ofType: "csv") {
            do {
                let str = try String(contentsOfFile: filePath, encoding: String.Encoding.utf8)
                var l: Int = 0
                str.enumerateLines { [weak self] (line, stop) in
                    let source = line.components(separatedBy: ",")
                    if source.count == 2 {
                        let length = source[0].count
                        if length > l {
                            let words = [Word]()
                            self?.list.append(words)
                            l = length
                        }
                        let word = Word(before: source[0], after: source[1])
                        guard let _self = self else { return }
                        _self.list[_self.list.count - 1].append(word)
                    }
                }
                Swift.print(list.count)
            } catch let error {
                Swift.print(error.localizedDescription)
            }
        } else {
            Swift.print("gomi")
        }
    }
    
    public func convertRomanToKana(_ text: String) -> String {
        return RomajiToKana.convertHiragana(roman: text)
    }
    
    public func requestCandidates(_ text: String) -> [String] {
        var results = [String]()
        if list.count >= text.count {
            for test in list[text.count - 1].reversed() {
                if text == test.before {
                    results.append(test.after)
                }
            }
        }
        results.append(Transliterate.toKatakana(text))
        results.append(Transliterate.toHalfKatakana(text))
        results.append(text)
        let orderedSet = NSOrderedSet(array: results)
        results = orderedSet.array as! [String]
        return results
    }
    
    public func requestCandidatesOfSentence(_ text: String) -> [(body: String, remainder: String)] {
        var results = extractCandidates(text)
        results.append((body: text, remainder: ""))
        results.append((body: Transliterate.toKatakana(text), remainder: ""))
        results.append((body: Transliterate.toHalfKatakana(text), remainder: ""))
        let orderedSet = NSOrderedSet(array: results)
        results = orderedSet.array as! [(body: String, remainder: String)]
        return results
    }
    
    private func extractCandidates(_ text: String) -> [(body: String, remainder: String)] {
        var results = [(body: String, remainder: String)]()
        if text.count == 0 {
            return results
        }
        for i in (1 ... min(list.count, text.count)).reversed() {
            let strL = String(text[text.startIndex ..< text.index(text.startIndex, offsetBy: i)])
            let strR = String(text[text.index(text.startIndex, offsetBy: i) ..< text.endIndex])
            var flag: Bool = false
            for test in list[strL.count - 1] {
                if strL == test.before {
                    flag = true
                    results.append((body: test.after, remainder: strR))
                }
            }
            if flag {
                results.append((body: strL, remainder: strR))
                results.append((body: Transliterate.toKatakana(strL), remainder: strR))
                results.append((body: Transliterate.toHalfKatakana(strL), remainder: strR))
            }
        }
        return results
    }
    
}
