//
//  ProfileView.swift
//  Sclone
//
//  Created by Naveen Yalla on 11/22/21.
//

import SwiftUI

struct ProfileView: View {
    @State var showSettings:Bool=false
    var isMyProfile: Bool
    @State var profileDisplayName: String
    var profileUserID: String
    var body: some View {
        ScrollView(.vertical,showsIndicators: false,content: {
            ProfileHeaderView(profileDisplayName: $profileDisplayName)
            
        })
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing:
                                    Button(action: {
                showSettings.toggle()
                
            
            }, label:{
                Image(systemName: "line.horizontal.3")
                
            }).accentColor(.primary)
            .opacity(isMyProfile ? 1.0 : 0.0)
            ).sheet(isPresented:$showSettings,content:{
                SettingsView()
             })
    }
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ProfileView(isMyProfile: true, profileDisplayName: "Joe", profileUserID: "").preferredColorScheme(.dark)
               
            
        }
    }
}
