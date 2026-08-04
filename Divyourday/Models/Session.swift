//
//  Session.swift
//  Divyourday
//
//  Created by Ganesh Bhagya Sampath Wanigarathne on 2026-07-28.
//

import Foundation


struct Session: Codable {
    let accessToken: String
    let user: User?
}
