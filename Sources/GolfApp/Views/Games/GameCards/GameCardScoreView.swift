//
//  SwiftUIView.swift
//  golf-app
//
//  Created by Kynan Song on 10/10/2024.
//

import SwiftUI

struct GameCardScore: View {
    @State var score: String = "0"
    @State var par: String = "0"
    let courseHole: Int
    
    var body: some View {
        VStack(alignment: .center, spacing: 4) {
            Text("\(courseHole)")
            
            #if !SKIP
            Group {
                TextField("Par", text: $par.max(2))
                    .frame(width: 40)
                    .keyboardType(.numberPad)
                TextField("Score", text: $score.max(2))
                    .frame(width: 40)
                    .keyboardType(.numberPad)
            }
            .padding(.leading, 30)
            #endif


        }
    }
}

#Preview {
    GameCardScore(courseHole: 1)
}
