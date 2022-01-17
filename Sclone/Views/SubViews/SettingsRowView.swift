//
//  SettingsRowView.swift
//  Sclone
//
//  Created by Naveen Yalla on 11/22/21.
//

import SwiftUI

struct SettingsRowView: View {
    var leftIconn:String
    var text: String
    var color:Color
    var body: some View {
        HStack{
            ZStack{
                RoundedRectangle(cornerRadius: 0,style: .continuous).fill(color).cornerRadius(6)
                Image(systemName: leftIconn)
                    .font(.title3)
                    .foregroundColor(.white)
                
            }.frame(width:36,height:36,alignment:.center)
            Text(text).foregroundColor(.primary)
            Spacer()
            Image(systemName: "chevron.right")
                .font(.headline).foregroundColor(.primary)
            
        }
        .padding(.vertical,4)
    }
}

struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRowView(leftIconn:"heart", text:"Row title", color: .blue).previewLayout(.sizeThatFits)
    }
}
