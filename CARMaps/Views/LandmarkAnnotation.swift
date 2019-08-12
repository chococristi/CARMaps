//
//  LandmarkAnnotation.swift
//  CARMaps
//
//  Created by Cristina Saura Pérez on 12/08/2019.
//  Copyright © 2019 everis. All rights reserved.
//

import MapKit

class LandmarkAnnotation: NSObject, MKAnnotation {
    
    enum CycleType: Int, Decodable {
        case unicycle
        case bicycle
    }
    
    var type: CycleType = .unicycle
    
    let id: Int
    let title: String?
    let coordinate: CLLocationCoordinate2D
    let action: (() -> Void)?
    
    init(landmark: Landmark, action: (() -> Void)? = nil) {
        self.id = landmark.id
        self.title = landmark.name
        self.coordinate = landmark.locationCoordinate
        self.action = action
        if landmark.type == "unicycle"{
            self.type = CycleType.unicycle
        } else {
            self.type = CycleType.bicycle
        }
    }
}



