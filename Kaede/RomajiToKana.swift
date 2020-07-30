//
//  RomajiToKana.swift
//  Kaede
//
//  Created by Takuto Nakamura on 2020/07/31.
//  Copyright © 2020 Takuto Nakamura. All rights reserved.
//

final class RomajiToKana {

    public static func convertHiragana(roman: String) -> String {
        var str = roman.lowercased()
        var n: Int = 0
        while str.count >= 2 && n < str.count - 1 {
            let strL = String(str[str.startIndex ..< str.index(str.startIndex, offsetBy: n)])
            let strC = String(str[str.index(str.startIndex, offsetBy: n) ..< str.index(str.startIndex, offsetBy: n + 2)])
            let strR = String(str[str.index(str.startIndex, offsetBy: n + 2) ..< str.endIndex])
            str = strL + nCheck(strC) + strR
            n += 1
        }
        n = 0
        while str.count >= 2 && n < str.count - 1 {
            let strL = String(str[str.startIndex ..< str.index(str.startIndex, offsetBy: n)])
            let strC = String(str[str.index(str.startIndex, offsetBy: n) ..< str.index(str.startIndex, offsetBy: n + 2)])
            let strR = String(str[str.index(str.startIndex, offsetBy: n + 2) ..< str.endIndex])
            str = strL + xtuCheck(strC) + strR
            n += 1
        }
        for i in (1 ... 4).reversed() {
            n = 0
            while str.count >= i && n < str.count - (i - 1) {
                let strL = String(str[str.startIndex ..< str.index(str.startIndex, offsetBy: n)])
                let strC = String(str[str.index(str.startIndex, offsetBy: n) ..< str.index(str.startIndex, offsetBy: n + i)])
                let strR = String(str[str.index(str.startIndex, offsetBy: n + i) ..< str.endIndex])
                str = strL + convert(strC) + strR
                n += 1
            }
        }
        return str
    }

    private static func isRoman(_ str: Character) -> Bool {
        return NSPredicate(format: "SELF MATCHES %@", "[a-zA-Z]+").evaluate(with: String(str))
    }

    private static func nCheck(_ str: String) -> String {
        switch str {
        case "na": return str
        case "ni": return str
        case "nu": return str
        case "ne": return str
        case "no": return str
        case "ny": return str
        case "n'", "nn": return "ん"
        default:
            if str.first! == "n" {
                return "ん" + String(str.last!)
            } else {
                return str
            }
        }
    }

    private static func xtuCheck(_ str: String) -> String {
        if isRoman(str.first!) && str.first! == str.last! {
            let f = str.first!
            if f == "a" || f == "i" || f == "u" || f == "e" || f == "o" {
                return str
            } else {
                return "っ" + String(str.last!)
            }
        }
        return str
    }

    private static func convert(_ str: String) -> String {
        switch str.count {
        case 1:
            return one(str)
        case 2:
            return two(str)
        case 3:
            switch str.dropFirst().first! {
            case "y": return threeY(str)
            case "h": return threeH(str)
            case "w": return threeW(str)
            default:
                switch str {
                case "tsa": return "つぁ"
                case "tsi": return "つぃ"
                case "tsu": return "つ"
                case "tse": return "つぇ"
                case "tso": return "つぉ"
                case "xtu", "ltu": return "っ"
                default: break
                }
                return str
            }
        case 4:
            return (str == "xtsu" || str == "ltsu") ? "っ" : str
        default:
            return str
        }
    }

