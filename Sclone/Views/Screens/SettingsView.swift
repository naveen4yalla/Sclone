//
//  SettingsView.swift
//  Sclone
//
//  Created by Naveen Yalla on 11/22/21.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false, content: {
                //MARK SECTION 1:Sclone
                GroupBox(label:SettingsLabel_View(labelText:"Sclone", labelImage:"dot.radiowaves.left.and.right"), content: {
                    HStack(alignment: .center, spacing:10, content: {
                        Image("Lewis")
                            .resizable()
                            .scaledToFit()
                            .frame(width:80,height:80,alignment:.center)
                            .cornerRadius(12)
                        Text("Sclone lets u post pictures and talk and chat with your loved ones")
                    })
                }).padding()
                
        
                //MARK SECTION 2:Profile
               
                GroupBox(label:SettingsLabel_View(labelText:"Profile", labelImage:"person.fill"),content:{
                    
                    NavigationLink(destination:SettingsEditTextView(submissionString:"currentname",title:"Edit name", descrption:"grab a new name", placeHolder:"Please enter a new name")){
                        SettingsRowView(leftIconn:"pencil" , text:"Display Name" , color: .red)}
                    
                    NavigationLink(destination:SettingsEditTextView(submissionString:"currentBio",title:"Edit Bio", descrption:"Describe yourself", placeHolder:"Please enter a new bio")){
                        SettingsRowView(leftIconn:"text.quote" , text:"Bio" , color: .red)}
                    
                    
                    NavigationLink(destination:SettingsEditImageView(title:"Edit photo", descrption:"change your photo", selectedImage:UIImage(named:"Lewis")!)){
                        SettingsRowView(leftIconn:"photo" , text:"photo" , color: .red)}
                   
                    
                    
                    SettingsRowView(leftIconn:"figure.walk" , text:"Sign out" , color: .red)
                    
                    
                }).padding()
                //MARK SECTION 3:Application
                GroupBox(label:SettingsLabel_View(labelText:"Application", labelImage:"apps.iphone"),content:{
                    SettingsRowView(leftIconn:"folder.fill" , text:"Privacy Policy" , color: .red)
                    SettingsRowView(leftIconn:"folder.fill" , text:"Terms and Conditions" , color: .red)
                    SettingsRowView(leftIconn:"globe" , text:"Sclone" , color: .red)
                    
                    
                }).padding()
                
                //MARK SECTION 4: SIGN OFF
                GroupBox{
                    Text("Sclone was made with love .\n All Rights Reserved \n UO Apps inc").foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                        
                    
                    
                    
                }.padding().padding(.bottom,100)
                
                
                
                
            }).navigationTitle("Settings")
                .navigationBarTitleDisplayMode(.large)
                .navigationBarItems(leading:
                                        Button(action: {}, label: {
                    Image(systemName: "xmark").font(.title)
                }).accentColor(.primary)
                )
            
        }
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        
        SettingsView().preferredColorScheme(.dark)
    }
}
