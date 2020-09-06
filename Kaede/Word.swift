//
//  Word.swift
//  Kaede
//
//  Created by Takuto Nakamura on 2020/07/31.
//  Copyright © 2020 Takuto Nakamura. All rights reserved.
//

public struct Word {
    public let ruby: String
    public let value: String

    public var desctiption: String {
        return "ruby:\(ruby), value:\(value)"
    }
}
