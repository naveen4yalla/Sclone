//
//  SignupView.swift
//  Sclone
//
//  Created by Naveen Yalla on 11/22/21.
//

import SwiftUI

struct SignupView: View {
    
    @State var showOnboarding: Bool = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 20, content: {
            
            Spacer()
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200, alignment: .center)
            Text("You're not signed in! 🙁")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .lineLimit(1)
                            .minimumScaleFactor(0.5)
                            .foregroundColor(.primary)
            Text("Click the button below to create an account and join the fun!")
                            .font(.headline)
                            .fontWeight(.medium)
                            .multilineTextAlignment(.center)
            Button(action: {
                            showOnboarding.toggle()
                        }, label: {
                            Text("Sign in / Sign up".uppercased())
                                .font(.headline)
                                .fontWeight(.bold)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .frame(height: 60)
                                .background(.red)
                                .cornerRadius(12)
                                .shadow(radius: 12)
                        })
                            .accentColor(.black)
                            
                            
                            
            
            
            Spacer()
            
            Spacer()
            
        }).padding(.all, 40)
            .edgesIgnoringSafeArea(.all)
            .fullScreenCover(isPresented: $showOnboarding, content: {
                OnboardingView()
            })
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView().preferredColorScheme(.dark)
            
    }
}

