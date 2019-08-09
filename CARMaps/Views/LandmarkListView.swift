//
//  LandmarkListView.swift
//  CARMaps
//
//  Created by Cristina Saura Pérez on 06/08/2019.
//  Copyright © 2019 everis. All rights reserved.
//

import SwiftUI

struct LandmarkListView: View {
    
    var body: some View {
        List(landmarkData) { landmark in
            LandmarkRow(landmark: landmark)
        }
    }
}

#if DEBUG
struct LandmarkListView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkListView()
    }
}
#endif
