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
    @State var showingAR = false
    @State var landmarks: [Landmark] = load("landmarkData.json")
    
    let buttonSize: CGFloat = 28
    //@State var selectedLandmark: Landmark? = nil TODO

    var profileButton: some View {
        Button(action: { self.showingProfile.toggle() }) {
                Image(systemName: "list.bullet")
                    .frame(width: buttonSize, height: buttonSize )
                    .imageScale(.large)
                    .accessibility(label: Text("Landmarks list"))
                    .padding(10)
                    .border(Color.blue, width: 1, cornerRadius: 5)
                    .background(Color.white)
        }.padding(10)
    }
    
    var realityButton: some View {
        Button(action: { self.showingAR.toggle() }) {
                Image(systemName: "camera")
                    .frame(width: buttonSize, height: buttonSize )
                    .imageScale(.large)
                    .accessibility(label: Text("Camera reality"))
                    .padding(10)
                    .border(Color.blue, width: 1, cornerRadius: 5)
                    .background(Color.white)
        }.padding(10)
    }
    
    var body: some View {
        ZStack {
            MapView(landmarks: landmarks)
                    //selectedLandmark: $selectedLandmark) //TODO
                .layoutPriority(1)
                .edgesIgnoringSafeArea(.vertical)
            
            profileButton
                .padding(EdgeInsets.init(top: -(UIScreen.main.bounds.height/2)+50, leading: 0, bottom: 0, trailing: -(UIScreen.main.bounds.width)/2))
                .offset(x: +120)
                .sheet(isPresented: $showingProfile, content: {
                    LandmarkListView()
                })
        
            realityButton
            .padding(EdgeInsets.init(top: -(UIScreen.main.bounds.height/2)+120, leading: 0, bottom: 0, trailing: -(UIScreen.main.bounds.width)/2))
            .offset(x: +120)
            .sheet(isPresented: $showingAR, content: {
                ARView()
            })
            
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
//        Group {
//        ContentView()
//            ContentView()
//            .environment(\.colorScheme, .dark)
//            .environment(\.sizeCategory, .extraExtraExtraLarge)
//        }
    }
}
#endif
