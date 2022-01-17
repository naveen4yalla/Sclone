//
//  BrowserView.swift
//  Sclone
//
//  Created by Naveen Yalla on 11/19/21.
//

import SwiftUI

struct BrowserView: View {
    var body: some View {
        ScrollView(.vertical,showsIndicators: false,content:{
            Text("hello world")
        }).navigationBarTitle("Browse")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct BrowserView_Previews: PreviewProvider {
    static var previews: some View {
        BrowserView()
    }
}
