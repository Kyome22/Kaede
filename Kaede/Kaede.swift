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
                    if source.count == 3 {
                        let length = source[2].count
                        if length > l {
                            let words = [Word]()
                            self?.list.append(words)
                            l = length
                        }
                        let word = Word(frequency: Int(source[0]) ?? 0, after: source[1], before: source[2])
                        guard let _self = self else { return }
                        _self.list[_self.list.count - 1].append(word)
                    }
                }
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
    
}
