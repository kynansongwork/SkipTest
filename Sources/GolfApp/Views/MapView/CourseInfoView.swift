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
        VStack(spacing: 0) {
            Text(course.name)
            Text(course.courseInfo)
        }
        
    }
}

#Preview {
    CourseInfoView(course: Course(name: "", coordinate: .init(latitude: 11.1, longitude: -3.2), courseInfo: ""))
}
