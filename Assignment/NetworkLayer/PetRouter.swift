//
//  PetRouter.swift
//  Assignment
//
//  Created by apple on 20/12/2022.
//  Copyright © 2022 abdelrahman elabd. All rights reserved.
//



import Foundation
import Alamofire


enum PetRouter: URLRequestConvertible {
    
    case Token
    case getPetsType
    case getPets
    var method: HTTPMethod {
        switch self {
        case .getPets:
            return .get
        case .Token:
            return .post
        case .getPetsType:
            return .get
        }
    
    }
    var parameters: [String : Any]? {
        switch self {
        case .getPets:
            return ["type" : "cat"]
        case .Token:
            return ["grant_type" : "client_credentials" , "client_id" : "OO076NFHirXwzkqwwO38rXaj8JjF6Jh5OrAySvmhSmgkUmiwkV" , "client_secret" : "zPV0JgaIoIQ57RauCP2t6DewQ3uQYW02hT9iZrkF"]
        case .getPetsType:
            return nil
        }
    }
    var url: URL {
        let relativePath : String?
        switch self {
        case .getPets:
            relativePath = Constants.petsEndPoint
        case .Token:
            relativePath = Constants.usersEndpoint
        case .getPetsType:
            relativePath = Constants.usersEndpoint
        }
        var url = URL(string: Constants.baseURL)!
        if let relativePath = relativePath {
            url = url.appendingPathComponent(relativePath)
        }
        return url
    }
    var header : HTTPHeaders {
            switch self {
            case .getPets:
                return ["Authorization" : "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiJPTzA3Nk5GSGlyWHd6a3F3d08zOHJYYWo4SmpGNkpoNU9yQXlTdm1oU21na1VtaXdrViIsImp0aSI6IjRmNWFkMmZlYmRkM2UwNGEyYzI4NTZmMjk5YjM0MTFhODRlODlkNTdjOTQ5NmVkMThhZWIxZGU4Njc3NTZlZWZhMTVlOGJlZTA0NjNiMjE4IiwiaWF0IjoxNjcxNjk2ODY1LCJuYmYiOjE2NzE2OTY4NjUsImV4cCI6MTY3MTcwMDQ2NSwic3ViIjoiIiwic2NvcGVzIjpbXX0.RTNDW4_ZbfAlcWMgusVJ4qtlAdzwUUPNMwdT4l13B5RppioLaETlbUjESp44sLkQHJSHritDKiOBjhkT1DtB6lOM7pThOKr7l4eccg4lxqYGQf3aCOZmSdsR_vzgqARss_it1_UKRjdbqmnzg41VeyBeJUslTUayUY2P8-oNFzOu0ATr7ZALFVhESk_ozTZp9rTOXg7kyC5nPJemwhOTqPR3b8bVrVTonE6RwtxFna958MQRkNuhZ3H9EKZ21DEnr2nowCW8IuySygxfEozaNi-TJOBU_C5eVPUSvCBpJ2LjFZcfG7LPpab0nRJcarGwsVTU8eyX-gIrfEiy3y6gmA"]
            case .Token:
                return []
            case .getPetsType:
                return ["Authorization" : "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiJPTzA3Nk5GSGlyWHd6a3F3d08zOHJYYWo4SmpGNkpoNU9yQXlTdm1oU21na1VtaXdrViIsImp0aSI6IjRmNWFkMmZlYmRkM2UwNGEyYzI4NTZmMjk5YjM0MTFhODRlODlkNTdjOTQ5NmVkMThhZWIxZGU4Njc3NTZlZWZhMTVlOGJlZTA0NjNiMjE4IiwiaWF0IjoxNjcxNjk2ODY1LCJuYmYiOjE2NzE2OTY4NjUsImV4cCI6MTY3MTcwMDQ2NSwic3ViIjoiIiwic2NvcGVzIjpbXX0.RTNDW4_ZbfAlcWMgusVJ4qtlAdzwUUPNMwdT4l13B5RppioLaETlbUjESp44sLkQHJSHritDKiOBjhkT1DtB6lOM7pThOKr7l4eccg4lxqYGQf3aCOZmSdsR_vzgqARss_it1_UKRjdbqmnzg41VeyBeJUslTUayUY2P8-oNFzOu0ATr7ZALFVhESk_ozTZp9rTOXg7kyC5nPJemwhOTqPR3b8bVrVTonE6RwtxFna958MQRkNuhZ3H9EKZ21DEnr2nowCW8IuySygxfEozaNi-TJOBU_C5eVPUSvCBpJ2LjFZcfG7LPpab0nRJcarGwsVTU8eyX-gIrfEiy3y6gmA"]
            }
    }
    var encoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.headers = header
        return try encoding.encode(urlRequest, with: parameters)
    }
    
    
}





