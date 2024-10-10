//
//  SwiftUIView.swift
//  golf-app
//
//  Created by Kynan Song on 10/10/2024.
//

import SwiftUI

struct GameCardScore: View {
    @State var score: String = ""
    @State var par: String = ""
    let courseHole: Int
    
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            Text("\(courseHole)")
            
            #if !SKIP
            Group {
                TextField("0", text: $par.max(2))
                    .frame(width: 40)
                    .keyboardType(.numberPad)
                TextField("0", text: $score.max(2))
                    .frame(width: 40)
                    .keyboardType(.numberPad)
            }
            .padding(.leading, 30)
            #else
            VStack(spacing: 4) {
                TextField("0", text: $par)
                    .frame(width: 30, height: 30)
                    .keyboardType(.numberPad)
                TextField("0", text: $score)
                    .frame(width: 30, height: 30)
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
