//
//  LandmarkAnnotationView.swift
//  CARMaps
//
//  Created by Cristina Saura Pérez on 12/08/2019.
//  Copyright © 2019 everis. All rights reserved.
//

import MapKit

class UnicycleAnnotationView: MKMarkerAnnotationView {

    static let ReuseID = "unicycleAnnotation"

    /// - Tag: ClusterIdentifier
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        clusteringIdentifier = "unicycle"
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForDisplay() {
        super.prepareForDisplay()
        displayPriority = .defaultHigh
        markerTintColor = .blue
        glyphImage = #imageLiteral(resourceName: "unicycle")
    }
}


class BicycleAnnotationView: MKMarkerAnnotationView {

    static let ReuseID = "bicycleAnnotation"

    /// - Tag: ClusterIdentifier
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        clusteringIdentifier = "multiWheelCycle"
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForDisplay() {
        super.prepareForDisplay()
        displayPriority = .defaultHigh
        markerTintColor = .red
        glyphImage = #imageLiteral(resourceName: "bicycle")
    }
}
