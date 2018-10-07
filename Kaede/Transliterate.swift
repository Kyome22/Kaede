//
//  Transliterate.swift
//  Kaede
//
//  Created by Takuto Nakamura on 2018/10/07.
//  Copyright © 2018 Takuto Nakamura. All rights reserved.
//

import Foundation

final class Transliterate {
    
    private static func transliterateString(source: String, transform: CFString, reverse: Bool) -> String {
        let string = CFStringCreateMutableCopy(kCFAllocatorDefault, 0, source as CFString)
        if CFStringTransform(string, nil, transform, reverse) {
            return String(describing: string!)
        } else {
            return source
        }
    }
    
    public static func toKatakana(_ string: String) -> String {
        return transliterateString(source: string,
                                   transform: kCFStringTransformHiraganaKatakana,
                                   reverse: false)
    }
    
    public static func toHalfKatakana(_ string: String) -> String {
        return transliterateString(source: toKatakana(string),
                                   transform: kCFStringTransformFullwidthHalfwidth,
                                   reverse: false)
    }
    
}
