//
//  Landmark.swift
//  CARMaps
//
//  Created by Cristina Saura Pérez on 05/08/2019.
//  Copyright © 2019 everis. All rights reserved.
//

import SwiftUI
import CoreLocation


struct Landmark: Hashable, Codable, Identifiable {
    
    var id: Int
    var name: String
    var imageName: String
    var coordinates: Coordinates
    var isFavorite: Bool

    
    var locationCoordinate: CLLocationCoordinate2D
    {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}

extension Landmark {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}
