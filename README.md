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
        
        let candidates1 = kaede.requestCandidates(text: "saikou")
        Swift.print(candidates1)

        let candidates2 = kaede.requestCandidates(of: "kikaikagakunomati")
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
 "さいこう", 
 "サイコウ", 
 "ｻｲｺｳ", 
 "saikou"
]

きかいかがくのまち
body:器怪, remainder:kagakunomati
body:器械, remainder:kagakunomati
body:奇怪, remainder:kagakunomati
body:棋界, remainder:kagakunomati
body:機会, remainder:kagakunomati
body:機械, remainder:kagakunomati
body:毀壊, remainder:kagakunomati
body:気塊, remainder:kagakunomati
body:気海, remainder:kagakunomati
body:貴会, remainder:kagakunomati
body:鬼怪, remainder:kagakunomati
body:きかい, remainder:kagakunomati
body:キカイ, remainder:kagakunomati
body:ｷｶｲ, remainder:kagakunomati
body:危禍, remainder:ikagakunomati
body:奇花, remainder:ikagakunomati
body:奇貨, remainder:ikagakunomati
body:帰化, remainder:ikagakunomati
body:帰嫁, remainder:ikagakunomati
body:帰家, remainder:ikagakunomati
body:帰樺, remainder:ikagakunomati
body:幾何, remainder:ikagakunomati
body:揮下, remainder:ikagakunomati
body:旗下, remainder:ikagakunomati
body:机下, remainder:ikagakunomati
body:気化, remainder:ikagakunomati
body:貴下, remainder:ikagakunomati
body:貴家, remainder:ikagakunomati
body:起貨, remainder:ikagakunomati
body:麾下, remainder:ikagakunomati
body:きか, remainder:ikagakunomati
body:キカ, remainder:ikagakunomati
body:ｷｶ, remainder:ikagakunomati
body:伎, remainder:kaikagakunomati
body:几, remainder:kaikagakunomati
body:喜, remainder:kaikagakunomati
body:器, remainder:kaikagakunomati
body:圻, remainder:kaikagakunomati
body:基, remainder:kaikagakunomati
body:奇, remainder:kaikagakunomati
body:姫, remainder:kaikagakunomati
body:季, remainder:kaikagakunomati
body:希, remainder:kaikagakunomati
body:忌, remainder:kaikagakunomati
body:揆, remainder:kaikagakunomati
body:旗, remainder:kaikagakunomati
body:既, remainder:kaikagakunomati
body:期, remainder:kaikagakunomati
body:木, remainder:kaikagakunomati
body:桅, remainder:kaikagakunomati
body:機, remainder:kaikagakunomati
body:気, remainder:kaikagakunomati
body:汽, remainder:kaikagakunomati
body:畿, remainder:kaikagakunomati
body:癸, remainder:kaikagakunomati
body:着, remainder:kaikagakunomati
body:簋, remainder:kaikagakunomati
body:紀, remainder:kaikagakunomati
body:綺, remainder:kaikagakunomati
body:葱, remainder:kaikagakunomati
body:規, remainder:kaikagakunomati
body:記, remainder:kaikagakunomati
body:貴, remainder:kaikagakunomati
body:起, remainder:kaikagakunomati
body:軌, remainder:kaikagakunomati
body:騎, remainder:kaikagakunomati
body:驥, remainder:kaikagakunomati
body:鬼, remainder:kaikagakunomati
body:黄, remainder:kaikagakunomati
body:き, remainder:kaikagakunomati
body:キ, remainder:kaikagakunomati
body:ｷ, remainder:kaikagakunomati
body:きかいかがくのまち, remainder:
body:キカイカガクノマチ, remainder:
body:ｷｶｲｶｶﾞｸﾉﾏﾁ, remainder:
body:kikaikagakunomati, remainder:
```
