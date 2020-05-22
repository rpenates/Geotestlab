//
//  ContentView.swift
//  GeoTestlab
//
//  Created by Rafael Peñates on 20/05/20.
//  Copyright © 2020 Rafael Peñates. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject private var contentViewVM:ContentViewVM = ContentViewVM()
    
    var body: some View {
  TabView {
     RegisterPhotoView()
       .tabItem {
          Image(systemName: "camera.fill")
          Text("Registro")
     }
     PlacesView()
       .tabItem {
          Image(systemName: "location.fill")
          Text("Mis Lugares")
    }
  }
       
       
 
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
