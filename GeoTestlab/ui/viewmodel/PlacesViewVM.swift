//
//  PlacesViewModel.swift
//  GeoTestlab
//
//  Created by Rafael Peñates on 21/05/20.
//  Copyright © 2020 Rafael Peñates. All rights reserved.
//

import Foundation
class PlacesViemVM:ObservableObject{
    @Published  var placesData:[Place] = []
    func places() {
       
        let api:Api=Api();
        api.places()
            .subscribe(onNext:{(r, json) in
                print(json)
                self.placesData=json
            },onError: {
                (error) in
                print(error)
        })
    }

}
