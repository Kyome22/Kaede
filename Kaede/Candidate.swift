//
//  Candidate.swift
//  Kaede
//
//  Created by Takuto Nakamura on 2020/07/31.
//  Copyright © 2020 Takuto Nakamura. All rights reserved.
//

public struct Candidate {
    let body: String
    let remainder: String

    var desctiption: String {
        return "body:\(body), remainder:\(remainder)"
    }
}
