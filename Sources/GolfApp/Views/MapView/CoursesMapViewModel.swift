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
        #if !SKIP
        let testMarker = Course(name: "Gleneagles",
                                coordinate: CLLocationCoordinate2D(latitude: 56.2831, longitude: -3.7521),
                                courseInfo: "This is a golf course near Auchterader")
        let testMarker2 = Course(name: "Braid Hills",
                                 coordinate: CLLocationCoordinate2D(latitude: 55.907167, longitude: -3.1915),
                                 courseInfo: "This is a course in Edinburgh")
        #else
        let testMarker = Course(name: "Gleneagles",
                                coordinate: Coordinates(latitude: 56.2831, longitude: -3.7521),
                                courseInfo: "This is a golf course near Auchterader")
        let testMarker2 = Course(name: "Braid Hills", coordinate: Coordinates(latitude: 55.907167, longitude: -3.1915),
                                 courseInfo: "This is a course in Edinburgh")
        #endif
        
        courses.append(testMarker)
        courses.append(testMarker2)
    }
}
