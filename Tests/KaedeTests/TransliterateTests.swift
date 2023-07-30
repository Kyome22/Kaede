import XCTest
@testable import Kaede

final class TransliterateTests: XCTestCase {
    func testHiraganaToKatakana() {
        let sut = Transliterate()

        var actual = sut.toKatakana("あいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほまみむめもやゆよらりるれろわをん")
        XCTAssertEqual(actual, "アイウエオカキクケコサシスセソタチツテトナニヌネノハヒフヘホマミムメモヤユヨラリルレロワヲン")

        actual = sut.toKatakana("がぎぐげござじずぜぞだぢづでどばびぶべぼ")
        XCTAssertEqual(actual, "ガギグゲゴザジズゼゾダヂヅデドバビブベボ")

        actual = sut.toKatakana("ぱぴぷぺぽ")
        XCTAssertEqual(actual, "パピプペポ")

        actual = sut.toKatakana("きゃきゅきょしゃしゅしょちゃちゅちょにゃにゅにょひゃひゅひょりゃりゅりょ")
        XCTAssertEqual(actual, "キャキュキョシャシュショチャチュチョニャニュニョヒャヒュヒョリャリュリョ")

        actual = sut.toKatakana("ぁぃぅぇぉっゃゅょゎ")
        XCTAssertEqual(actual, "ァィゥェォッャュョヮ")

        actual = sut.toKatakana("ゐゑ")
        XCTAssertEqual(actual, "ヰヱ")
    }

    func testHiraganaToHalfKatakana() {
        let sut = Transliterate()

        var actual = sut.toHalfKatakana("アイウエオカキクケコサシスセソタチツテトナニヌネノハヒフヘホマミムメモヤユヨラリルレロワヲン")
        XCTAssertEqual(actual, "ｱｲｳｴｵｶｷｸｹｺｻｼｽｾｿﾀﾁﾂﾃﾄﾅﾆﾇﾈﾉﾊﾋﾌﾍﾎﾏﾐﾑﾒﾓﾔﾕﾖﾗﾘﾙﾚﾛﾜｦﾝ")

        actual = sut.toHalfKatakana("ガギグゲゴザジズゼゾダヂヅデドバビブベボ")
        XCTAssertEqual(actual, "ｶﾞｷﾞｸﾞｹﾞｺﾞｻﾞｼﾞｽﾞｾﾞｿﾞﾀﾞﾁﾞﾂﾞﾃﾞﾄﾞﾊﾞﾋﾞﾌﾞﾍﾞﾎﾞ")

        actual = sut.toHalfKatakana("パピプペポ")
        XCTAssertEqual(actual, "ﾊﾟﾋﾟﾌﾟﾍﾟﾎﾟ")

        actual = sut.toHalfKatakana("キャキュキョシャシュショチャチュチョニャニュニョヒャヒュヒョリャリュリョ")
        XCTAssertEqual(actual, "ｷｬｷｭｷｮｼｬｼｭｼｮﾁｬﾁｭﾁｮﾆｬﾆｭﾆｮﾋｬﾋｭﾋｮﾘｬﾘｭﾘｮ")

        actual = sut.toHalfKatakana("ァィゥェォッャュョ")
        XCTAssertEqual(actual, "ｧｨｩｪｫｯｬｭｮ")
    }
}
