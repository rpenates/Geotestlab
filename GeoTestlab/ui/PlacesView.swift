//
//  PlacesView.swift
//  GeoTestlab
//
//  Created by Rafael Peñates on 21/05/20.
//  Copyright © 2020 Rafael Peñates. All rights reserved.
//

import SwiftUI

struct PlacesView: View {
    @ObservedObject private var placeVM:PlacesViemVM = PlacesViemVM()
    init() {
        self.placeVM.places()
    }
    
    let apiUrl = "http://186.144.231.186:1337"

    var body: some View {
   
            NavigationView {
                List(self.placeVM.placesData) { place in
                    NavigationLink(destination:PlaceDetailView(place:place)) {
                        PlaceView(place: place.name, imageUrl: "\(self.apiUrl)\(place.photo.url)")
              }
                }.navigationBarTitle(Text("Lugares"))
        }

        
    }
}


struct PlacesView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
