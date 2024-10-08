//
//  SwiftUIView.swift
//  golf-app
//
//  Created by Kynan Song on 08/10/2024.
//

import SwiftUI
#if !SKIP
import CoreLocation
#endif

struct CourseInfoView: View {
    
    let course: CourseModel
    
    var body: some View {
        ZStack() {
            VStack(spacing: 0) {
                Text(course.course)
                    .font(.title)
                    .padding(.vertical, 10)
                Spacer()
            }
            
            VStack(spacing: 4) {
                Text(course.region)
                
                HStack(spacing: 8) {
                    Text("Rating: \(course.courseRating ?? 0)")
                    Text("Holes: \(course.holes ?? 0)")
                }
                
                HStack(spacing: 8) {
                    Text("Size: \(course.yrds) yards")
                    Text("Type: \(course.type)")
                }
                
                
                if let summerCost = course.costSummer {
                    Text("Cost summer: \(summerCost)")
                } else {
                    Text("Closed")
                }
                
                if let winterCost = course.costWinter {
                    Text("Cost winter: \(winterCost)")
                }
            }
        }

    }
}

#Preview {
    CourseInfoView(course: CourseModel(course: "Braid Hills",
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
                                       slopeRating: nil))
}
