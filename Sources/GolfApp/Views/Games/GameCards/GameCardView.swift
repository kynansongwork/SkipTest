//
//  GameCardView.swift
//  golf-app
//
//  Created by Kynan Song on 10/10/2024.
//

import SwiftUI

struct GameCardView<ViewModel: GameCardViewModelling>: View {
    
    @ObservedObject var viewModel: ViewModel
    
    @State private var gameDate = Date.now
    
    let courseHoles: Int
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(.white)
                .shadow(radius: 10)
            
            VStack(spacing: 0) {
                ZStack {
                    VStack(spacing: 0) {
                        HStack(spacing: 0) {
                            Text("Course name")
                                .padding(.trailing, 20)
                            
                            DatePicker("Date", selection: $gameDate)
                        }
                        .padding(.all, 20)
                        Spacer()
                    }
                    
                    ScrollView(.horizontal) {
                        HStack(alignment: .center,spacing: 8) {
                            ForEach(0...courseHoles, id: \.self) { course in
                                GameCardScore(courseHole: course)
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                }
            }
        }
        .padding(.all, 20)
    }
}

#Preview {
    GameCardView(viewModel: GameCardViewModel(), courseHoles: 18)
}
