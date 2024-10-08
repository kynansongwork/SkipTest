//
//  CoursesMapViewModel.swift
//  golf-app
//
//  Created by Kynan Song on 03/10/2024.
//

import Combine
#if !SKIP
import CoreLocation
#endif

enum MapViewState: Equatable {
    case loaded
    case loading
    case error
}

protocol CoursesMapViewModelling: ObservableObject {
    var state: MapViewState { get }
    var courses: [Course] { get set }
    
    func fetchCourses()
}

class CoursesMapViewModel: CoursesMapViewModelling {
    var state: MapViewState = .loading
    var courses: [Course] = []
    
    init() {
        self.fetchCourses()
    }
    
    func fetchCourses() {
        let testMarker = Course(name: "Gleneagles: King's Course",
                                coordinate: Coordinates(latitude: 56.2831, longitude: -3.7521),
                                courseInfo: "This is a golf course near Auchterader",
                                holes: 18,
                                sizeYrds: 6790,
                                rating: 73.0,
                                cost: Cost(costSummer: 325,
                                           costWinter: 95),
                                type: .heathland)
        let testMarker2 = Course(name: "Braid Hills",
                                 coordinate: Coordinates(latitude: 55.9160843, longitude: -3.2045417),
                                 courseInfo: "This is a course in Edinburgh",
                                 holes: 18,
                                 sizeYrds: 5865,
                                 rating: 67.2,
                                 cost: Cost(costSummer: 150,
                                            costWinter: 55),
                                 type: .heathland)
        
        courses.append(testMarker)
        courses.append(testMarker2)
    }
}
