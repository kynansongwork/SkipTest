//
//  Course.swift
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
    
    enum CodingKeys: String, CodingKey {
        case latitude = "lat"
        case longitude = "long"
    }
}

enum CourseType: String, Decodable {
    case parkland = "Parkland"
    case heathland = "Heathland"
    case links = "Links"
    case moorland = "Moorland"
    case mixed = "Mixed"
}

struct CourseModel: Identifiable, Decodable {
    var id = UUID()
    let course: String
    let region: String
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
    
    enum CodingKeys: String, CodingKey {
        case course = "COURSE"
        case region = "REGION"
        case postcode = "POSTCODE"
        case coordinates = "Coordinates"
        case type = "TYPE"
        case yrds = "YRDS"
        case holes = "HOLES"
        case par = "PAR"
        case courseCourseRating = "courseRating"
        case courseSlopeRating = "slopeRating"
        case golfshakeRating
        case coursePrivate = "Private"
        case courseCourseHC = "courseHC"
        case courseMyRating = "myRating"
        case courseOfficialRating = "OfficialRating"
        case costSummer
        case costWinter = "CostWinter"
        case courseHC = "Course HC"
        case myRating = "My Rating"
        case officialRating = "Official Rating"
        case courseRating = "Course Rating"
        case slopeRating = "Slope Rating"
    }
}

