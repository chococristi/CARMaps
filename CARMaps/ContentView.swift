//
//  ContentView.swift
//  CARMaps
//
//  Created by Cristina Saura Pérez on 02/08/2019.
//  Copyright © 2019 everis. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
         MapView()

    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
