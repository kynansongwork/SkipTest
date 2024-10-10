//
//  GamesView.swift
//  golf-app
//
//  Created by Kynan Song on 10/10/2024.
//

import SwiftUI

struct GamesView: View {
    var body: some View {
        
        //TODO: List will show game cards. Need to add an add button which will bring up the card view and allow the user to edit and save.
        NavigationStack {
            List {
                ForEach(1..<10) { i in
                    NavigationLink("Item \(i)", value: i)
                }
            }
            .navigationTitle("Game Tracker")
            .navigationDestination(for: Int.self) { i in
                GameCardView(viewModel: GameCardViewModel(), courseHoles: 9)
            }
        }
    }
}

#Preview {
    GamesView()
}
