//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Ben on 26/09/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var moves = ["🖐", "✌️", "👊"]
    @State private var winningMoves = ["👊", "🖐", "✌️"]
    
    @State private var didYouWin = ""
    @State private var winOrLose = false
    @State private var gameOver = false
    @State private var score = 0
    @State private var round = 0
    
    @State private var randomComputeChoice = Int.random(in: 0...2)
    
    var body: some View {
        NavigationView {
            ZStack {
                // Could put a color theme here
            
                VStack {
                    
                    Spacer()
                    
                    VStack {
                        Text("⬇️BEAT THIS⬇️")
                            .font(.largeTitle.weight(.bold))
                        Text(moves[randomComputeChoice])
                            .font(.system(size: 200))
                    }
                    
                    Spacer()
                    
                    VStack {
                        Text("CHOOSE A MOVE")
                            .font(.largeTitle.weight(.bold))
                    }
                    HStack {
                        // Player choice goes here
                        ForEach(0..<3) { number in
                            Button {
                                checkToWin(number)
                            } label: {
                                Text(moves[number])
                                    .font(.system(size: 100))
                            }
                        }
                    }
                    
                    Spacer()
                    
                    VStack {
                        HStack {
                            Text("SCORE: \(score)")
                                .font(.subheadline.weight(.bold))
                            Text("ROUND: \(round)/10")
                                .font(.subheadline.weight(.bold))
                        }
                    }
                }
            }
            
            .alert(didYouWin, isPresented: $winOrLose) {
                Button("Continue", action: askQuestion)
            } message: {
                Text("Your score is \(score)")
            }
            
            
            .alert("Game over", isPresented: $gameOver) {
                Button("Reset", action: resetGame)
            } message: {
                Text("You scored \(score) out of 10")
            }
        }
    }
    
    func askQuestion() {
        if round == 10 {
            gameOver = true
            return
        }
    }
    
    func checkToWin(_ number: Int) {
        if moves[randomComputeChoice] == winningMoves[number] {
            didYouWin = "YOU WON"
            score += 1
        } else {
            didYouWin = "YOU LOST"
        }
        
    winOrLose = true
    round += 1
    randomComputeChoice = Int.random(in: 0...2)
    }
    
    func resetGame() {
        score = 0
        round = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


