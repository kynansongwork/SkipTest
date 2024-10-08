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
    @State var selectedCourse: String?
    
    private var selectedPlace: CourseModel? {
        if let selectedCourse {
            return viewModel.courses.first(where: { $0.course == selectedCourse })
        }
        return nil
    }
    #endif
    
    var body: some View {
        #if !SKIP
        Map(position: $position, selection: $selectedCourse) {
            
            ForEach(viewModel.courses) { course in
                Marker(course.course, coordinate: CLLocationCoordinate2D(latitude: course.coordinates.latitude,
                                                                       longitude: course.coordinates.longitude))
                .tag(course.course)
            }
            
        }
        .mapStyle(MapStyle.standard(elevation: MapStyle.Elevation.realistic))
        .mapControls {
            MapUserLocationButton()
        }
        .sheet(item: $selectedCourse) { course in
            if let selectedPlace {
                CourseInfoView(course: selectedPlace)
                    .presentationDetents(.init([.medium]))
            }
        }
        #else
        ComposeView { ctx in
            GoogleMap(cameraPositionState: rememberCameraPositionState {
                position = CameraPosition.fromLatLngZoom(LatLng(viewModel.courses[0].coordinates.latitude, viewModel.courses[0].coordinates.longitude), Float(8.0))
            }) {
                for course in viewModel.courses {
                    Marker(
                        state = MarkerState(position = LatLng(course.coordinates.latitude, course.coordinates.longitude)),
                        title = course.course,
                        snippet = course.region
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
