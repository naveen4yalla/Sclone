//
//  ImagePicker.swift
//  Sclone
//
//  Created by Naveen Yalla on 11/19/21.
//

import Foundation
import SwiftUI
struct ImagePicker:UIViewControllerRepresentable {
    @Environment(\.presentationMode) var presentationMode
    @Binding var ImageSelected : UIImage
    @Binding var sourceType: UIImagePickerController.SourceType
    func makeUIViewController(context:UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = sourceType
        picker.allowsEditing=true
        return picker
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    func makeCoordinator() -> ImagePickerCoordinator {
        return ImagePickerCoordinator(parent:self)
    }
    
    class ImagePickerCoordinator:NSObject,UINavigationControllerDelegate,UIImagePickerControllerDelegate {
        let parent:ImagePicker
        init(parent:ImagePicker){
            self.parent=parent
        }
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
            
            if let image = info[.editedImage] as? UIImage ?? info[.originalImage] as? UIImage{
                parent.ImageSelected=image
                parent.presentationMode.wrappedValue.dismiss()
                
            }
            
            
        }
        
    }
}
