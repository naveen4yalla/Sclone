//
//  ContentView.swift
//  Sclone
//
//  Created by Naveen Yalla on 11/18/21.
//

import SwiftUI
import UIKit
struct ContentView: View {
    var currentUserId:String?=nil
    var body: some View {
        TabView{
            NavigationView{
                FeedView(posts: PostArrayObject())
            }
          .tabItem{
                Image(systemName:"book.fill")
                Text("Feed")
            }
            Text("Screen 2").tabItem{
                Image(systemName:"magnifyingglass")
                Text("upload")
            }
            NavigationView{
                UploadView()
            }.tabItem{
                Image(systemName:"square.and.arrow.up.fill")
                Text("upload")
            }
            
            ZStack{
                if currentUserId != nil{
                    NavigationView{
                       ProfileView(isMyProfile: true, profileDisplayName:"naveen", profileUserID:"")
                    }
                    }
                else{
                    SignupView()
                }
            }.tabItem{
                Image(systemName:"person.fill")
                Text("profile")
                }
            
            
        }.accentColor(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)
    }
}
