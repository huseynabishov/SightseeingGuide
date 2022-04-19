//
//  LocationsViewModel.swift
//  SightseeingGuide
//
//  Created by Huseyn Abishov on 19.04.2022.
//

import Foundation

class LocationsViewModel: ObservedObject {
    
    @Published var locations: [Location]
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
    }
    
}
