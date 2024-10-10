//
//  GamesView.swift
//  golf-app
//
//  Created by Kynan Song on 10/10/2024.
//

import SwiftUI

struct GamesView: View {
    
    @State private var addGamePressed = false
    
    @State var games: [Game] = []
    
    var body: some View {
        
        //TODO: List will show game cards. Need to add an add button which will bring up the card view and allow the user to edit and save.
        NavigationStack {
            VStack {
                ScrollView(.vertical) {
                    ForEach(1..<10) { i in
                        NavigationLink(destination: {
                            GameCardView(viewModel: GameCardViewModel(),
                                         isNewGame: false,
                                         courseHoles: 9)
                            .padding(.all, 20)
                        }) {
                            GamesViewCell(courseName: "Course \(i)")
                                .padding(.all, 10)
                        }
                    }
                }
                
                #if !SKIP
                Spacer()
                #endif
        
                addGameButton()
                    .padding(.bottom, 8)
            }
            .frame(maxWidth: .infinity)
            .navigationTitle("Game Tracker")
        }
        #if !SKIP
        .navigationDestination(isPresented: $addGamePressed) {
            GameCardView(viewModel: GameCardViewModel(),
                                                     isNewGame: true,
                                                     courseHoles: 9)
        }
        #else
        .sheet(isPresented: $addGamePressed) {
            GameCardView(viewModel: GameCardViewModel(),
                                                     isNewGame: true,
                                                     courseHoles: 9)
        }
        #endif
    }
}

extension GamesView {
    
    private func addGameCard() {
        print("Add pressed")
        addGamePressed = true
    }
    
    private func addGameButton() -> some View {
        Button(action: addGameCard) {
            HStack(spacing: 4) {
                Image(systemName: "plus")
                Text("Add game")
            }
            .frame(minWidth: 100, maxWidth: .infinity, minHeight: 44, maxHeight: 44, alignment: .center)
        }
        .font(.headline)
        .foregroundColor(.white)
        .frame(height: 50)
        .frame(maxWidth: .infinity)
        .background(Color.blue)
        .cornerRadius(15)
        .shadow(radius: 10)
        .padding(.horizontal, 20)
        .padding(.bottom, 10)
    }
}

#Preview {
    GamesView()
}
