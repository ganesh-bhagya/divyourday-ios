//
//  APIClient.swift
//  Divyourday
//
//  Created by Ganesh Bhagya Sampath Wanigarathne on 2026-07-28.
//

import Foundation


final class APIClient {
    
    private let session: URLSession

       init(session: URLSession = .shared) {
           self.session = session
       }
    
    
    
    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()

        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [
            .withInternetDateTime,
            .withFractionalSeconds
        ]

        decoder.dateDecodingStrategy = .custom { decoder in
            let container = try decoder.singleValueContainer()
            let dateString = try container.decode(String.self)

            guard let date = formatter.date(from: dateString) else {
                throw DecodingError.dataCorruptedError(
                    in: container,
                    debugDescription: "Invalid date format: \(dateString)"
                )
            }

            return date
        }

        return decoder
    }()
    
    func post<Request: Codable, Response: Codable>(
        endpoint: String,
        request: Request
    ) async throws -> Response {
        
        guard let url = URL(string: Endpoints.baseUrl + endpoint) else {
            throw APIError.invalidURL
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let requestStart = Date()

     
        urlRequest.httpBody = try JSONEncoder().encode(request)
        
        Logger.network("""
        🚀 REQUEST
        ----------------------------------------
        URL: \(url.absoluteString)
        Method: \(urlRequest.httpMethod ?? "")
        Headers: \(urlRequest.allHTTPHeaderFields ?? [:])
        """)

        if let body = urlRequest.httpBody,
           let json = String(data: body, encoding: .utf8) {
            Logger.network("Body:\n\(json)")
        }
        
        
        let (data, response) = try await session.data(for: urlRequest)
        
        let duration = Date().timeIntervalSince(requestStart) * 1000
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.invalidResponse
        }
        
        Logger.network("""
        ✅ RESPONSE
        ----------------------------------------
        Status: \(httpResponse.statusCode)
        Duration: \(String(format: "%.0f", duration)) ms
        """)

        if let json = String(data: data, encoding: .utf8) {
            Logger.network("Body:\n\(json)")
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw APIError.serverError("Server returned \(httpResponse.statusCode)")
        }
        
        do {
            let response = try decoder.decode(APIResponse<Response>.self, from: data)
            return response.data
        } catch let error as DecodingError {
            Logger.network("""
            ❌ DECODING ERROR
            ----------------------------------------
            \(error)
            """)
            throw error
        }
        catch {
            Logger.network("""
            ❌ ERROR
            ----------------------------------------
            \(error)
            """)
            throw error
        }
    }

}


