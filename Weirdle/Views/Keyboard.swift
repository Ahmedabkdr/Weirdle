//
//  Keyboard.swift
//  Wordle
//
//  Created by Ahmed on 08/05/2022.
//

import SwiftUI

struct Keyboard: View {
    @EnvironmentObject var game: Game
    
    var darkBrown = Color(red: 78 / 255, green: 53 / 255, blue: 36 / 255)
    
    struct Letter: Hashable {
        var symbol: String
        var color: Color = Color(.systemBrown)
    }
    
    class KeyboardState : ObservableObject {

        var keys : [[Letter]] =
                                [
                                    ["q","w","e","r","t","y","u","i","o","p"].map(){Letter(symbol: $0)},
                                    ["a","s","d","f","g","h","j","k","l"].map(){Letter(symbol: $0)},
                                    ["z","x","c","v","b","n","m", "delete.left.fill"]
                                        .map(){Letter(symbol: $0)}
                                ]

        
    }
    
    @StateObject var keyboard = KeyboardState()
    
    var body: some View {
        VStack {
            HStack(spacing: -2){
                ForEach(Array(keyboard.keys[0].enumerated()), id: \.element) { index,letter in
                    Button() {
                        self.insert(letter.symbol)
                    } label: {
                        Image(systemName: "\(letter.symbol).square.fill")
                            .font(.system(size:27))
                            .imageScale(.large)
                            .foregroundColor(generateColor(0,index))
                    }
                }
            }
            HStack(spacing: -2){
                ForEach(Array(keyboard.keys[1].enumerated()), id: \.element) { index,letter in
                    Button() {
                        self.insert(letter.symbol)
                    } label: {
                        Image(systemName: "\(letter.symbol).square.fill")
                            .font(.system(size:27))
                            .imageScale(.large)
                            .foregroundColor(generateColor(1,index))
                    }
                }
            }
            HStack(spacing: -2){
                ForEach(Array(keyboard.keys[2].enumerated()), id: \.element) { index, letter in
                    if letter.symbol.count == 1 {
                        Button() {
                            self.insert(letter.symbol)
                        } label: {
                            Image(systemName: "\(letter.symbol).square.fill")
                                .font(.system(size:27))
                                .imageScale(.large)
                                .foregroundColor(generateColor(2,index))
                        }
                    }
                    else {
                        Button() {
                            self.delete()
                        } label: {
                            Image(systemName: letter.symbol)
                                .font(.system(size:27))
                                .imageScale(.large)
                                .foregroundColor(Color(.systemBrown))
                        }
                    }
                }
            }
            Button() {
                submit()
            } label: {
                ZStack {
                    Text("Submit Word")
                        .foregroundColor(Color(.white))
                        .font(.system(size: 24))
                }
                .frame(width: 180, height: 32)
            }
            .background(Color(red: 138 / 255, green: 63 / 255, blue: 50 / 255))
            .clipShape(Capsule())
        }
    }
    
    private func generateColor(_ row: Int, _ column: Int) -> Color {
        
        if game.currentRow > 0 && game.guesses[game.currentRow-1].contains(keyboard.keys[row][column].symbol) {
            if game.answer.contains(keyboard.keys[row][column].symbol) {
                for (columnIndex, guessedLetter) in game.guesses[game.currentRow-1].enumerated() {
                    if keyboard.keys[row][column].symbol == guessedLetter && guessedLetter == game.answer[columnIndex] {
                        keyboard.keys[row][column].color = game.correctColor
                        return game.correctColor
                    }
                }
                if keyboard.keys[row][column].color != game.correctColor {
                    keyboard.keys[row][column].color = Color(.systemOrange)
                    return Color(.systemOrange)
                }
            } else {
                if keyboard.keys[row][column].color != Color(.systemOrange) && keyboard.keys[row][column].color != game.correctColor {
                    keyboard.keys[row][column].color = darkBrown
                    return darkBrown
                }
            }
        }
        return keyboard.keys[row][column].color
    }
    
    private func insert(_ letter: String) {
        if game.currentColumn < 5 {
            game.guesses[game.currentRow][game.currentColumn] = letter
            game.currentColumn+=1
        }
    }
    
    private func delete() {
        if game.currentColumn > 0 {
            game.guesses[game.currentRow][game.currentColumn-1] = " "
            game.currentColumn-=1
        }
    }
    
    private func submit() {
        if game.guesses[game.currentRow] == game.answer {
            game.gameWon = true
            game.gameOver = true
        }
        
        if game.guesses[game.currentRow][4] != " "
        && answers.contains(game.guesses[game.currentRow].joined()) { //remove second condition later
            game.currentRow += 1
            game.currentColumn = 0
            
        }
        
        if game.currentRow > 5 {
            game.gameOver = true
        }
    }
}

struct Keyboard_Previews: PreviewProvider {
    static var previews: some View {
        Keyboard()
            .environmentObject(Game())
    }
}
