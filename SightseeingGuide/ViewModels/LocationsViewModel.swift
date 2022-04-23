//
//  LocationsViewModel.swift
//  SightseeingGuide
//
//  Created by Huseyn Abishov on 19.04.2022.
//

import Foundation
import MapKit
import SwiftUI

class LocationsViewModel: ObservableObject {

    // All loaded locations
    @Published var locations: [Location]
    
    // Current location on map
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
    }
    
    private func updateMapRegion(location: Location) {
        withAnimation(.easeInOut) {
        mapRegion = MKCoordinateRegion(
            center: location.coordinates,
            span: mapSpan)
        }
    }
}
