import Foundation

public extension Int {
    
    var roman: String? {
        get
        {
            if (self <= 0) { return nil }
            let myInt = self
            let myStr = makeRomans(myInt: myInt, count: 0, str: "")
            return myStr
        }
    }
    
    var arrInt : Array<Int> {
        [1, 4, 5, 9, 10, 40, 50, 90, 100, 400, 500, 900, 1000]
    }
    
    var arrStr : Array<String> {
        ["I", "IV", "V", "IX", "X", "XL", "L", "XC", "C", "CD", "D", "CM", "M"]
    }
    
    var dict: Dictionary<Int, String> {
        Dictionary(uniqueKeysWithValues: zip(arrInt, arrStr))
    }
    
    func makeRomans(myInt: Int, count: Int, str: String) -> String {
        var base = 0
        var i = 0
        var myStr = str
        if (myInt != 0)
        {
            if (myInt >= 1000) { base = 1000 }
            else
            {
                while (myInt >= arrInt[i]) { i += 1 }
                base = arrInt[i - 1];
            }
            let mainPart = myInt / base
            let remPart = myInt % base
            var j = mainPart
            while (j > 0)
            {
                myStr += dict[base]!
                j -= 1
            }
            return makeRomans(myInt: remPart, count: mainPart, str: myStr)
        }
        return myStr
    }
}
