//
//  ContentView.swift
//  CARMaps
//
//  Created by Cristina Saura Pérez on 02/08/2019.
//  Copyright © 2019 everis. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var showingProfile = false
    
    var profileButton: some View {
        Button(action: { self.showingProfile.toggle() }) {
            HStack{
                Text("Click here!")
                Image(systemName: "person.crop.circle")
                    .imageScale(.large)
                    .accessibility(label: Text("User Profile"))
            }.padding(10)
        }
    }
    
    var body: some View {
//        VStack {
//            MapView()
//            profileButton
//        }
        LandmarkListView()
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
