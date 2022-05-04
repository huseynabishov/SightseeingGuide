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
    
    // Current region on map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(
        //latitude: lat, longitude: lon),
        latitude: 41.9, longitude: 12.5),
        latitudinalMeters: 250, longitudinalMeters: 250)
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    // Show list of locations
    @Published var showLocationsList: Bool = false
    
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
    
    func toggleLocationsList() {
        withAnimation(.easeInOut) {
            showLocationsList = !showLocationsList
        }
    }
    
    func showNextLocation(location: Location){
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationsList = false
        }
    }
    
}
