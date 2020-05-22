//
//  RegisterPhotoView.swift
//  GeoTestlab
//
//  Created by Rafael Peñates on 21/05/20.
//  Copyright © 2020 Rafael Peñates. All rights reserved.
//

import SwiftUI



struct CaptureImageView {
    
    /// MARK: - Properties
    @Binding var isShown: Bool
    @Binding var image: Image?
    @Binding var uiimage: UIImage?
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(isShown: $isShown, image: $image, uiimage: $uiimage)
    }
}

extension CaptureImageView: UIViewControllerRepresentable {
    func makeUIViewController(context: UIViewControllerRepresentableContext<CaptureImageView>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        /// Default is images gallery. Un-comment the next line of code if you would like to test camera
        picker.sourceType = .camera
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController,
                                context: UIViewControllerRepresentableContext<CaptureImageView>) {
        
    }
}


struct RegisterPhotoView: View {
    @State var date:Date=Date();
    @State var name:String="";
    
    @State var image: Image? = nil
    @State var showCaptureImageView: Bool = false
    @State var imageData: UIImage? = nil
    
    @ObservedObject private var registerPhotoVM:RegisterPhotoVM = RegisterPhotoVM()
    @ObservedObject var locationManager = LocationManager()
    
    
    var body: some View {
        VStack(){
                if (!showCaptureImageView) {
            TextField("Nombre",text: self.$name)
            DatePicker("Fecha",selection:self.$date)
            Button(action: {
                // self.registerPhotoVM.openCamera()
                print("Take photo called")
                self.showCaptureImageView.toggle()
                if (self.imageData != nil ) {
                    print ("image is not nil")
                    let dateFormatter = DateFormatter()
                    let dateString = dateFormatter.string(from: self.date)
                    dateFormatter.dateFormat = "HH:mm E, d MMM y"
                    
                    let latitude = self.locationManager.userLatitude
                    let longitude = self.locationManager.userLongitude
                    self.registerPhotoVM.SendRegisterData(name: self.name, date: dateString, image: self.imageData!, lat: latitude, lng: longitude)
                } else {
                    print("uiimage is nil")
                }
            }) {
                Text("Tomar Foto")
            }.padding(30)
            
                }else{
                CaptureImageView(isShown: $showCaptureImageView, image: $image, uiimage: $imageData)
            }
            
        }.padding()
    }
}

struct RegisterPhotoView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterPhotoView()
    }
}





