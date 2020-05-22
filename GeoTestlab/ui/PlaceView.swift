//
//  PlaceView.swift
//  GeoTestlab
//
//  Created by Rafael Peñates on 21/05/20.
//  Copyright © 2020 Rafael Peñates. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct PlaceView: View {
    var place:String;
    var imageUrl: String
    var body: some View {
          HStack {
            KFImage(URL(string: imageUrl))
                     .resizable()
                     .frame(width: 50, height: 50)
            Text(self.place)
                 Spacer()
             }
    }
}

struct PlaceView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceView(place:"Hola", imageUrl: "")
    }
}

