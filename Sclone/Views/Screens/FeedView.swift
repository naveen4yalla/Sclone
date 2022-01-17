//
//  FeedView.swift
//  Sclone
//
//  Created by Naveen Yalla on 11/18/21.
//

import SwiftUI

struct FeedView: View {
    @ObservedObject var posts:PostArrayObject
    var body: some View {
        ScrollView(.vertical,showsIndicators: false,content: {
            LazyVStack{
            ForEach(posts.dataArray,id:\.self,content:{post in
                PostView(post: post, showHeaderAndFooter: true, addHeartAnimationToView: true)
            })}
            
        }).navigationBarTitle("Feed View")
            .navigationBarTitleDisplayMode(.inline)
        
}
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            FeedView(posts: PostArrayObject()).preferredColorScheme(.dark)
        }
    }
}
