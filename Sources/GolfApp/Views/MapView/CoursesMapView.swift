//
//  CoursesMapView.swift
//  golf-app
//
//  Created by Kynan Song on 03/10/2024.
//

import SwiftUI
#if !SKIP
import MapKit
#else
// skip.yml: implementation("com.google.maps.android:maps-compose:4.3.3")
import com.google.maps.android.compose.__
import com.google.android.gms.maps.model.CameraPosition
import com.google.android.gms.maps.model.LatLng
#endif

@available(iOS 17.0, *)
struct CoursesMapView<ViewModel: CoursesMapViewModelling>: View {
    
    @ObservedObject var viewModel: ViewModel
    #if !SKIP
    @State var position: MapCameraPosition = .automatic
    #endif
    
    var body: some View {
        #if !SKIP
        
        Map(position: $position, content: {
            
            ForEach(viewModel.courses) { course in
                Marker(course.name, coordinate: course.coordinate)
            }
            
        })
        .mapStyle(MapStyle.standard(elevation: MapStyle.Elevation.realistic))
        #else
        ComposeView { ctx in
            GoogleMap(cameraPositionState: rememberCameraPositionState {
                position = CameraPosition.fromLatLngZoom(LatLng(viewModel.courses[0].coordinate.latitude, viewModel.courses[0].coordinate.longitude), Float(8.0))
            }) {
                for course in viewModel.courses {
                    Marker(
                        state = MarkerState(position = LatLng(course.coordinate.latitude, course.coordinate.longitude)),
                        title = course.name
                    )
                }
            }
        }
        #endif
    }
}

#Preview {
    let previewModel = CoursesMapViewModel()
    if #available(iOS 17.0, *) {
        CoursesMapView(viewModel: previewModel)
    } else {
        // Fallback on earlier versions
    }
}
