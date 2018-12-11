# Kaede

Kaede is a project to support Japanese input method.  
You can convert Roman to Hiragana and get a list of candidates that converted Hiragana into Kanji.  

## use case

```
import UIKit
import Kaede

class ViewController: UIViewController {

    let kaede = Kaede()

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let text1 = kaede.convertRomanToKana("saikou")
        Swift.print(text1)
        let res1 = kaede.requestCandidates(text)
        Swift.print(res1)


        let text2 = kaede.convertRomanToKana("kikaikagakunomati")
        Swift.print(text2)
        let res2 = kaede.requestCandidatesOfSentence(text)
        Swift.print("Candidated:[")
        for r in res2 {
            Swift.print("\tBody: \(r.body), Remainder: \(r.remainder)")
        }
        Swift.print("]")
    }
}
```

Result  
	
	saikou
	さいこう
	["最高", "再興", "採鉱", "再校", "サイコウ", "ｻｲｺｳ", "さいこう"]

	kikaikagakunomati
	きかいかがくのまち
	Candidated:[
		Body: 機械化, Remainder: がくのまち
		Body: きかいか, Remainder: がくのまち
		Body: キカイカ, Remainder: がくのまち
		Body: ｷｶｲｶ, Remainder: がくのまち
		Body: 器械, Remainder: かがくのまち
		Body: 棋界, Remainder: かがくのまち
		Body: 機会, Remainder: かがくのまち
		Body: 機械, Remainder: かがくのまち
		Body: きかい, Remainder: かがくのまち
		Body: キカイ, Remainder: かがくのまち
		Body: ｷｶｲ, Remainder: かがくのまち
		Body: 奇禍, Remainder: いかがくのまち
		Body: 奇貨, Remainder: いかがくのまち
		Body: 幾何, Remainder: いかがくのまち
		Body: 帰化, Remainder: いかがくのまち
		Body: 気化, Remainder: いかがくのまち
		Body: 貴下, Remainder: いかがくのまち
		Body: 貴家, Remainder: いかがくのまち
		Body: 麾下, Remainder: いかがくのまち
		Body: きか, Remainder: いかがくのまち
		Body: キカ, Remainder: いかがくのまち
		Body: ｷｶ, Remainder: いかがくのまち
		Body: 黄, Remainder: かいかがくのまち
		Body: 基, Remainder: かいかがくのまち
		Body: 奇, Remainder: かいかがくのまち
		Body: 忌, Remainder: かいかがくのまち
		Body: 期, Remainder: かいかがくのまち
		Body: 機, Remainder: かいかがくのまち
		Body: 気, Remainder: かいかがくのまち
		Body: 季, Remainder: かいかがくのまち
		Body: 紀, Remainder: かいかがくのまち
		Body: 記, Remainder: かいかがくのまち
		Body: 貴, Remainder: かいかがくのまち
		Body: 騎, Remainder: かいかがくのまち
		Body: 木, Remainder: かいかがくのまち
		Body: き, Remainder: かいかがくのまち
		Body: キ, Remainder: かいかがくのまち
		Body: ｷ, Remainder: かいかがくのまち
		Body: きかいかがくのまち, Remainder: 
		Body: キカイカガクノマチ, Remainder: 
		Body: ｷｶｲｶｶﾞｸﾉﾏﾁ, Remainder: 
	]
