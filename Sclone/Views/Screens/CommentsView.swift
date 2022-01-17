//
//  CommentsView.swift
//  Sclone
//
//  Created by Naveen Yalla on 11/19/21.
//

import SwiftUI

struct CommentsView: View {
    @State var submissionText:String = ""
    @State var commentArray=[CommentModel]()
    var body: some View {
        VStack{
            ScrollView(.vertical, showsIndicators: false, content:{
                LazyVStack{
                    ForEach(commentArray,id:\.self,content: { comment in MessageView(comment:comment)
                        
                    })
                }
            })
            HStack{
                Image("Lewis").resizable().scaledToFit().frame(width:40, height: 40, alignment:.center).cornerRadius(20)
                TextField("Add comment",text:$submissionText)
                Button(action:{},label: {
                    Image(systemName:"paperplane.fill").font(.title)
                }).accentColor(.red)
            }
        }.navigationBarTitle("Comments")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: {
                getComments()
            })
    }
    
    
    //MARK:Functions
    func getComments(){
        print("comments from database")
        let comment1=CommentModel(commentID: "", userID:"", username:"Naveen", content:"good", dateCreated:Date())
        let comment2=CommentModel(commentID: "", userID:"", username:"harsha", content:"best", dateCreated:Date())
        let comment3=CommentModel(commentID: "", userID:"", username:"sachin", content:"super", dateCreated:Date())
        commentArray.append(comment1)
        commentArray.append(comment2)
        commentArray.append(comment3)
    }
}

struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            CommentsView().preferredColorScheme(.dark)
        }
    }
}
