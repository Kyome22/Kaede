//
//  KaedeTests.swift
//  KaedeTests
//
//  Created by Takuto Nakamura on 2020/07/31.
//  Copyright © 2020 Takuto Nakamura. All rights reserved.
//

import XCTest
@testable import Kaede

class KaedeTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitializeKaede() throws {
        let kaede: Kaede? = Kaede()
        XCTAssertNotNil(kaede)
    }

    func testTomanToKana() {
        let kaede = Kaede()
        let saikou = kaede.convertRomanToKana(text: "saikou")
        XCTAssertEqual(saikou, "さいこう")
    }

    func testText() {
        let kaede = Kaede()
        let candidates = kaede.requestCandidates(text: "saikou")
        let expects = ["催行", "再攻", "再校", "再構", "再考", "再興",
                       "採光", "採鉱", "斉衡", "最硬", "最高", "砕鉱",
                       "菜肴", "サイコウ", "ｻｲｺｳ", "さいこう", "saikou"]
        XCTAssertEqual(candidates, expects)
    }

    func testSentence() {
        let kaede = Kaede()
        let candidates = kaede.requestCandidates(of: "kikaikagakunomati")
        candidates.forEach { (candidate) in
            Swift.print(candidate.desctiption)
        }
    }


    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
