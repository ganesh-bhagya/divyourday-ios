//
//  KeychainService.swift
//  Divyourday
//
//  Created by Ganesh Bhagya Sampath Wanigarathne on 2026-07-29.
//

import Foundation


final class KeychainService: KeychainServiceProtocol {
    
    private var storage: [String: Data] = [:]
    
    func save(_ data: Data, for key: String) throws {
        storage[key] = data
    }
    
    func retrieve(for key: String) throws -> Data? {
        storage[key]
    }
    func delete(for key: String) throws {
        storage.removeValue(forKey: key)
    }
}
