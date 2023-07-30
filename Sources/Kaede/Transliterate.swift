/*
 Transliterate.swift
 Kaede

 Created by Takuto Nakamura on 2023/07/30. 
*/

import Foundation

struct Transliterate {
    private func perform(source: String, transform: CFString, reverse: Bool) -> String {
        let string = CFStringCreateMutableCopy(kCFAllocatorDefault, 0, source as CFString)
        if CFStringTransform(string, nil, transform, reverse) {
            return String(describing: string!)
        } else {
            return source
        }
    }

    func toKatakana(_ string: String) -> String {
        return perform(source: string,
                       transform: kCFStringTransformHiraganaKatakana,
                       reverse: false)
    }

    func toHalfKatakana(_ string: String) -> String {
        return perform(source: toKatakana(string),
                       transform: kCFStringTransformFullwidthHalfwidth,
                       reverse: false)
    }
}
