//
//  DivyourdayApp.swift
//  Divyourday
//
//  Created by Ganesh Bhagya Sampath Wanigarathne on 2026-07-27.
//

import SwiftUI

@main
struct DivyourdayApp: App {
    
    
    private let appContainer = AppContainer()
    
    var body: some Scene {
        WindowGroup {
            AppRouter(container: appContainer, sessionmanger: appContainer.sessionManager)
        }
    }
}
