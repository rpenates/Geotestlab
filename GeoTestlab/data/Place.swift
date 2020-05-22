//
//  Place.swift
//  GeoTestlab
//
//  Created by Rafael Peñates on 21/05/20.
//  Copyright © 2020 Rafael Peñates. All rights reserved.
//

import Foundation
import CoreLocation

struct Place: Identifiable,Decodable {
    var id: String
    var name: String
    var latitude:Double
    var longitude:Double
    var date:String
    var photo:Photo
}
