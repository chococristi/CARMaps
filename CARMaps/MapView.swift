//
//  MapView.swift
//  CARMaps
//
//  Created by Cristina Saura Pérez on 02/08/2019.
//  Copyright © 2019 everis. All rights reserved.
//

import SwiftUI

import MapKit

struct MapView: UIViewRepresentable {
    
    let regionInMeters: Double = 10000
    let locationManager = CLLocationManager()
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }

    func updateUIView(_ view: MKMapView, context: Context) {
        
        if CLLocationManager.locationServicesEnabled(){
            print("CLLocationManager.locationServicesEnabled()")
            if CLLocationManager.authorizationStatus() != .denied {
                view.showsUserLocation = true
                print("authorizationStatus() != .denied")
            }
        }
        
        guard let location = locationManager.location?.coordinate else { return }
        print("+++++ location: \(location)")
            
        let coordinate = CLLocationCoordinate2D(
            latitude: 41.387102, longitude: -122.412679)
        //latitude: 37.792637, longitude: 2.170239)
        let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 5000, longitudinalMeters: 5000)
        view.setRegion(region, animated: true)
        //centerViewOnUserLocation()
    }
    
//    func centerViewOnUserLocation() {
//        if let location = locationManager.location?.coordinate {
//            let region = MKCoordinateRegion(center: location, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
//            mapView.setRegion(region, animated: true)
//        }
//    }
}

struct MapView_Preview: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
