//
//  Photo.swift
//  GeoTestlab
//
//  Created by Rafael Peñates on 21/05/20.
//  Copyright © 2020 Rafael Peñates. All rights reserved.
//

import Foundation

struct Photo: Decodable {
    var url: String
    var formats: Formats
}
