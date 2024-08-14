//
//  Game.swift
//  Wordle
//
//  Created by Ahmed on 01/05/2022.
//

import SwiftUI

class Game: ObservableObject {
    
    let correctColor = Color(red: 56 / 255, green: 167 / 255, blue: 46 / 255)
    
    
    @Published var gameOver = false
    @Published var gameWon = false
    
    @Published var answer : [String] = answers.randomElement()!.map{ String($0) }
    
    @Published var guesses = [
                                [" ", " ", " ", " ", " "],
                                [" ", " ", " ", " ", " "],
                                [" ", " ", " ", " ", " "],
                                [" ", " ", " ", " ", " "],
                                [" ", " ", " ", " ", " "],
                                [" ", " ", " ", " ", " "]
                             ]
    
    @Published var currentRow = 0
    @Published var currentColumn = 0
    
    func restart() {
        answer = answers.randomElement()!.map{ String($0) }
        guesses = [
                    [" ", " ", " ", " ", " "],
                    [" ", " ", " ", " ", " "],
                    [" ", " ", " ", " ", " "],
                    [" ", " ", " ", " ", " "],
                    [" ", " ", " ", " ", " "],
                    [" ", " ", " ", " ", " "]
                  ]
        currentRow = 0
        currentColumn = 0
    }
    
}
