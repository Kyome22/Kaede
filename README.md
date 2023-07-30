# Kaede

Kaede supports you to convert roman text to hiragana, katakana, and half-katakana.

## Usage

```swift
import Kaede

let kaede = Kaede()

let hiragana = kaede.convertRomanToKana("konnnichiha")
// hiragana => "こんにちは"

let katakana = kaede.convertKanaToKatakana(hiragana)
// katakana => "コンニチハ"

let halfKatakana = kaede.convertKanaToHalfKatakana(hiragana)
// halfKatakana => "ｺﾝﾆﾁﾊ"
```
