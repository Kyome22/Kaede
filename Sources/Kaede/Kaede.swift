/*
 Kaede.swift
 Kaede

 Created by Takuto Nakamura on 2023/07/30.
*/

public struct Kaede {
    let romajiToKana = RomajiToKana()
    let transliterate = Transliterate()

    public func convertRomanToKana(text: String) -> String {
        return romajiToKana.convertHiragana(roman: text)
    }

    public func convertKanaToKatakana(text: String) -> String {
        return transliterate.toKatakana(text)
    }

    public func convertKanaToHalfKatakana(text: String) -> String {
        return transliterate.toHalfKatakana(text)
    }
}
