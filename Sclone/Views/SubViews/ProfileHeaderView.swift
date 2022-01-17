//
//  ProfileHeaderView.swift
//  Sclone
//
//  Created by Naveen Yalla on 11/22/21.
//

import SwiftUI

struct ProfileHeaderView: View {
    @Binding var profileDisplayName: String
    var body: some View {
        VStack(alignment: .center, spacing:10, content:{
            
            Image("Lewis")
                .resizable()
                .scaledToFill()
                .frame(width:120,height:120,alignment:.center)
                .cornerRadius(60)
            Text(profileDisplayName).font(.largeTitle).fontWeight(.bold)
            Text("People bio")
                .font(.title)
                .fontWeight(.regular)
                .multilineTextAlignment(.center)
            HStack(alignment:.center,spacing: 20) {
                VStack(alignment:.center,spacing: 5,content:{
                    Text("5")
                        .font(.title)
                        .fontWeight(.bold)
                    Capsule().fill(Color.gray)
                        .frame(width:20,height:2,alignment:.center)
                    Text("Posts")
                        .font(.callout)
                        .fontWeight(.medium)
                    
                })
                VStack(alignment:.center,spacing: 5,content:{
                    Text("5")
                        .font(.title)
                        .fontWeight(.bold)
                    Capsule().fill(Color.gray)
                        .frame(width:20,height:2,alignment:.center)
                    Text("Likes")
                        .font(.callout)
                        .fontWeight(.medium)
                    
                })
            }
        }).padding()
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    @State static var name: String = "Joe"
    static var previews: some View {
        ProfileHeaderView(profileDisplayName: $name).previewLayout(.sizeThatFits)
    }
}
