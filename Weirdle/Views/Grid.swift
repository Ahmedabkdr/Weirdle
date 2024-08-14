//
//  Grid.swift
//  Wordle
//
//  Created by Ahmed on 08/05/2022.
//

import SwiftUI

struct Grid: View {
    
    @EnvironmentObject var game: Game
    
    var countedAnswer: NSCountedSet {
        NSCountedSet(array: game.answer)
    }
    
    var body: some View {
        VStack(spacing: 5) {
            HStack(spacing: -1) {
                Image(systemName: generateLetter(0,0).letter)
                    .font(.system(size: 40))
                    .imageScale(.large)
                    .foregroundColor(generateLetter(0,0).color)
                Image(systemName: generateLetter(0,1).letter)
                    .font(.system(size: 40))
                    .imageScale(.large)
                    .foregroundColor(generateLetter(0,1).color)
                Image(systemName: generateLetter(0,2).letter)
                    .font(.system(size: 40))
                    .imageScale(.large)
                    .foregroundColor(generateLetter(0,2).color)
                Image(systemName: generateLetter(0,3).letter)
                    .font(.system(size: 40))
                    .imageScale(.large)
                    .foregroundColor(generateLetter(0,3).color)
                Image(systemName: generateLetter(0,4).letter)
                    .font(.system(size: 40))
                    .imageScale(.large)
                    .foregroundColor(generateLetter(0,4).color)
            }
            HStack(spacing: -1) {
                Image(systemName: generateLetter(1,0).letter)
                    .font(.system(size: 40))
                    .imageScale(.large)
                    .foregroundColor(generateLetter(1,0).color)
                Image(systemName: generateLetter(1,1).letter)
                    .font(.system(size: 40))
                    .imageScale(.large)
                    .foregroundColor(generateLetter(1,1).color)
                Image(systemName: generateLetter(1,2).letter)
                    .font(.system(size: 40))
                    .imageScale(.large)
                    .foregroundColor(generateLetter(1,2).color)
                Image(systemName: generateLetter(1,3).letter)
                    .font(.system(size: 40))
                    .imageScale(.large)
                    .foregroundColor(generateLetter(1,3).color)
                Image(systemName: generateLetter(1,4).letter)
                    .font(.system(size: 40))
                    .imageScale(.large)
                    .foregroundColor(generateLetter(1,4).color)
            }
            HStack(spacing: -1) {
                Image(systemName: generateLetter(2,0).letter)
                    .font(.system(size: 40))
                    .imageScale(.large)
                    .foregroundColor(generateLetter(2,0).color)
                Image(systemName: generateLetter(2,1).letter)
                    .font(.system(size: 40))
                    .imageScale(.large)
                    .foregroundColor(generateLetter(2,1).color)
                Image(systemName: generateLetter(2,2).letter)
                    .font(.system(size: 40))
                    .imageScale(.large)
                    .foregroundColor(generateLetter(2,2).color)
                Image(systemName: generateLetter(2,3).letter)
                    .font(.system(size: 40))
                    .imageScale(.large)
                    .foregroundColor(generateLetter(2,3).color)
                Image(systemName: generateLetter(2,4).letter)
                    .font(.system(size: 40))
                    .imageScale(.large)
                    .foregroundColor(generateLetter(2,4).color)
            }
            HStack(spacing: -1) {
                Image(systemName: generateLetter(3,0).letter)
                    .font(.system(size: 40))
                    .imageScale(.large)
                    .foregroundColor(generateLetter(3,0).color)
                Image(systemName: generateLetter(3,1).letter)
                    .font(.system(size: 40))
                    .imageScale(.large)
                    .foregroundColor(generateLetter(3,1).color)
                Image(systemName: generateLetter(3,2).letter)
                    .font(.system(size: 40))
                    .imageScale(.large)
                    .foregroundColor(generateLetter(3,2).color)
                Image(systemName: generateLetter(3,3).letter)
                    .font(.system(size: 40))
                    .imageScale(.large)
                    .foregroundColor(generateLetter(3,3).color)
                Image(systemName: generateLetter(3,4).letter)
                    .font(.system(size: 40))
                    .imageScale(.large)
                    .foregroundColor(generateLetter(3,4).color)
            }
            HStack(spacing: -1) {
                Image(systemName: generateLetter(4,0).letter)
                    .font(.system(size: 40))
                    .imageScale(.large)
                    .foregroundColor(generateLetter(4,0).color)
                Image(systemName: generateLetter(4,1).letter)
                    .font(.system(size: 40))
                    .imageScale(.large)
                    .foregroundColor(generateLetter(4,1).color)
                Image(systemName: generateLetter(4,2).letter)
                    .font(.system(size: 40))
                    .imageScale(.large)
                    .foregroundColor(generateLetter(4,2).color)
                Image(systemName: generateLetter(4,3).letter)
                    .font(.system(size: 40))
                    .imageScale(.large)
                    .foregroundColor(generateLetter(4,3).color)
                Image(systemName: generateLetter(4,4).letter)
                    .font(.system(size: 40))
                    .imageScale(.large)
                    .foregroundColor(generateLetter(4,4).color)
            }
            HStack(spacing: -1) {
                Image(systemName: generateLetter(5,0).letter)
                    .font(.system(size: 40))
                    .imageScale(.large)
                    .foregroundColor(generateLetter(5,0).color)
                Image(systemName: generateLetter(5,1).letter)
                    .font(.system(size: 40))
                    .imageScale(.large)
                    .foregroundColor(generateLetter(5,1).color)
                Image(systemName: generateLetter(5,2).letter)
                    .font(.system(size: 40))
                    .imageScale(.large)
                    .foregroundColor(generateLetter(5,2).color)
                Image(systemName: generateLetter(5,3).letter)
                    .font(.system(size: 40))
                    .imageScale(.large)
                    .foregroundColor(generateLetter(5,3).color)
                Image(systemName: generateLetter(5,4).letter)
                    .font(.system(size: 40))
                    .imageScale(.large)
                    .foregroundColor(generateLetter(5,4).color)
            }
        }
    }
    
    func generateLetter(_ row: Int, _ column: Int) -> (letter: String, color: Color) {
        let guess: String = game.guesses[row][column]
        
        if guess == " " {
            return ("square.fill", Color.white)
        }
        
        else if row == game.currentRow {
            return ("\(guess).square.fill", Color(.systemBrown))
        }
        
        else if guess == game.answer[column] {
            return ("\(guess).square.fill", game.correctColor)
        }
        
        else if game.answer.contains(guess) {
            var guessAppearancesInAnswer = countedAnswer.count(for: guess)
            for index in game.guesses[row].indices {
                if game.guesses[row][index] == guess && game.answer[index] == guess
                || index < column && game.guesses[row][index] == guess {
                    guessAppearancesInAnswer -= 1
                }
            }
            if guessAppearancesInAnswer > 0 {
                return ("\(guess).square.fill", Color(.systemOrange))
            }
            else {
                return ("\(guess).square.fill", Color(.systemGray))
            }
        }
        return ("\(guess).square.fill", Color(.systemGray))
    }


struct Grid_Previews: PreviewProvider {
    static var previews: some View {
        Grid()
            .environmentObject(Game())
    }
}

}
