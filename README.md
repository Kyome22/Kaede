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
        let text = kaede.convertRomanToKana("saikou")
        Swift.print(text)
        let res = kaede.requestCandidates(text)
        Swift.print(res)
    }
}
```

Result  
	
	さいこう
	["最高", "再興", "採鉱", "再校", "サイコウ", "ｻｲｺｳ", "さいこう"]