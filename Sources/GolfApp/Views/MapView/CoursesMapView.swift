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
        Map(position: $position)
            .mapStyle(MapStyle.standard(elevation: MapStyle.Elevation.realistic))
        #else
        ComposeView { ctx in
            GoogleMap(cameraPositionState: rememberCameraPositionState {
                position = CameraPosition.fromLatLngZoom(LatLng(3.1950, 55.9230), Float(12.0))
            })
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