    private static func one(_ str: String) -> String {
        switch str {
        case "a": return "あ"
        case "i": return "い"
        case "u": return "う"
        case "e": return "え"
        case "o": return "お"
        case "n": return "ん"
        case "1": return "１"
        case "2": return "２"
        case "3": return "３"
        case "4": return "４"
        case "5": return "５"
        case "6": return "６"
        case "7": return "７"
        case "8": return "８"
        case "9": return "９"
        case "0": return "０"
        case ".": return "。"
        case ",": return "、"
        case "!": return "！"
        case "?": return "？"
        case ":": return "："
        case ";": return "；"
        case "-": return "ー"
        case "+": return "＋"
        case "*": return "＊"
        case "/": return "／"
        case "\\": return "＼"
        case "|": return "｜"
        case "^": return "＾"
        case "=": return "＝"
        case "_": return "＿"
        case "@": return "＠"
        case "\'": return "’"
        case "\"": return "”"
        case "`": return "｀"
        case "~": return "〜"
        case "#": return "＃"
        case "$": return "＄"
        case "%": return "％"
        case "&": return "＆"
        case "(": return "（"
        case ")": return "）"
        case "[": return "「"
        case "]": return "」"
        case "{": return "『"
        case "}": return "』"
        case "<": return "＜"
        case ">": return "＞"
        case " ": return "　"
        default: return str
        }
    }

    private static func two(_ str: String) -> String {
        switch str {
        case "ba": return "ば"
        case "bi": return "び"
        case "bu": return "ぶ"
        case "be": return "べ"
        case "bo": return "ぼ"
        case "da": return "だ"
        case "di": return "ぢ"
        case "du": return "づ"
        case "de": return "で"
        case "do": return "ど"
        case "fa": return "ふぁ"
        case "fi": return "ふぃ"
        case "fu": return "ふ"
        case "fe": return "ふぇ"
        case "fo": return "ふぉ"
        case "ga": return "が"
        case "gi": return "ぎ"
        case "gu": return "ぐ"
        case "ge": return "げ"
        case "go": return "ご"
        case "ha": return "は"
        case "hi": return "ひ"
        case "hu": return "ふ"
        case "he": return "へ"
        case "ho": return "ほ"
        case "ja": return "じゃ"
        case "ji": return "じ"
        case "ju": return "じゅ"
        case "je": return "じぇ"
        case "jo": return "じょ"
        case "ka": return "か"
        case "ki": return "き"
        case "ku": return "く"
        case "ke": return "け"
        case "ko": return "こ"
        case "la": return "ぁ"
        case "li": return "ぃ"
        case "lu": return "ぅ"
        case "le": return "ぇ"
        case "lo": return "ぉ"
        case "ma": return "ま"
        case "mi": return "み"
        case "mu": return "む"
        case "me": return "め"
        case "mo": return "も"
        case "na": return "な"
        case "ni": return "に"
        case "nu": return "ぬ"
        case "ne": return "ね"
        case "no": return "の"
        case "pa": return "ぱ"
        case "pi": return "ぴ"
        case "pu": return "ぷ"
        case "pe": return "ぺ"
        case "po": return "ぽ"
        case "qa": return "くぁ"
        case "qi": return "くい"
        case "qu": return "くぅ"
        case "qe": return "くぇ"
        case "qo": return "くぉ"
        case "ra": return "ら"
        case "ri": return "り"
        case "ru": return "る"
        case "re": return "れ"
        case "ro": return "ろ"
        case "sa": return "さ"
        case "si": return "し"
        case "su": return "す"
        case "se": return "せ"
        case "so": return "そ"
        case "ta": return "た"
        case "ti": return "ち"
        case "tu": return "つ"
        case "te": return "て"
        case "to": return "と"
        case "va": return "ゔぁ"
        case "vi": return "ゔぃ"
        case "vu": return "ゔ"
        case "ve": return "ゔぇ"
        case "vo": return "ゔぉ"
        case "wa": return "わ"
        case "wi": return "うぃ"
        case "wu": return "う"
        case "we": return "うぇ"
        case "wo": return "を"
        case "xa": return "ぁ"
        case "xi": return "ぃ"
        case "xu": return "ぅ"
        case "xe": return "ぇ"
        case "xo": return "ぉ"
        case "ya": return "や"
        case "yu": return "ゆ"
        case "yo": return "よ"
        case "za": return "ざ"
        case "zi": return "じ"
        case "zu": return "ず"
        case "ze": return "ぜ"
        case "zo": return "ぞ"
        default: return str
        }
    }

