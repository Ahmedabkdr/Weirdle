//
//  data.swift
//  Wordle
//
//  Created by Ahmed on 12/05/2022.
//

import Foundation

let alphabet = "abcdefghijklmnopqrstuvwxyz"

var answers1: [String] {
    do {
        if let path = Bundle.main.path(forResource: "answers", ofType: "txt") {
            let text = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
            return text.components(separatedBy: "\n")
        }
    } catch let err as NSError {
        print(err)
    }
    return []
}


var answers2: [String] {
    do {
        if let path = Bundle.main.path(forResource: "answers2", ofType: "txt") {
            let text = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
            return text.components(separatedBy: "\n")
        }
    } catch let err as NSError {
        print(err)
    }
    return []
}


var answers4: [String] {
    
    var answers3 = answers2
    for index in answers3.indices {
        answers3[index].removeLast()
    }

    answers3 = answers3.filter() { $0.count==5 && $0.allSatisfy() { alphabet.contains($0) } }
    
    return answers3
}

var newAnswers : [String] {
    do {
        if let path = Bundle.main.path(forResource: "answers5", ofType: "csv") {
            let text = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
            return text.components(separatedBy: "\r\n")
        }
    } catch let err as NSError {
        print(err)
    }
    return []
}

var answers5 = newAnswers.filter() { $0.count==5 && $0.allSatisfy() { alphabet.contains($0) } }

var answers: [String]{
    Array((Set(answers1).union(Set(answers4))).union(Set(answers5)))
}
