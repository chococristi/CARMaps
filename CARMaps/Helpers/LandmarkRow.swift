//
//  LandmarkRow.swift
//  CARMaps
//
//  Created by Cristina Saura Pérez on 06/08/2019.
//  Copyright © 2019 everis. All rights reserved.
//

import Foundation
import SwiftUI

struct LandmarkRow: View {
    
    @EnvironmentObject var userData: UserData
    var landmark: Landmark
    var landmarkIndex: Int {
        userData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .padding(5)
            Text(landmark.name)
            Spacer()
            
            Button(action: {
                self.userData.landmarks[self.landmarkIndex].isFavorite.toggle()
            }) {
                if self.userData.landmarks[self.landmarkIndex].isFavorite {
                    Image(systemName: "star.fill")
                        .foregroundColor(Color.yellow)
                } else {
                    Image(systemName: "star")
                        .foregroundColor(Color.gray)
                }
            }
//            if landmark.isFavorite {
//                Image(systemName: "star.fill")
//                    .imageScale(.medium)
//                    .foregroundColor(.yellow)
//            }
            
        }.padding(.leading, 10)
        
    }
}

#if DEBUG
//struct LandmarkRow_Previews: PreviewProvider {
//    static var previews: some View {
//        Group{
//             LandmarkRow(landmark:
//                landmarkData[0])
//            LandmarkRow(landmark:
//            landmarkData[3])
//        }.previewLayout(.fixed(width: 300, height: 70))
//       
//    }
//}
#endif
