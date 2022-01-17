//
//  SettingsEditImageView.swift
//  Sclone
//
//  Created by Naveen Yalla on 11/22/21.
//

import SwiftUI

struct SettingsEditImageView: View {
    
    @State var title:String
    @State var descrption:String
    @State var selectedImage:UIImage
    //@State var placeHolder:String
    @State var showImagePicker:Bool=false
    @State var sourceType:UIImagePickerController.SourceType=UIImagePickerController.SourceType.photoLibrary
    var body: some View {
        VStack(alignment:.leading,spacing:20){
            HStack {
                Text("Edit your photo")
                Spacer()
            }
            Image(uiImage: selectedImage)
                .resizable()
                .scaledToFill()
                .frame(width:200,height:200)
                .clipped()
            Button(action:{
                showImagePicker.toggle()
            },label:{
                Text("Import".uppercased())
                    .padding()
                    .font(.title3)
                    .frame(height:60)
                    .frame(maxWidth:.infinity)
                    .background(.red)
                    .foregroundColor(.black)
                    .cornerRadius(12)
                
                
            }).sheet(isPresented:$showImagePicker, content:{
                ImagePicker(ImageSelected:$selectedImage, sourceType:$sourceType)
                
            })
            
            Button(action:{},label:{
                Text("Save".uppercased())
                    .padding()
                    .font(.title3)
                    .frame(height:60)
                    .frame(maxWidth:.infinity)
                    .background(.red)
                    .foregroundColor(.black)
                    .cornerRadius(12)
                
                
            })
                
            
            Spacer()
            
            
        }.navigationTitle(title).frame(maxWidth:.infinity).padding().padding(.bottom,100)
    }
}

struct SettingsEditImageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            SettingsEditImageView(title:"Edit your photo", descrption:"Change your photo" ,selectedImage:UIImage(named: "Lewis")!).preferredColorScheme(.dark)}
    }
}
