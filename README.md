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

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let text1 = kaede.convertRomanToKana(text: "saikou")
        Swift.print(text1)
        let candidates1 = kaede.requestCandidates(text: text1)
        Swift.print(candidates1)

        let text2 = kaede.convertRomanToKana(text: "kikaikagakunomati")
        Swift.print(text2)
        let candidates2 = kaede.requestCandidates(of: text2)
        candidates2.forEach { (candidate) in
            Swift.print(candidate.desctiption)
        }
    }
}
```

## Result  

```
さいこう
[
 "催行", 
 "再攻", 
 "再校", 
 "再構", 
 "再考", 
 "再興", 
 "採光", 
 "採鉱", 
 "斉衡", 
 "最硬", 
 "最高", 
 "砕鉱", 
 "菜肴", 
 "サイコウ", 
 "ｻｲｺｳ", 
 "さいこう"
]

きかいかがくのまち
body:器怪, remainder:かがくのまち
body:器械, remainder:かがくのまち
body:奇怪, remainder:かがくのまち
body:棋界, remainder:かがくのまち
body:機会, remainder:かがくのまち
body:機械, remainder:かがくのまち
body:毀壊, remainder:かがくのまち
body:気塊, remainder:かがくのまち
body:気海, remainder:かがくのまち
body:貴会, remainder:かがくのまち
body:鬼怪, remainder:かがくのまち
body:きかい, remainder:かがくのまち
body:キカイ, remainder:かがくのまち
body:ｷｶｲ, remainder:かがくのまち
body:危禍, remainder:いかがくのまち
body:奇花, remainder:いかがくのまち
body:奇貨, remainder:いかがくのまち
body:帰化, remainder:いかがくのまち
body:帰嫁, remainder:いかがくのまち
body:帰家, remainder:いかがくのまち
body:帰樺, remainder:いかがくのまち
body:幾何, remainder:いかがくのまち
body:揮下, remainder:いかがくのまち
body:旗下, remainder:いかがくのまち
body:机下, remainder:いかがくのまち
body:気化, remainder:いかがくのまち
body:貴下, remainder:いかがくのまち
body:貴家, remainder:いかがくのまち
body:起貨, remainder:いかがくのまち
body:麾下, remainder:いかがくのまち
body:きか, remainder:いかがくのまち
body:キカ, remainder:いかがくのまち
body:ｷｶ, remainder:いかがくのまち
body:伎, remainder:かいかがくのまち
body:几, remainder:かいかがくのまち
body:喜, remainder:かいかがくのまち
body:器, remainder:かいかがくのまち
body:圻, remainder:かいかがくのまち
body:基, remainder:かいかがくのまち
body:奇, remainder:かいかがくのまち
body:姫, remainder:かいかがくのまち
body:季, remainder:かいかがくのまち
body:希, remainder:かいかがくのまち
body:忌, remainder:かいかがくのまち
body:揆, remainder:かいかがくのまち
body:旗, remainder:かいかがくのまち
body:既, remainder:かいかがくのまち
body:期, remainder:かいかがくのまち
body:木, remainder:かいかがくのまち
body:桅, remainder:かいかがくのまち
body:機, remainder:かいかがくのまち
body:気, remainder:かいかがくのまち
body:汽, remainder:かいかがくのまち
body:畿, remainder:かいかがくのまち
body:癸, remainder:かいかがくのまち
body:着, remainder:かいかがくのまち
body:簋, remainder:かいかがくのまち
body:紀, remainder:かいかがくのまち
body:綺, remainder:かいかがくのまち
body:葱, remainder:かいかがくのまち
body:規, remainder:かいかがくのまち
body:記, remainder:かいかがくのまち
body:貴, remainder:かいかがくのまち
body:起, remainder:かいかがくのまち
body:軌, remainder:かいかがくのまち
body:騎, remainder:かいかがくのまち
body:驥, remainder:かいかがくのまち
body:鬼, remainder:かいかがくのまち
body:黄, remainder:かいかがくのまち
body:き, remainder:かいかがくのまち
body:キ, remainder:かいかがくのまち
body:ｷ, remainder:かいかがくのまち
body:きかいかがくのまち, remainder:
body:キカイカガクノマチ, remainder:
body:ｷｶｲｶｶﾞｸﾉﾏﾁ, remainder:
```
