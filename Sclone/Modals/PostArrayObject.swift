//
//  PostArrayObject.swift
//  Sclone
//
//  Created by Naveen Yalla on 11/19/21.
//

import Foundation
class PostArrayObject: ObservableObject {
    @Published var dataArray = [PostModel]()
    init(){
        let post1 = PostModel(postID:"", userID:"", username:"Sachin", caption:"This is my Second Post", dateCreate: Date(), likeCount:4, likedByUser:false)
        let post2 = PostModel(postID:"", userID:"", username:"Naveen", dateCreate: Date(), likeCount:4, likedByUser:false)
        let post3 = PostModel(postID:"", userID: "", username: "Harsha", caption:"This is my third psot", dateCreate: Date(), likeCount: 10, likedByUser:true)
        self.dataArray.append(post1)
        self.dataArray.append(post2)
        self.dataArray.append(post3)
        
        
    }
}
