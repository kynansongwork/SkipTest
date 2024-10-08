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

struct Coordinates {
    var latitude: Double
    var longitude: Double
}

struct Course: Identifiable {
    let id = UUID()
    var name: String
    
    #if !SKIP
    var coordinate: CLLocationCoordinate2D
    #else
    var coordinate: Coordinates
    #endif
    
}

