//
//  SearchView.swift
//  Sclone
//
//  Created by Naveen Yalla on 12/29/21.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var posts:PostArrayObject
    var body: some View {
        Text("Hello world")
//        ScrollView(.vertical, showsIndicators: false) {
//          WaterfallGrid(cards) { card in
//            CardView(card: card)
//          }
//          .gridStyle(
//            columnsInPortrait: 2,
//            columnsInLandscape: 3,
//            spacing: 8,
//            animation: .easeInOut(duration: 0.5)
//          )
//          .scrollOptions(direction: .horizontal)
//          .padding(EdgeInsets(top: 16, leading: 8, bottom: 16, trailing: 8))
//        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            SearchView(posts: PostArrayObject()).preferredColorScheme(.dark)
        }
    }
}
