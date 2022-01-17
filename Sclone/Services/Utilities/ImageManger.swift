//
//  ImageManger.swift
//  Sclone
//
//  Created by Naveen Yalla on 12/30/21.
//

import Foundation
import FirebaseStorage
import UIKit

class ImageManager{
    static let instance  = ImageManager()
    private var REF_STOR = Storage.storage()
    
    // MARK: Public Functions
    //Functions we call from other places
    func uploadProfileImage(userId:String,image:UIImage){
        let path = getProfileImagePath(userid: userId)
        uploadImage(path: path, image: image) { _ in}
        
    }
    //MARK: Private Functions
    
    private func getProfileImagePath(userid:String)->StorageReference{
        let userPath = "users/\(userid)/profile"
        let storagePath = REF_STOR.reference(withPath: userPath)
    }
    private func uploadImage(path: StorageReference, image: UIImage, handler: @escaping(_ success:Bool) -> ()){
        var compression: CGFloat = 1.0 // Loops down by 0.05
        let maxFileSize: Int = 240 * 240 // Maximum file size that we want to save
        let maxCompression: CGFloat = 0.05 // Maximum compression we ever allow
        
        // Get image data
        guard var originalData = image.jpegData(compressionQuality: compression) else {
            print("Error getting data from image")
            handler(false)
            return
        }
        
        
        // Check maximum file size
        while (originalData.count > maxFileSize) && (compression > maxCompression) {
            compression -= 0.05
            if let compressedData = image.jpegData(compressionQuality: compression) {
                originalData = compressedData
            }
            print(compression)
        }
        
        
        // Get image data
        guard let finalData = image.jpegData(compressionQuality: compression) else {
            print("Error getting data from image")
            handler(false)
            return
        }
        
        // Get photo metadata
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        
        // Save data to path
        path.putData(finalData, metadata: metadata) { (_, error) in
            
            if let error = error {
                //Error
                print("Error uploading image. \(error)")
                handler(false)
                return
            } else {
                //Success
                print("Success uploading image")
                handler(true)
                return
            }
            
        }
    }
    
}
