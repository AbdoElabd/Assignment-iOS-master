//
//  Router.swift
//  SwiftVIPER
//
//  Created by apple on 22/12/2022.
//  Copyright © 2022 Tsubasa Hayashi. All rights reserved.
//

import Foundation
import Alamofire


enum Router: TargetType {
   
case Token
case getPetsType
case getPets
    
    var baseURL: String {
        return Constants.baseURL
    }
    
    var path: String {
        switch self {
        case .getPets:
           return Constants.petsEndPoint
        case .Token:
            return Constants.usersEndpoint
        case .getPetsType:
            return Constants.usersEndpoint
        }
    }
    
    var method: Alamofire.HTTPMethod{
        switch self {
        case .getPets:
            return .get
        case .Token:
            return .post
        case .getPetsType:
            return .get
        }
    }
    
    var headers: HTTPHeaders?{
        switch self {
        case .getPets:
            return ["":""]
        case .Token:
            return ["" : ""]
        case .getPetsType:
            return ["" : ""]
        }
    }
    var paramets: [String : Any]?{
        
        return["grant_type" : "client_credentials" , "client_id" : "OO076NFHirXwzkqwwO38rXaj8JjF6Jh5OrAySvmhSmgkUmiwkV" , "client_secret" : "zPV0JgaIoIQ57RauCP2t6DewQ3uQYW02hT9iZrkF"]
    }
    
    
}


enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

enum Task {
    case requestPlain
    case requestParameters(parameters: [String: Any], encoding: ParameterEncoding)
}

protocol TargetType {
    
    var baseURL: String {get}
    
    var path: String {get}
    
    var method: Alamofire.HTTPMethod {get}
    
    var paramets: [String: Any]? {get}
    
    var headers: HTTPHeaders? {get}
}

