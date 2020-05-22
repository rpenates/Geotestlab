//
//  CircleImageView.swift
//  GeoTestlab
//
//  Created by Rafael Peñates on 21/05/20.
//  Copyright © 2020 Rafael Peñates. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct CircleImageView: View {
    var imageUrl: String
    var body: some View {
         KFImage(URL(string: imageUrl))
            .resizable().frame(width: 300, height: 300, alignment: .center)
                   .clipShape(Circle())
                   .overlay(
                       Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
    }
}

struct CircleImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircleImageView(imageUrl: "")
    }
}
