//
//  MessageView.swift
//  Sclone
//
//  Created by Naveen Yalla on 11/19/21.
//

import SwiftUI

struct MessageView: View {
    @State var comment: CommentModel
    var body: some View {
        HStack{
            //Mark:Profile Image
            Image("Lewis")
                .resizable()
                .scaledToFill()
                .frame(width:40,height:40,alignment: .center).cornerRadius(20)
            VStack(alignment: .leading, spacing: 4, content:{
            //Mark:USER NAME
                Text(comment.username)
                    .font(.caption)
                    .foregroundColor(.gray)
            //Mark:Content
                Text(comment.content)
                    .padding(.all,10)
                    .foregroundColor(.primary)
                    .background(Color.gray)
                    .cornerRadius(10)
            })
            Spacer()
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var comment:CommentModel = CommentModel(commentID:"", userID:"", username:"Naveen", content:"looking cool", dateCreated: Date())
    static var previews: some View {
        MessageView(comment:comment).previewLayout(.sizeThatFits)
    }
}
