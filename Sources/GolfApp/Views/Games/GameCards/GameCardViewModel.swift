//
//  GameCardViewModel.swift
//  golf-app
//
//  Created by Kynan Song on 10/10/2024.
//

import Combine

protocol GameCardViewModelling: ObservableObject {
    var courses: [CourseModel] { get set }
    
    func fetchCourses()
}

class GameCardViewModel: GameCardViewModelling {
    
    @Published var courses: [CourseModel] = []
    @Published var selectedCourse: CourseModel?

    var networking: Networking
    
    init() {
        self.networking = NetworkingManager(url: nil)
        
        self.fetchCourses()
    }
    
    func fetchCourses() {
        let data = self.networking.getMockData()
        
        if let data = data {
            courses.append(contentsOf: data)
        }
    }
}
