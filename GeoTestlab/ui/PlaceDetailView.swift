//
//  PlaceDetailView.swift
//  GeoTestlab
//
//  Created by Rafael Peñates on 21/05/20.
//  Copyright © 2020 Rafael Peñates. All rights reserved.
//

import SwiftUI

struct PlaceDetailView: View {
    var place:Place;
    let apiUrl = "http://186.144.231.186:1337"
    var body: some View {
        
        VStack {
            MapView(latitude:place.latitude,longitude:place.longitude)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)
            
            CircleImageView(imageUrl: "\(self.apiUrl)\(place.photo.url)")
                .offset(y: -130)
                .padding(.bottom, -130)
                .frame(width: 150, height: 150)
            
            VStack(alignment: .leading) {
                Text(place.name)
                    .font(.title)
                
                HStack(alignment: .top) {
                    Text(place.date)
                        .font(.subheadline)
                    
                }
            }
            .padding()
            
            Spacer()
        }    }
}


