//
//  PostImageView.swift
//  Sclone
//
//  Created by Naveen Yalla on 11/20/21.
//

import SwiftUI

struct PostImageView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var captionText:String=""
    @Binding var imageSelection:UIImage
    var body: some View {
        VStack(alignment: .center, spacing: 0, content:{
            HStack {
                Button(action:{
                    presentationMode.wrappedValue.dismiss()
                    
                }, label:{
                    Image(systemName: "xmark").font(.largeTitle).padding()
            }).accentColor(.primary)
            Spacer()
            }
            ScrollView(.vertical,showsIndicators: false,content: {
                Image(uiImage: imageSelection)
                    .resizable()
                    .scaledToFill()
                    .frame(width:200,height:200,alignment: .center)
                    .clipped()
                    .cornerRadius(12)
                TextField("Add your Cpation here..", text: $captionText).padding()
                    .frame(height:60)
                    .frame(maxWidth: . infinity)
                    .background()
                    .cornerRadius(12)
                    .font(.headline)
                    .padding(.horizontal)
                    .autocapitalization(.sentences)
                Button(action:{
                    postPicture()
                },label:{
                    Text("Post Picture")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                        .frame(height:60)
                        .frame(maxWidth:.infinity)
                        .background(.red)
                        .cornerRadius(12)
                        .padding(.horizontal)
                }).accentColor(.black)
            })
            
            
        })
    }
    func postPicture(){
        print("post the picture to the Database")
    }
}

struct PostImageView_Previews: PreviewProvider {
    @State static var image = UIImage(named:"Lewis")!
    static var previews: some View {
        PostImageView(imageSelection:$image).preferredColorScheme(.dark)
    }
}
