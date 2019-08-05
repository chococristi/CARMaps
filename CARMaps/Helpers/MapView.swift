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
    var markers: Markers?

    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled(){
            if CLLocationManager.authorizationStatus() != .denied {
                view.showsUserLocation = true
                
                self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
                self.locationManager.startUpdatingLocation()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
                    guard let coordinate = self.locationManager.location?.coordinate else { return }
                    let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 5000, longitudinalMeters: 5000)
                    view.setRegion(region, animated: true)
                })
            }
        }
        
        setupMap()
    }

    mutating func setupMap() {
        guard let path = Bundle.main.path(forResource: "landmarkData", ofType: "json") else { return }
        let url = URL(fileURLWithPath: path)
        do {
            let data = try Data(contentsOf: url)
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            
            guard let array = json as? [String: Any] else { return }
            Markers.init(json: array)
            //setAnnotationsInMap()
        } catch {
            print(error)
        }
    }
    
}

struct MapView_Preview: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
