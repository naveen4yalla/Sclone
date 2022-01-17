//
//  ScloneApp.swift
//  Sclone
//
//  Created by Naveen Yalla on 11/18/21.
//

import SwiftUI
import FirebaseCore

@main
struct ScloneApp: App {
    init(){
        FirebaseApp.configure()
        //GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { [unowned self] user, error in
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
