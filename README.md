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
        let res1 = kaede.requestCandidatesOfSentence(text)
        Swift.print(res1)


        let text2 = kaede.convertRomanToKana("kikaikagakunomati")
        Swift.print(text2)
        let res2 = kaede.requestCandidatesOfSentence(text)
        Swift.print("Candidated:[")
        for r in res2 {
            Swift.print("\tBody: \(r.body), Reminder: \(r.remainder)")
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
		Body: 機械化, Reminder: がくのまち
		Body: きかいか, Reminder: がくのまち
		Body: キカイカ, Reminder: がくのまち
		Body: ｷｶｲｶ, Reminder: がくのまち
		Body: 器械, Reminder: かがくのまち
		Body: 棋界, Reminder: かがくのまち
		Body: 機会, Reminder: かがくのまち
		Body: 機械, Reminder: かがくのまち
		Body: きかい, Reminder: かがくのまち
		Body: キカイ, Reminder: かがくのまち
		Body: ｷｶｲ, Reminder: かがくのまち
		Body: 奇禍, Reminder: いかがくのまち
		Body: 奇貨, Reminder: いかがくのまち
		Body: 幾何, Reminder: いかがくのまち
		Body: 帰化, Reminder: いかがくのまち
		Body: 気化, Reminder: いかがくのまち
		Body: 貴下, Reminder: いかがくのまち
		Body: 貴家, Reminder: いかがくのまち
		Body: 麾下, Reminder: いかがくのまち
		Body: きか, Reminder: いかがくのまち
		Body: キカ, Reminder: いかがくのまち
		Body: ｷｶ, Reminder: いかがくのまち
		Body: 黄, Reminder: かいかがくのまち
		Body: 基, Reminder: かいかがくのまち
		Body: 奇, Reminder: かいかがくのまち
		Body: 忌, Reminder: かいかがくのまち
		Body: 期, Reminder: かいかがくのまち
		Body: 機, Reminder: かいかがくのまち
		Body: 気, Reminder: かいかがくのまち
		Body: 季, Reminder: かいかがくのまち
		Body: 紀, Reminder: かいかがくのまち
		Body: 記, Reminder: かいかがくのまち
		Body: 貴, Reminder: かいかがくのまち
		Body: 騎, Reminder: かいかがくのまち
		Body: 木, Reminder: かいかがくのまち
		Body: き, Reminder: かいかがくのまち
		Body: キ, Reminder: かいかがくのまち
		Body: ｷ, Reminder: かいかがくのまち
		Body: きかいかがくのまち, Reminder: 
		Body: キカイカガクノマチ, Reminder: 
		Body: ｷｶｲｶｶﾞｸﾉﾏﾁ, Reminder: 
	]