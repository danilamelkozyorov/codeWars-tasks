import Foundation
//
//"(){}[]"   =>  True
//"([{}])"   =>  True
//"(}"       =>  False
//"[(])"     =>  False
//"[({})](]" =>  False

//func validBraces(_ string:String) -> Bool {
//    var result = false
//
//    return result
//}
//validBraces("({})")
//validBraces("({}")
//validBraces("({)")


//MARK: find the number of sheep or go away wolf
let sheepQueue1 = ["sheep", "sheep", "sheep", "sheep", "sheep", "sheep", "wolf", "sheep"]
let sheepQueue2 = ["sheep", "sheep", "wolf"]
func warnTheSheep(_ queue: [String]) -> String {
    let count = queue.count
    let wolfIndex = queue.firstIndex(of: "wolf") ?? 0
    let afterWolfIndex = queue.index(after: wolfIndex)
    if  count - afterWolfIndex > 0 {
        return "Oi! Sheep number \(count - afterWolfIndex )! You are about to be eaten by a wolf!"
    } else {
        return "Pls go away and stop eating my sheep"
    }
}
warnTheSheep(sheepQueue1)
warnTheSheep(["wolf"])
warnTheSheep(sheepQueue2)

//MARK: Find number of quarter
//solution 1
func quarter(of month: Int) -> Int {
    switch month {
    case 1...3:
       return 1
    case 4...6:
        return 2
    case 7...9:
        return 3
    case 10...12:
        return 4
    default:
        return 0
    }
}
//solution 2
func quarter1(of month: Int) -> Int {
    return (month + 2 ) / 3
}

//MARK: find the maximum obtained
func expressionMatter(_ a: Int, _ b: Int, _ c: Int) -> Int {
    let exp1 = a + b + c
    let exp2 = (a + b) * c
    let exp3 = a + b * c
    let exp4 = a * b + c
    let exp5 = a * (b + c)
    let exp6 = a * b * c
    
    return max(exp1, exp2, exp3, exp4, exp5, exp6)
}
expressionMatter(1, 2, 3)
expressionMatter(3, 4, 3)


//MARK: Jaden Case: Every Word Begins Upper Case
//реализовал преобразование предложения, чтобы каждое слово начиналось с заглавной
//но можно было сделать тоже самое через .capitalized
extension String {
    func toJadenCase() -> String {

        let refactString = self.flatMap { Array(arrayLiteral: $0) }

        var JadenText = ""
        var isBeginWord = true
        var i = -1

        for char in refactString {
            i += 1

            if isBeginWord {
                JadenText += refactString[i].uppercased()
                isBeginWord = false
            } else {
                JadenText += String(char)
            }

            if char == " " {
                isBeginWord = true
            }
        }
        return JadenText
    }
}

"how can mirrors be real if our eyes aren't real".toJadenCase()
" ".capitalized

//MARK:Create a function that returns the sum of the two lowest positive numbers given an array of minimum 4 positive integers. No floats or non-positive integers will be passed.
let someAr = [5, 8, 12, 18, 22]
func sumOfTwoSmallestIntegersIn(_ array: [Int]) -> Int {
    let changedArray = array.sorted()
    let sum = changedArray[0] + changedArray[1]
    return sum
}
sumOfTwoSmallestIntegersIn(someAr)


//MARK: Given a 2D ( nested ) list ( array, vector, .. ) of size m * n, your task is to find the sum of the minimum values in each row.
//my solution
let someArray = [[1,6,3,11,32], [21,32,45,24,34], [8,12,13,6,3]]
func sumOfMinimums(_ numbers: [[Int]]) -> Int {
    var sum = 0
    for number in numbers {
        sum += number.sorted()[0]
    }
    return sum
}
// other solution
func sumOfMinimums1(_ numbers: [[Int]]) -> Int {
    return numbers.compactMap{$0.min()}.reduce(0, +)
}
sumOfMinimums(someArray)

//MARK: Create a function add(n)/Add(n) which returns a function that always adds n to any number
func add(_ n: Int) -> ((Int) -> Int) {
//    { $0 + n } not mine solution
    func inside (_ a: Int) -> Int {
        a + n
    }
    return inside
}
var addOne = add(1)
addOne(3)

//MARK: Simple, given a string of words, return the length of the shortest word(s). String will never be empty and you do not need to account for different data types.
let somStr = "bitcoin take over the world maybe who knows perhaps"
func findShort(_ str: String) -> Int {
    ((str.split(separator: " ")).map { $0.count }).min() ?? 0
}
findShort(somStr)


