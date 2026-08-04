//
//  APIResponse.swift
//  Divyourday
//
//  Created by Ganesh Bhagya Sampath Wanigarathne on 2026-07-28.
//

import Foundation

struct APIResponse<T: Codable>: Codable {
    let success: Bool
    let statusCode: Int
    let data: T
}
