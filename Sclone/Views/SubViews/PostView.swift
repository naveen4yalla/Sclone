//
//  PostView.swift
//  Sclone
//
//  Created by Naveen Yalla on 11/18/21.
//

import SwiftUI

struct PostView: View {
    @State var post:PostModel
    var showHeaderAndFooter: Bool
    @State var postImage: UIImage = UIImage(named: "Lewis")!
    
    @State var animateLike: Bool = false
    @State var addHeartAnimationToView: Bool
    
    @State var showActionSheet: Bool = false
    //@State var actionSheetType: PostActionSheetOption =.general
    var body: some View {
        if showHeaderAndFooter {
            HStack {
                
                NavigationLink(
                    destination: ProfileView(isMyProfile: false, profileDisplayName: post.username, profileUserID: post.userID),
                    label: {
                        Image("Lewis")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 30, height: 30, alignment: .center)
                            .cornerRadius(15)
                        
                        Text(post.username)
                            .font(.callout)
                            .fontWeight(.medium)
                            .foregroundColor(.primary)
                    })
                Spacer()
                
                Button(action: {
                    showActionSheet.toggle()
                }, label: {
                    Image(systemName: "ellipsis")
                        .font(.headline)
                })
                    .accentColor(.primary)
                // .actionSheet(isPresented: $showActionSheet, content: {
                //getActionSheet()
            }.padding(.all, 6)
            
        }
        // MARK: IMAGE
        
        ZStack {
            Image(uiImage: postImage)
                .resizable()
                .scaledToFit()

            if addHeartAnimationToView {
                LikeAnimationView(animate: $animateLike)
            }
        }
        
        // MARK: FOOTER
        if showHeaderAndFooter {
            HStack(alignment: .center, spacing: 20, content: {
                
                Button(action: {
                    if post.likedByUser {
                        //unlike
                        unlikePost()
                    } else {
                        //like
                        likePost()
                    }
                }, label: {
                    Image(systemName: post.likedByUser ? "heart.fill" : "heart")
                        .font(.title3)
                })
                .accentColor(post.likedByUser ? .red : .primary)

                // MARK: COMMENT ICON
                NavigationLink(
                    destination: CommentsView(),
                    label: {
                        Image(systemName: "bubble.middle.bottom")
                            .font(.title3)
                            .foregroundColor(.primary)
                    })

                Button(action: {
                    //sharePost()
                }, label: {
                    Image(systemName: "paperplane")
                        .font(.title3)
                })
                .accentColor(.primary)

                Spacer()
            })
            .padding(.all, 6)
            
            if let caption = post.caption {
                HStack {
                    Text(caption)
                    
                    Spacer(minLength: 0)
                }
                .padding(.all, 6)
            }
        }
        
    

        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }
    func likePost() {
        
        // Update the local data
       
        let updatedPost=PostModel(postID:post.postID, userID:post.userID, username:post.username,caption: post.caption, dateCreate: post.dateCreate, likeCount: post.likeCount+1, likedByUser:true)
        self.post = updatedPost
        
        
        animateLike = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            animateLike = false
        }
        
    }
    
    func unlikePost() {
        
        // Update the local data
        let updatedPost = PostModel(postID: post.postID, userID: post.userID, username: post.username, caption: post.caption, dateCreate: post.dateCreate, likeCount: post.likeCount - 1, likedByUser: false)
        self.post = updatedPost

        
    }
}


struct PostView_Previews: PreviewProvider {
    static var post:PostModel = PostModel(postID:"", userID:"", username:"naveen", caption:"My first post", dateCreate: Date(), likeCount:0, likedByUser: false)
    static var previews: some View {
        PostView(post: post, showHeaderAndFooter: true, addHeartAnimationToView: true)
            .previewLayout(.sizeThatFits)
    }
}
