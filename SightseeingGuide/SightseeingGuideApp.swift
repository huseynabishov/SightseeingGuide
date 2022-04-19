//
//  SightseeingGuideApp.swift
//  SightseeingGuide
//
//  Created by Huseyn Abishov on 18.04.2022.
//

import SwiftUI

@main
struct SightseeingGuideApp: App {
    
    @StateObject private var vm = LocationsViewModel()

    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
