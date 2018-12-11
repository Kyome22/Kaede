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
        var meu = kaede.convertRomanToKana("saikou")
        var res = kaede.requestCandidates(meu)
        Swift.print(res)
        
        meu = kaede.convertRomanToKana("ki")
        res = kaede.requestCandidates(meu)
        Swift.print(res)
    }
    
    func testKaede2() {
        let origin: String = "kikaikagakunomati"
        let kaede2 = Kaede()
        Swift.print(origin)
        let meu = kaede2.convertRomanToKana(origin)
        Swift.print(meu)
        let res = kaede2.requestCandidatesOfSentence(meu)
        
        Swift.print("Candidated:[")
        for r in res {
            Swift.print("\tBody: \(r.body), Reminder: \(r.remainder)")
        }
        Swift.print("]")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
