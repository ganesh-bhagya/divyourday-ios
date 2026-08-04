//
//  APIError.swift
//  Divyourday
//
//  Created by Ganesh Bhagya Sampath Wanigarathne on 2026-07-28.
//

import Foundation


enum APIError: Error {

    case invalidURL
    case invalidResponse
    case decodingError
    case serverError(String)
    case unknown

}
