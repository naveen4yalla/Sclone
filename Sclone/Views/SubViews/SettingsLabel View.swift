//
//  SettingsLabel View.swift
//  Sclone
//
//  Created by Naveen Yalla on 11/22/21.
//

import SwiftUI

struct SettingsLabel_View: View {
    var labelText: String
    var labelImage: String
    var body: some View {
        VStack {
            HStack{
                Text(labelText)
                    .fontWeight(.bold)
                Spacer()
                Image(systemName:labelImage)
            }
            Divider().padding(.vertical,4)
        }
    }
}

struct SettingsLabel_View_Previews: PreviewProvider {
    static var previews: some View {
        SettingsLabel_View(labelText:"hello", labelImage:"heart").previewLayout(.sizeThatFits)
    }
}
