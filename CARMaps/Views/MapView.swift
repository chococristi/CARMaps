//
//  MapView.swift
//  CARMaps
//
//  Created by Cristina Saura Pérez on 02/08/2019.
//  Copyright © 2019 everis. All rights reserved.
//  https://www.morningswiftui.com/blog/build-mapview-app-with-swiftui
//  https://github.com/hulab/ClusterKit/issues/7
//  https://stackoverflow.com/questions/56563660/
//  accessing-mkmapview-elements-as-uiviewrepresentable-in-the-main-contentview-sw

import SwiftUI
import MapKit

extension MKMapView {
    func visibleAnnotations() -> [MKAnnotation] {
        return self.annotations(in: self.visibleMapRect).map { obj -> MKAnnotation in return obj as! MKAnnotation }
    }
}

struct MapView: UIViewRepresentable {
    
    let regionInMeters: Double = 10000
    let locationManager = CLLocationManager()
    var landmarks: [Landmark] = []
    //@Binding var selectedLandmark: Landmark? //TODO CRIS
    
    func makeUIView(context: Context) -> MKMapView {
        let view = MKMapView(frame: .zero)
        view.delegate = context.coordinator
        return view
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
                    self.centerViewOnUserLocation(mapView: view)
                })
            }
        }
        updateAnnotations(from: view)
    }
    
    func updateAnnotations(from mapView: MKMapView) {
        mapView.removeAnnotations(mapView.annotations)
        let newAnnotations = landmarks.map { LandmarkAnnotation(landmark: $0) }
        mapView.addAnnotations(newAnnotations)
    }
    
    func centerViewOnUserLocation(mapView: MKMapView) {
        
        #if targetEnvironment(simulator)
        // TODO harcoded to work with Simulator (if not harcoded, we are in California)
        let location = CLLocationCoordinate2DMake(41.397272, 2.159148)
        let region = MKCoordinateRegion(center: location,
                                        latitudinalMeters: regionInMeters,
                                        longitudinalMeters: regionInMeters)
        mapView.setRegion(region, animated: true)
        
        #else
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion(center : location,
                                            latitudinalMeters: regionInMeters,
                                            longitudinalMeters: regionInMeters)
            mapView.setRegion(region, animated: true)
        }
        #endif
    }
    
    //TODO CRIS
    //    private func updateAnnotations(from mapView: MKMapView) {
    //        mapView.removeAnnotations(mapView.annotations)
    //        let newAnnotations = landmarks.map { LandmarkAnnotation(landmark: $0) }
    //        mapView.addAnnotations(newAnnotations)
    //        if let selectedAnnotation = newAnnotations.filter({ $0.id == selectedLandmark?.id }).first {
    //            mapView.selectAnnotation(selectedAnnotation, animated: true)
    //        }
    //    }
    
    
    class Coordinator: NSObject, MKMapViewDelegate {
        
        //this function allows to SHOW THE NUMBER OF CLUSTER annotations
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier, for: annotation)
            annotationView.clusteringIdentifier = "identifier"
            print(mapView.visibleAnnotations())
            return annotationView
        }
        
        func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
            print("selected annotation: \(view.annotation?.title)")
            LandmarkListView()
            //TODO present a view
        }
    }
    
    func makeCoordinator() -> MapView.Coordinator {
         return Coordinator()
    }
    
// this function shows ALL the annotations, without clustering, cause clustering is done by default in iOS
// func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
// var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "reuseIdentifier")
// as? MKMarkerAnnotationView
// if annotationView == nil {
// annotationView = MKMarkerAnnotationView(annotation: nil, reuseIdentifier: "reuseIdentifier")
// }
// annotationView?.annotation = annotation
// annotationView?.displayPriority = .required
// return annotationView
// }

//@Binding var pins: [LandmarkAnnotation]
//@Binding var outSelectedPin: LandmarkAnnotation?
}


class LandmarkAnnotation: NSObject, MKAnnotation {
    
    let id: Int
    let title: String?
    let coordinate: CLLocationCoordinate2D
    let action: (() -> Void)?
    
    init(landmark: Landmark, action: (() -> Void)? = nil) {
        self.id = landmark.id
        self.title = landmark.name
        self.coordinate = landmark.locationCoordinate
        self.action = action
    }
}

//struct MapView_Preview: PreviewProvider {
//    static var previews: some View {
//        MapView()
//    }
//}
