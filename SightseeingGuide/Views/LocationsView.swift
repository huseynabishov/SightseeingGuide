//
//  LocationsView.swift
//  SightseeingGuide
//
//  Created by Huseyn Abishov on 19.04.2022.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $vm.mapRegion)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                header
                    .padding()
                
                Spacer()
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

extension LocationsView {
    
    private var header: some View {
    VStack {
        Button(action: vm.toggleLocationsList) {
          Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
            .font(.title2)
            .fontWeight(.black)
            .foregroundColor(.primary)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .overlay(alignment: .leading) {
                Image(systemName: "arrow.down")
                    .font(.headline)
                    .foregroundColor(.primary)
                    .padding()
             }
        }
        if vm.showLocationsList {
            LocationsListView()
        }
    }
    .background(.thickMaterial)
    .cornerRadius(10)
    .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
    }
}
