//
//  OnboardingViewPart2.swift
//  Sclone
//
//  Created by Naveen Yalla on 11/23/21.
//

import SwiftUI

struct OnboardingViewPart2: View {
    
   
    @Binding var onboarding:OnboardindData
    @State var showImagePicker: Bool = false
    @State var alert:Bool=false
    // For image picker
    @State var imageSelected: UIImage = UIImage(named: "logo")!
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    var body: some View {
        VStack(alignment: .center, spacing: 20, content: {
            
            Text("What's your name?")
                .font(.title)
                .fontWeight(.bold)
                
            
            TextField("Add your name here...", text:$onboarding.displayName)
                .padding()
                .frame(height: 60)
                .frame(maxWidth: .infinity)
               // .background(Color.MyTheme.beigeColor)
                .cornerRadius(12)
                .font(.headline)
                .autocapitalization(.sentences)
                .padding(.horizontal)
            Button(action: {
                            showImagePicker.toggle()
                        }, label: {
                            Text("Finish: Add profile picture")
                                .font(.headline)
                                .fontWeight(.bold)
                                .padding()
                                .frame(height: 60)
                                .frame(maxWidth: .infinity)
                                .background(.red)
                                .cornerRadius(12)
                                .padding(.horizontal)
                                .foregroundColor(.black)
                        })
                            .accentColor(.black)
                            .opacity(onboarding.displayName != "" ? 1.0 : 0.0).animation(.easeOut, value:0.2)
            
          
        
    }) .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .sheet(isPresented: $showImagePicker, onDismiss: createProfile, content: {
                ImagePicker(ImageSelected: $imageSelected, sourceType: $sourceType)
        
            }).alert(isPresented:$alert){() -> Alert in
            
                return Alert(title:Text("Error creating Profile"))}
            
    }
    // MARK: FUNCTIONS
    
    func createProfile() {
        print("CREATE PROFILE NOW")
        AuthService.instance.createNewUserInDB(userdata:self.onboarding,image:self.imageSelected) { userid in
            if let userid = userid {
                <#body#>
            }
            else{
                print("Error creating user in Database")
            }
        }
    }
    
}

struct OnboardingViewPart2_Previews: PreviewProvider {
    @State static var testString=OnboardindData(displayName:"hello", email:"hello", providerId: "hello", provider:"hello")
    static var previews: some View {
        OnboardingViewPart2(onboarding:$testString)
            
    }
}
