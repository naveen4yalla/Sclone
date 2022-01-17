//
//  SettingsEditTextView.swift
//  Sclone
//
//  Created by Naveen Yalla on 11/22/21.
//

import SwiftUI

struct SettingsEditTextView: View {
    @State var submissionString:String=""
    @State var title:String
    @State var descrption:String
    @State var placeHolder:String
    var body: some View {
        VStack{
            HStack {
                Text("We will let you choose new name")
                Spacer()
            }
            TextField(submissionString,text: $submissionString)
                .padding()
                .frame(height:80)
                .frame(maxWidth:.infinity)
                .autocapitalization(.sentences)
                .font(.headline)
                .background(.quaternary)
                .cornerRadius(12)
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
            Spacer()
            
            
        }.navigationTitle("Edit your Name").frame(maxWidth:.infinity).padding()
    }
}

struct SettingsEditTextView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView{
            SettingsEditTextView(title:"Edit", descrption:"make changes", placeHolder:"Placeholder").preferredColorScheme(.dark)
            
        }
    }
}
