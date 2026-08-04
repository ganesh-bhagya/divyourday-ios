//
//  Logger.swift
//  Divyourday
//
//  Created by Ganesh Bhagya Sampath Wanigarathne on 2026-07-28.
//

import Foundation


enum Logger {

    static func network(_ message: String) {
        #if DEBUG
        print(message)
        #endif
    }
}
