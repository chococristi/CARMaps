//
//  LandmarkRow.swift
//  CARMaps
//
//  Created by Cristina Saura Pérez on 06/08/2019.
//  Copyright © 2019 everis. All rights reserved.
//

import SwiftUI

struct LandmarkRow: View {
    
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            Spacer()
        }
        
    }
}

#if DEBUG
struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group{
             LandmarkRow(landmark:
                landmarkData[0])
             LandmarkRow(landmark:
                landmarkData[1])
        }.previewLayout(.fixed(width: 300, height: 70))
       
    }
}
#endif
