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
    let isNewGame: Bool
    let courseHoles: Int
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .fill(.white)
                    .shadow(radius: 10)
                
                VStack(spacing: 0) {
                    ZStack {
                        VStack(spacing: 0) {
                            HStack(spacing: 20) {

                                NavigationLink("Select a course", destination: {
                                    CoursesList(courses: viewModel.courses)
                                })
                                
                                DatePicker("Date", selection: $gameDate)
                            }
                            .padding(.all, 20)
                            Spacer()
                        }
                        
                        ScrollView(.horizontal) {
                            HStack(alignment: .center, spacing: 8) {
                                
                                VStack(alignment: .center, spacing: 10) {
                                    Text("Hole")
                                        .font(.headline)
                                        .foregroundColor(.secondary)
                                    Text("Par")
                                    Text("Score")
                                }
                                
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
            
            if isNewGame {
                Button("Save Game") {
                    print("New game saved")
                }
                .padding(.bottom, 20)
            }
        }
 
    }
}

#Preview {
    GameCardView(viewModel: GameCardViewModel(),
                 isNewGame: false,
                 courseHoles: 18)
}
