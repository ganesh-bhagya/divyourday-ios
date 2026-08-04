//
//  SessionManager.swift
//  Divyourday
//
//  Created by Ganesh Bhagya Sampath Wanigarathne on 2026-07-29.
//

import Foundation

@Observable
final class SessionManager: SessionManagerProtocol {
    private (set) var currentSession: Session?
    
    
    var isLoggedin: Bool {
        currentSession != nil
    }
    func save(_ session: Session) {
        currentSession = session
    }
    
    func clear() {
        currentSession = nil
    }

}
