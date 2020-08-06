//
//  Kaede.swift
//  Kaede
//
//  Created by Takuto Nakamura on 2020/07/31.
//  Copyright © 2020 Takuto Nakamura. All rights reserved.
//

//import Foundation

public class Kaede {

    private var list = [[Word]]()

    public init() {
        inputCSV()
    }

    private func inputCSV() {
        guard
            let filePath = Bundle(for: Kaede.self).path(forResource: "dictionary", ofType: "csv"),
            let file = try? String(contentsOfFile: filePath, encoding: .utf8)
            else { fatalError("Could not load the dictionary.csv") }
        file.enumerateLines { [weak self] (line, _) in
            guard let self = self else { return }
            let source = line.components(separatedBy: ",")
            if source.count != 2 { return }
            if self.list.count < source[0].count {
                self.list.append([])
            }
            self.list[self.list.count - 1].append(Word(ruby: source[0], value: source[1]))
        }
    }

    public func convertRomanToKana(text: String) -> String {
        return RomajiToKana.convertHiragana(roman: text)
    }

    public func requestCandidates(text: String) -> [String] {
        var results = [String]()
        if text.count <= list.count {
            let words = list[text.count - 1].filter { $0.ruby == text }.map { $0.value }
            results.append(contentsOf: words)
        }
        results.append(Transliterate.toKatakana(text))
        results.append(Transliterate.toHalfKatakana(text))
        results.append(text)
        return NSOrderedSet(array: results).array as! [String]
    }

    private func extractCandidates(text: String) -> [Candidate] {
        if text.isEmpty { return [] }
        var results = [Candidate]()
        for i in (1 ... min(list.count, text.count)).reversed() {
            let strL = String(text[text.startIndex ..< text.index(text.startIndex, offsetBy: i)])
            let strR = String(text[text.index(text.startIndex, offsetBy: i) ..< text.endIndex])
            var flag: Bool = false
            for test in list[strL.count - 1] {
                if strL != test.ruby { continue }
                flag = true
                results.append(Candidate(body: test.value, remainder: strR))
            }
            if flag {
                results.append(Candidate(body: strL, remainder: strR))
                results.append(Candidate(body: Transliterate.toKatakana(strL), remainder: strR))
                results.append(Candidate(body: Transliterate.toHalfKatakana(strL), remainder: strR))
            }
        }
        return results
    }

    public func requestCandidates(of sentence: String) -> [Candidate] {
        var results = extractCandidates(text: sentence)
        results.append(Candidate(body: sentence, remainder: ""))
        results.append(Candidate(body: Transliterate.toKatakana(sentence), remainder: ""))
        results.append(Candidate(body: Transliterate.toHalfKatakana(sentence), remainder: ""))
        return results.reduce([]) { (res, candidate) -> [Candidate] in
            return res.contains { $0.body == candidate.body } ? res : res + [candidate]
        }
    }

}
