//
//  Untitled.swift
//  golf-app
//
//  Created by Kynan Song on 10/10/2024.
//

import Foundation

struct Score {
    let hole: Int
    let par: Int
    let score: Int
}

struct Game: Identifiable {
    var id = UUID()
    let course: String
    let date: Date
    let scores: [Score]
}

