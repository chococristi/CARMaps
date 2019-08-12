//
//  LandmarkListView.swift
//  CARMaps
//
//  Created by Cristina Saura Pérez on 06/08/2019.
//  Copyright © 2019 everis. All rights reserved.
//

import SwiftUI

struct LandmarkListView: View {
   @EnvironmentObject var userData: UserData
    
    var body: some View {
        List(userData.landmarks) { landmark in
            //if !self.userData.showFavoritesOnly || landmark.isFavorite {
                LandmarkRow(landmark: landmark)
            //}
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
