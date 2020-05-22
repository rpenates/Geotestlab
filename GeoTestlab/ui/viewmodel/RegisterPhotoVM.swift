//
//  RegisterPhotoViewModel.swift
//  GeoTestlab
//
//  Created by Rafael Peñates on 21/05/20.
//  Copyright © 2020 Rafael Peñates. All rights reserved.
//

import Foundation
import SwiftUI

class RegisterPhotoVM:ObservableObject{
     
    func openCamera() {
        
    }
    
    func SendRegisterData(name: String, date:String, image: UIImage, lat: Double, lng: Double) {
        // get de coordenadas aqui y llama al api
        print("sendRegisterData called!")
        let api:Api=Api();
        
        api.upload(name: name, latitude: String(lat), longitude: String(lng), date: date, photo: image)

    }

}
