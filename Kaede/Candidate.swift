//
//  Candidate.swift
//  Kaede
//
//  Created by Takuto Nakamura on 2020/07/31.
//  Copyright © 2020 Takuto Nakamura. All rights reserved.
//

public struct Candidate {
    public let body: String
    public let remainder: String

    public var desctiption: String {
        return "body:\(body), remainder:\(remainder)"
    }

    public init(body: String, remainder: String) {
        self.body = body
        self.remainder = remainder
    }
}
