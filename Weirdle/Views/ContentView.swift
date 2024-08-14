
//  ContentView.swift
//  Wordle
//
//  Created by Ahmed on 01/05/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var game = Game()
    
    var body: some View {
        ZStack {
            Color(red: 239 / 255, green: 238 / 255, blue: 164 / 255)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Wordle or something")
                    .foregroundColor(Color(.systemBrown))
                    .font(.system(size: 24))
                    .padding(.top,30)
                Grid()
                    .padding(.top,26)
                    .environmentObject(game)
                Spacer()
                if !game.gameOver {
                    Keyboard()
                        .padding(.bottom, 60)
                        .environmentObject(game)
                } else {
                    VStack {
                        if game.gameWon {
                            Text("You Win!")
                                .foregroundColor(game.correctColor)
                                .font(.system(size: 20))
                        } else {
                            Text("The answer was: \(game.answer.joined().uppercased())")
                                .foregroundColor(game.correctColor)
                                .font(.system(size: 20))
                                .padding(.bottom,135)
                        }
                        Button() {
                            game.restart()
                            game.gameOver = false
                            game.gameWon = false
                        } label: {
                            ZStack {
                                Text("Play Again")
                                    .foregroundColor(Color(.white))
                                    .font(.system(size: 24))
                            }
                            .frame(width: 130, height: 42)
                        }
                        .background(game.correctColor)
                        .clipShape(Capsule())
                        .padding(.bottom, 120)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Game())
    }
}
