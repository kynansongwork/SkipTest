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
    
    let course: Course
    
    var body: some View {
        ZStack() {
            VStack(spacing: 0) {
                Text(course.name)
                    .font(.title)
                    .padding(.vertical, 10)
                Spacer()
            }
            
            VStack(spacing: 4) {
                Text(course.courseInfo)
                
                HStack(spacing: 8) {
                    Text("Rating: \(course.rating)")
                    Text("Holes: \(course.holes)")
                }
                
                HStack(spacing: 8) {
                    Text("Size: \(course.sizeYrds) yards")
                    Text("Type: \(course.type)")
                }
                
                Text("Cost summer: \(course.cost?.costSummer)")
                
                if let winterCost = course.cost?.costWinter {
                    Text("Cost winter: \(winterCost)")
                }
            }
        }

    }
}

#Preview {
    CourseInfoView(course: Course(name: "",
                                  coordinate: .init(latitude: 11.1, longitude: -3.2),
                                  courseInfo: "",
                                  holes: 9,
                                  sizeYrds: 1000,
                                  type: .links))
}
