//
//  KeychainServiceProtocol.swift
//  Divyourday
//
//  Created by Ganesh Bhagya Sampath Wanigarathne on 2026-07-29.
//

import Foundation


protocol KeychainServiceProtocol {
 
    func save(_ data: Data, for key: String) throws
    
    func retrieve(for key: String) throws -> Data?
    
    func delete(for key: String) throws
}

