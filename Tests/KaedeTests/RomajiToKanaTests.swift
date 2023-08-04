import XCTest
@testable import Kaede

final class RomajiToKanaTests: XCTestCase {
    func testNormal() {
        let sut = RomajiToKana()

        var actual = sut.convertHiragana(roman: "aiueo")
        XCTAssertEqual(actual, "あいうえお")

        actual = sut.convertHiragana(roman: "kakikukeko")
        XCTAssertEqual(actual, "かきくけこ")

        actual = sut.convertHiragana(roman: "sasishisuseso")
        XCTAssertEqual(actual, "さししすせそ")

        actual = sut.convertHiragana(roman: "tatichitutsuteto")
        XCTAssertEqual(actual, "たちちつつてと")

        actual = sut.convertHiragana(roman: "naninuneno")
        XCTAssertEqual(actual, "なにぬねの")

        actual = sut.convertHiragana(roman: "hahihufuheho")
        XCTAssertEqual(actual, "はひふふへほ")

        actual = sut.convertHiragana(roman: "mamimumemo")
        XCTAssertEqual(actual, "まみむめも")

        actual = sut.convertHiragana(roman: "yayuyo")
        XCTAssertEqual(actual, "やゆよ")

        actual = sut.convertHiragana(roman: "rarirurero")
        XCTAssertEqual(actual, "らりるれろ")

        actual = sut.convertHiragana(roman: "wawon'nn")
        XCTAssertEqual(actual, "わをんん")

        actual = sut.convertHiragana(roman: "konnnichiha")
        XCTAssertEqual(actual, "こんにちは")
    }

    func testKomoji() {
        let sut = RomajiToKana()

        var actual = sut.convertHiragana(roman: "xaxixuxexo")
        XCTAssertEqual(actual, "ぁぃぅぇぉ")

        actual = sut.convertHiragana(roman: "lalilulelo")
        XCTAssertEqual(actual, "ぁぃぅぇぉ")

        actual = sut.convertHiragana(roman: "xtuxtsultsuttu")
        XCTAssertEqual(actual, "っっっっつ")

        actual = sut.convertHiragana(roman: "xyaxyuxyo")
        XCTAssertEqual(actual, "ゃゅょ")

        actual = sut.convertHiragana(roman: "lyalyulyo")
        XCTAssertEqual(actual, "ゃゅょ")
    }

    func testDakuten() {
        let sut = RomajiToKana()

        var actual = sut.convertHiragana(roman: "gagigugego")
        XCTAssertEqual(actual, "がぎぐげご")

        actual = sut.convertHiragana(roman: "zazijizuzezo")
        XCTAssertEqual(actual, "ざじじずぜぞ")

        actual = sut.convertHiragana(roman: "dadidudedo")
        XCTAssertEqual(actual, "だぢづでど")

        actual = sut.convertHiragana(roman: "babibubebo")
        XCTAssertEqual(actual, "ばびぶべぼ")
    }

    func testHanDakuten() {
        let sut = RomajiToKana()

        let actual = sut.convertHiragana(roman: "papipupepo")
        XCTAssertEqual(actual, "ぱぴぷぺぽ")
    }

    func testComplex() {
        let sut = RomajiToKana()

        var actual = sut.convertHiragana(roman: "shachousann")
        XCTAssertEqual(actual, "しゃちょうさん")

        actual = sut.convertHiragana(roman: "thissyu")
        XCTAssertEqual(actual, "てぃっしゅ")

        actual = sut.convertHiragana(roman: "suta-who-zu")
        XCTAssertEqual(actual, "すたーうぉーず")
    }

    func testRare() {
        let sut = RomajiToKana()

        var actual = sut.convertHiragana(roman: "lwa")
        XCTAssertEqual(actual, "ゎ")

        actual = sut.convertHiragana(roman: "wyiwye")
        XCTAssertEqual(actual, "ゐゑ")

        actual = sut.convertHiragana(roman: "wyiwye")
        XCTAssertEqual(actual, "ゐゑ")

        actual = sut.convertHiragana(roman: "wyiwye")
        XCTAssertEqual(actual, "ゐゑ")
    }
}
