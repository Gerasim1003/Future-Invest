//
//  QueryService.swift
//  Music Player
//
//  Created by Gerasim Israyelyan on 7/23/19.
//  Copyright © 2019 Gerasim Israyelyan. All rights reserved.
//

import UIKit

class QueryService {
    enum Method {
        case register
        case login
    }
    let registerUrl = "http://10.42.0.1:5000/register"
    let loginUrl = "http://10.42.0.1:5000/login"
    
    func postRequest(email: String, password: String, method: Method, completion: @escaping (HTTPURLResponse) -> ()) {
        let configuration = URLSessionConfiguration.default
        let session: URLSession = URLSession(configuration: configuration)
        
        let query: [String: String] = [
            "email": email,
            "password": password
        ]
        
        let baseUrl: URL!
        
        switch method {
        case .login:
            baseUrl = URL(string: loginUrl)
        case .register:
            baseUrl = URL(string: registerUrl)
        }
        var request = URLRequest(url: baseUrl!)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: query, options: [])
        } catch let error {
            print(error.localizedDescription)
        }
        
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if error == nil {
                if let httpResponse = response as? HTTPURLResponse {
                    completion(httpResponse)
                }
            } else {
                print("Error : \(String(describing: error?.localizedDescription))")
            }
        }
        
        dataTask.resume()
    }
    
}

extension URL {
    func withQueries(_ query: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = query.map {
            URLQueryItem(name: $0.0, value: $0.1)
        }
        
        return components?.url
    }
}
