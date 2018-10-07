//
//  KaedeTests.swift
//  KaedeTests
//
//  Created by Takuto Nakamura on 2018/10/07.
//  Copyright © 2018 Takuto Nakamura. All rights reserved.
//

import XCTest
@testable import Kaede

class KaedeTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testKaede() {
        let kaede = Kaede()
        var res = kaede.requestCandidates("kokoro")
        Swift.print(res)
        res = kaede.requestCandidates("tsukuba")
        Swift.print(res)
        res = kaede.requestCandidates("ryoushin")
        Swift.print(res)
        res = kaede.requestCandidates("nani")
        Swift.print(res)
        res = kaede.requestCandidates("nyan")
        Swift.print(res)
        res = kaede.requestCandidates("nyann")
        Swift.print(res)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
