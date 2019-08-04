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
        
        let params: [String: Any] = [
            "email": email,
            "password": password,
        ]
        
        AF.request("http://192.168.43.221:5000/login", method: .post, parameters: params).validate().responseJSON { responseJSON in
            
            switch responseJSON.result {
            case .success(let _):
                print(responseJSON)
                completion(responseJSON)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getRequest(token: String, query: String,  completion: @escaping (Any) -> ()) {
        var url = "http://192.168.43.221:5000/\(query)"
        let headers: HTTPHeaders = [
            "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NjQ4MDkxNTcsIm5iZiI6MTU2NDgwOTE1NywianRpIjoiNDY4OWZhZjAtYzdhMS00NjkxLWFmMGItZjFkOWU3N2M4NWQwIiwiZXhwIjoxNTk2MzQ1MTU3LCJpZGVudGl0eSI6MSwiZnJlc2giOnRydWUsInR5cGUiOiJhY2Nlc3MifQ.Sdai3MeIDbUl-7KgBcWuajujKAe2_dJycGMfOR0CvIg",
            "Accept": "application/json"
        ]
        
        AF.request(url, headers: headers).responseJSON { response in
            switch response.result {
            case .success(let json):
                completion(json)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
