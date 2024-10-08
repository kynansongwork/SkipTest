//
//  Courses.swift
//  golf-app
//
//  Created by Kynan Song on 04/10/2024.
//

import Foundation
#if !SKIP
import MapKit
#else
// skip.yml: implementation("com.google.maps.android:maps-compose:4.3.3")
import com.google.maps.android.compose.__
import com.google.android.gms.maps.model.CameraPosition
import com.google.android.gms.maps.model.LatLng
#endif

struct Coordinates: Decodable {
    var latitude: Double
    var longitude: Double
}

enum CourseType: String, Decodable {
    case parkland = "Parkland"
    case heathland = "Heathland"
    case links = "Links"
    case moorland = "Moorland"
    case mixed = "Mixed"
}

struct Cost: Decodable {
    var costSummer: Double
    var costWinter: Double?
    var residentRate: Double?
}

struct Course: Identifiable, Decodable {
    let id = UUID()
    var name: String
    
    var coordinates: Coordinates
    
    var courseInfo: String
    var holes: Int
    var sizeYrds: Double
    var rating: Double?
    var cost: Cost?
    var type: CourseType
}

struct CourseModel: Identifiable, Decodable {
    let id = UUID()
    let course, region: String
    let postcode: String?
    let coordinates: Coordinates
    let type: CourseType
    let yrds: Int
    let holes, par: Int?
    let courseCourseRating: Double?
    let courseSlopeRating: Int?
    let golfshakeRating: Double?
    let coursePrivate: Bool?
    let courseCourseHC: Double?
    let courseMyRating, courseOfficialRating, costSummer, costWinter: Int?
    let courseHC: Double?
    let myRating, officialRating: Int?
    let courseRating: Double?
    let slopeRating: Int?
}

