//
//  OnboardingView.swift
//  Sclone
//
//  Created by Naveen Yalla on 11/22/21.
//

import SwiftUI
import FirebaseAuth
struct OnboardingView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var showOnboardingPart2: Bool = false
    @State var alert:Bool=false
    @State var onboarding=OnboardindData(displayName:"", email:"", providerId:"", provider:"")
    var body: some View {
        VStack(spacing: 10) {
            
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100, alignment: .center)
                .shadow(radius: 12)
            
            Text("Welcome to Sclone")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Sclone is the #1 app for posting pictures of your dog and sharing them across the world. We are a dog-loving community and we're happy to have you!")
                .font(.headline)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .padding()
            
            Button(action: {
                SignInWithApple.instance.startSignInWithAppleFlow(view:self)
                //showOnboardingPart2.toggle()
            }, label: {
                HStack {
                    
                    Image(systemName: "globe")
                        
                    Text("Sign in with Apple")
                    
                }
                .frame(height: 60)
                .frame(maxWidth: .infinity)
                .background(.red)
                .cornerRadius(6)
                .font(.system(size: 23, weight: .medium, design: .default))
                
            })
            .accentColor(Color.black)
            
            Button(action: {
                showOnboardingPart2.toggle()
            }, label: {
                HStack {
                    
                    Image(systemName: "globe")
                        
                    Text("Sign in with Google")
                    
                }
                .frame(height: 60)
                .frame(maxWidth: .infinity)
                .background(.red)
                .cornerRadius(6)
                .font(.system(size: 23, weight: .medium, design: .default))
                
            })
            .accentColor(Color.black)
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Continue as guest".uppercased())
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    //.background(.red)
                    .cornerRadius(6)
                    .font(.system(size: 23, weight: .medium, design: .default))
                    
                    
            })
            .accentColor(.black)
            
        }
        .padding(.all, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
        .fullScreenCover(isPresented: $showOnboardingPart2, content: {
            OnboardingViewPart2(onboarding: $onboarding)
        }).alert(isPresented:$alert,content:{
            return Alert(title:Text("Error signing in"))
        })

    }
    func connectToFirebase(name:String,email:String,provide:String,credential: AuthCredential){
        AuthService.instance.logInUserToFirebase(credential: credential){(returnedProviderID,isError)in
            if let providerID = returnedProviderID,!isError{
                self.onboarding.email=email
                self.onboarding.displayName=name
                self.onboarding.provider=provide
                self.onboarding.providerId=providerID
                self.showOnboardingPart2.toggle()
            }
            else{
                print("Error getting info")
                self.alert.toggle()
            }
            
        }
        
        
        
    }
}

struct OnboardingView_Previews: PreviewProvider {
    @State static var testString:String="Text"
    static var previews: some View {
        OnboardingView().preferredColorScheme(.dark)
    }
}
