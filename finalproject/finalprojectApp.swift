//
//  finalprojectApp.swift
//  finalproject
//
//  Created by Marc Atienza on 7/4/24.
//

import FirebaseCore
import SwiftUI

@main
struct finalProjectApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}


