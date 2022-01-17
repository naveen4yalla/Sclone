//
//  CommentModel.swift
//  Sclone
//
//  Created by Naveen Yalla on 11/19/21.
//

import Foundation
import SwiftUI

struct CommentModel:Identifiable,Hashable{
    var id=UUID()
    var commentID: String
    var userID: String
    var username: String
    var content: String
    var dateCreated: Date
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
