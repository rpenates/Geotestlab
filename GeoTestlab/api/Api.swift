//
//  Api.swift
//  GeoTestlab
//
//  Created by Rafael Peñates on 21/05/20.
//  Copyright © 2020 Rafael Peñates. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift
import RxAlamofire
import SwiftUI
import UIKit
import SwiftyJSON

public class Api {
    
    func places()->Observable<(HTTPURLResponse, [Place])> {
        //var headers :HTTPHeaders = HTTPHeaders();
        //headers.add(name: LibLoginConstantesAPI.HEADER_CONEXION, value: conexion)
        return RxAlamofire.requestDecodable(.get,"http://186.144.231.186:1337/places")
        
    }
    func upload(name:String,latitude:String,longitude:String,date:String,photo: UIImage) {
        
        
        // -------- Prepare payload data -------------------
        let imgData = photo.jpegData(compressionQuality: 0.2)!
        let jsonPayload = JSON([
            "name": name,
            "latitude": latitude,
            "longitude": longitude,
            "date": date
        ])
    
        print ("Data Json: \n \(String(describing: jsonPayload.rawString()))")
        
        AF.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(Data(jsonPayload.rawString()!.utf8), withName: "data")
            multipartFormData.append(imgData, withName: "files.photo", fileName: "photo.jpg", mimeType: "image/jpg")
            
        }, to: "http://186.144.231.186:1337/places")
            .responseDecodable(of: Place.self) { response in
                debugPrint(response)
        }
    }
}
