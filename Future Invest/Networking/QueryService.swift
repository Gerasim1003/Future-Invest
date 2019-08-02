//
//  QueryService.swift
//  Music Player
//
//  Created by Gerasim Israyelyan on 7/23/19.
//  Copyright © 2019 Gerasim Israyelyan. All rights reserved.
//

import UIKit
import Alamofire

class QueryService {
    enum Method {
        case register
        case login
    }
    let registerUrl = "http://192.168.43.221:5000/register"
    let loginUrl = "http://192.168.43.221:5000/login"
    
    func postRequest(email: String, password: String, method: Method, completion: @escaping (DataResponse<Any>) -> ()) {
        
        let baseUrl: URL!
        
        switch method {
        case .login:
            baseUrl = URL(string: loginUrl)
        case .register:
            baseUrl = URL(string: registerUrl)
        }
        
        let params: [String: Any] = [
            "email": email,
            "password": password
        ]
        
        AF.request(baseUrl, method: .post, parameters: params).validate().responseJSON { responseJSON in
            completion(responseJSON)
//            switch responseJSON.result {
//            case .success(let value):
//                guard
//                    let jsonObject = value as? [String: Any]
//                    else { return }
//                print(jsonObject)
//                completion(jsonObject)
//                
//            case .failure(let error):
//                print(error)
//            }
        }
    
    }
}
//
//extension URL {
//    func withQueries(_ query: [String: String]) -> URL? {
//        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
//        components?.queryItems = query.map {
//            URLQueryItem(name: $0.0, value: $0.1)
//        }
//
//        return components?.url
//    }
//}
