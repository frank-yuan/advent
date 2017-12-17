//: Playground - noun: a place where people can play

import Cocoa

let myPath = FileManager.default.currentDirectoryPath

func arrayFromContentsOfFileWithPath(path: String) -> [[Int]]? {
    guard let content = try? String(contentsOfFile:path, encoding: .utf8) else {
        return nil
    }
    let lines = content.components(separatedBy: .newlines)
    
    var result = [[Int]]()
    for line in lines {
        
        let scanner = Scanner(string: line)
        var array = [Int]()
        var value = 0
        while scanner.scanInt(&value) {
            array.append(value)
        }
        result.append(array)
    }
    return result
}


func dayOne(str : String)  -> Int
{
    var sum = 0
    var lastChar = str.characters.last!
    for  char in str.characters {
        char
        if (char == lastChar) {
            if let intValue = Int(String(char))
            {
                sum += intValue
            }
        }
        lastChar = char
        
    }
    return sum
}

var str = "1122"


dayOne(str: str)


func dayTwo(strArray : [[Int]]?) -> Int {
    
    var checkSum = 0
    if let arrays = strArray {
        for array in arrays {
            var min = array.first!
            var max = array.last!
            if min > max {
                min = max
                max = array.first!
            }
            for element in array {
                if element < min {
                    min = element
                } else if element > max {
                    max = element
                }
            }
            checkSum += max - min
        }
    }
    return checkSum
}

dayTwo(strArray: arrayFromContentsOfFileWithPath(path: "/Users/fyuan/cvent.git/mobile/advent/day2input.txt"))


func dayThree(target : Int) -> Int{
    var distance = 0
    var radius = 1
    var currentMax = 1
    while (currentMax < target) {
        radius += 1
        currentMax = currentMax + 8 * (radius - 1)
    }
    
    let girth = 8 * (radius - 1)
    let offset = target - (currentMax - girth) - 1
    let start = currentMax - girth + 1
    let width = girth / 4
    let seg = offset / width
    distance = width / 2 + abs(target - (seg * width + (width / 2 - 1) + start))
    return distance
}

dayThree(target: 368078	)


