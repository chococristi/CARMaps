//
//  Data.swift
//  CARMaps
//
//  Created by Cristina Saura Pérez on 05/08/2019.
//  Copyright © 2019 everis. All rights reserved.
//

import Foundation

struct Marker {
    let name: String
    let coordinates: [Double]
}

struct Markers {
    var markers: [Marker]
}

extension Markers {
    init?(json: [String: Any]) {
        
        guard let markersJSON = json["markers"] as? [[String: Any]] else { return nil }
    
        var markersObtanied: [Marker] = []
        
        for markerJSON in markersJSON {
            
            if let name = markerJSON["name"] as? String,
                let coordinates = markerJSON["coordinates"] as? [Double] {
                let newMarker = Marker.init(name: name, coordinates: coordinates)
                markersObtanied.append(newMarker)
            }
        }
        
        self.markers = markersObtanied
    }
}

//------------------------------------------------------------------------------

//import UIKit
//import SwiftUI
//import CoreLocation

//let landmarkData: [Landmark] = load("landmarkData.json")
//
//func load<T: Decodable>(_ filename: String, as type: T.Type = T.self) -> T {
//    let data: Data
//
//    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
//        else {
//            fatalError("Couldn't find \(filename) in main bundle.")
//    }
//
//    do {
//        data = try Data(contentsOf: file)
//    } catch {
//        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
//    }
//
//    do {
//        let decoder = JSONDecoder()
//        print("+++++++++++++++++++++++++++++++ start ")
//        print(try decoder.decode(T.self, from: data))
//        print("+++++++++++++++++++++++++++++++ fi")
//        return try decoder.decode(T.self, from: data)
//    } catch {
//        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
//    }
//}
