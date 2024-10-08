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
    var courses: [CourseModel] { get set }
    
    func fetchCourses()
}

class CoursesMapViewModel: CoursesMapViewModelling {
    var state: MapViewState = .loading
    var courses: [CourseModel] = []
    
    init() {
        self.fetchCourses()
    }
    
    func fetchCourses() {
        let testMarker = CourseModel(course: "Gleneagles: King's Course",
                                        region: "Perthshire",
                                        postcode: nil,
                                        coordinates: Coordinates(latitude: 56.2831, longitude: -3.7521),
                                        type: .heathland,
                                        yrds: 6790,
                                        holes: 18,
                                        par: nil,
                                        courseCourseRating: 73,
                                        courseSlopeRating: nil,
                                        golfshakeRating: nil,
                                        coursePrivate: nil,
                                        courseCourseHC: nil,
                                        courseMyRating: nil,
                                        courseOfficialRating: nil,
                                        costSummer: 325,
                                        costWinter: 95,
                                        courseHC: nil,
                                        myRating: nil,
                                        officialRating: nil,
                                        courseRating: nil,
                                        slopeRating: nil)
        
        let testMarker2 = CourseModel(course: "Braid Hills",
                                      region: "Edinburgh",
                                      postcode: nil,
                                      coordinates: Coordinates(latitude: 55.9160843, longitude: -3.2045417),
                                      type: .heathland,
                                      yrds: 5865,
                                      holes: 18,
                                      par: nil,
                                      courseCourseRating: 67.2,
                                      courseSlopeRating: nil,
                                      golfshakeRating: nil,
                                      coursePrivate: nil,
                                      courseCourseHC: nil,
                                      courseMyRating: nil,
                                      courseOfficialRating: nil,
                                      costSummer: 150,
                                      costWinter: 55,
                                      courseHC: nil,
                                      myRating: nil,
                                      officialRating: nil,
                                      courseRating: nil,
                                      slopeRating: nil)
        
        courses.append(testMarker)
        courses.append(testMarker2)
    }
}
