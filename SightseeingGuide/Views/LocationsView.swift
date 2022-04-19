//
//  LocationsView.swift
//  SightseeingGuide
//
//  Created by Huseyn Abishov on 19.04.2022.
//

import SwiftUI



struct LocationsView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        List {
            ForEach(vm.locations) {
                Text($0.name)
            }
        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
            .environmentObject(LocationsViewModel())
    }
}