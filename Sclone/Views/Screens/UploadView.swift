//
//  UploadView.swift
//  Sclone
//
//  Created by Naveen Yalla on 11/19/21.
//

import SwiftUI
import UIKit

struct UploadView: View {
    @State var imagePicker:Bool = false
    @State var imageSelected:UIImage = UIImage(named:"Lewis")!
    @State var sourceType:UIImagePickerController.SourceType = .camera
    @State var showPostImageView:Bool = false
    var body: some View {
        ZStack{
            VStack{
                Button(action:{
                    sourceType = UIImagePickerController.SourceType.camera
                    imagePicker.toggle()
                    
                },label:{
                    Text("Capture").font(.largeTitle).fontWeight(.bold).frame(width:200,height:90).foregroundColor(.black).background(.red).cornerRadius(20)
                }).frame(maxWidth:.infinity,maxHeight: .infinity,alignment: .center)
                Divider().background(.red)
                
                Button(action:{
                    sourceType = UIImagePickerController.SourceType.photoLibrary
                    imagePicker.toggle()
                    
                },label:{
                    Text("Upload Photo").font(.largeTitle).fontWeight(.bold).frame(width:200,height:90).foregroundColor(.black).background(.red).cornerRadius(20)
                }).frame(maxWidth:.infinity,maxHeight: .infinity,alignment: .center)
            }.sheet(isPresented:$imagePicker ,onDismiss:{sendToPostImage()} , content:{
                ImagePicker(ImageSelected: $imageSelected, sourceType:$sourceType)
            })
            Text("").fullScreenCover(isPresented: $showPostImageView, content:{
                PostImageView(imageSelection: $imageSelected)
            })
        }.edgesIgnoringSafeArea(.top)
    }
    func sendToPostImage(){
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5){
        showPostImageView.toggle()}
    }
}

struct UploadView_Previews: PreviewProvider {
    static var previews: some View {
        UploadView().preferredColorScheme(.dark)
    }
}
