//
//  AppRouter.swift
//  Divyourday
//
//  Created by Ganesh Bhagya Sampath Wanigarathne on 2026-07-29.
//

import Foundation
import SwiftUI


struct AppRouter: View {
    
    let container: AppContainer
    @Bindable var sessionmanger: SessionManager
    
    
    var body: some View {
        if sessionmanger.isLoggedin {
            container.makeHomeView()
        } else {
            container.makeLoginView()
        }
    }
}