    private static func threeY(_ str: String) -> String {
        func yaiueo(head: String, str: String) -> String {
            switch str {
            case "ya": return head + "ゃ"
            case "yi": return head + "ぃ"
            case "yu": return head + "ゅ"
            case "ye": return head + "ぇ"
            case "yo": return head + "ょ"
            default: return str
            }
        }
        switch str.first! {
        case "b": return yaiueo(head: "び", str: String(str.dropFirst()))
        case "c": return yaiueo(head: "ち", str: String(str.dropFirst()))
        case "d": return yaiueo(head: "ぢ", str: String(str.dropFirst()))
        case "f": return yaiueo(head: "ふ", str: String(str.dropFirst()))
        case "g": return yaiueo(head: "ぎ", str: String(str.dropFirst()))
        case "h": return yaiueo(head: "ひ", str: String(str.dropFirst()))
        case "j": return yaiueo(head: "じ", str: String(str.dropFirst()))
        case "k": return yaiueo(head: "き", str: String(str.dropFirst()))
        case "l": return yaiueo(head: "", str: String(str.dropFirst()))
        case "m": return yaiueo(head: "み", str: String(str.dropFirst()))
        case "n": return yaiueo(head: "に", str: String(str.dropFirst()))
        case "p": return yaiueo(head: "ぴ", str: String(str.dropFirst()))
        case "r": return yaiueo(head: "り", str: String(str.dropFirst()))
        case "s": return yaiueo(head: "し", str: String(str.dropFirst()))
        case "t": return yaiueo(head: "ち", str: String(str.dropFirst()))
        case "v": return yaiueo(head: "ゔ", str: String(str.dropFirst()))
        case "x": return yaiueo(head: "", str: String(str.dropFirst()))
        case "z": return yaiueo(head: "じ", str: String(str.dropFirst()))
        default:
            if str == "wyi" {
                return "ゐ"
            } else if str == "wye" {
                return "ゑ"
            } else {
                return str
            }
        }
    }

    private static func threeH(_ str: String) -> String {
        switch str {
        case "cha": return "ちゃ"
        case "chi": return "ち"
        case "chu": return "ちゅ"
        case "che": return "ちぇ"
        case "cho": return "ちょ"
        case "dha": return "でゃ"
        case "dhi": return "でぃ"
        case "dhu": return "でゅ"
        case "dhe": return "でぇ"
        case "dho": return "でょ"
        case "sha": return "しゃ"
        case "shi": return "し"
        case "shu": return "しゅ"
        case "she": return "しぇ"
        case "sho": return "しょ"
        case "tha": return "てゃ"
        case "thi": return "てぃ"
        case "thu": return "てゅ"
        case "the": return "てぇ"
        case "tho": return "てょ"
        case "wha": return "うぁ"
        case "whi": return "うぃ"
        case "whu": return "う"
        case "whe": return "うぇ"
        case "who": return "うぉ"
        default: return str
        }
    }

    private static func threeW(_ str: String) -> String {
        switch str {
        case "dwa": return "どぁ"
        case "dwi": return "どぃ"
        case "dwu": return "どぅ"
        case "dwe": return "どぇ"
        case "dwo": return "どぉ"
        case "gwa": return "ぐぁ"
        case "gwi": return "ぐぃ"
        case "gwu": return "ぐぅ"
        case "gwe": return "ぐぇ"
        case "gwo": return "ぐぉ"
        case "kwa": return "くぁ"
        case "kwi": return "くぃ"
        case "kwu": return "くぅ"
        case "kwe": return "くぇ"
        case "kwo": return "くぉ"
        case "lwa": return "ゎ"
        case "swa": return "すぁ"
        case "swi": return "すぃ"
        case "swu": return "すぅ"
        case "swe": return "すぇ"
        case "swo": return "すぉ"
        case "twa": return "とぁ"
        case "twi": return "とぃ"
        case "twu": return "とぅ"
        case "twe": return "とぇ"
        case "two": return "とぉ"
        case "xwa": return "ゎ"
        default: return str
        }
    }

}
