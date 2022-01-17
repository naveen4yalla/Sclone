//
//  AuthService.swift
//  Sclone
//
//  Created by Naveen Yalla on 12/30/21.
//
import Foundation
import FirebaseAuth
import FirebaseFirestore
import Foundation
import SwiftProtobuf
import UIKit
let DB_BASE = Firestore.firestore()
class AuthService{
    private var Ref_Users=DB_BASE.collection("users")
    static let instance=AuthService()
    func logInUserToFirebase(credential: AuthCredential, handler: @escaping (_ providerID: String?, _ isError: Bool) -> ()) {
        Auth.auth().signIn(with: credential) { (result, error) in
            if  error != nil{
                print("Trouble logging into FIrebase")
                handler(nil,true)
                return
                }
            guard let providerID = result?.user.uid else {
                print("Error getting provider ID")
                handler(nil, true)
                return
            }
            handler(providerID,false)
            
        
    }
        
    

}
    func createNewUserInDB(userdata:OnboardindData, image:UIImage, handler:@escaping(_ userid:String?)->()){
        //setup a user document with the user collection
        let document = Ref_Users.document()
        let userID = document.documentID
        //upload profile image to Storage
        ImageManager.instance.uploadProfileImage(userId: userID, image: image)
        let userData: [String: Any]=[
            DatabaseUserField.displayName:userdata.displayName,
            DatabaseUserField.email:userdata.email,
            DatabaseUserField.provider_id:userdata.providerId,
            DatabaseUserField.provider:userdata.provider,
            DatabaseUserField.bio:"",
            DatabaseUserField.data_Creaated:FieldValue.serverTimestamp(),
        ]
        document.setData(userData){(error) in
            if let error=error{
                print("Error uploading data to the userdocument \(error)")
            }
            else{
                handler(userID)
            }
        }
        
    }
}
