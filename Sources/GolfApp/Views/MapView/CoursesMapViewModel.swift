//
//  CoursesMapViewModel.swift
//  golf-app
//
//  Created by Kynan Song on 03/10/2024.
//

import Combine

enum MapViewState: Equatable {
    case loaded
    case loading
    case error
}

protocol CoursesMapViewModelling: ObservableObject {
    var state: MapViewState { get }
}

class CoursesMapViewModel: CoursesMapViewModelling {
    var state: MapViewState = .loading
    
    init() {
    }
}
