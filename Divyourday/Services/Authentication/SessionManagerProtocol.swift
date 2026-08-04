//
//  SessionManagerProtocol.swift
//  Divyourday
//
//  Created by Ganesh Bhagya Sampath Wanigarathne on 2026-07-28.
//

import Foundation


protocol SessionManagerProtocol {
    var currentSession: Session? { get }

    func save(_ session: Session)

    func clear()
}
