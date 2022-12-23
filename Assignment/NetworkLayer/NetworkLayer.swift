//
//  NetworkLayer.swift
//  Assignment
//
//  Created by apple on 20/12/2022.
//  Copyright © 2022 abdelrahman elabd. All rights reserved.
//



import Foundation
import Alamofire

enum Result<T> {
    case success(T)
    case failure(Error)
}

class NetworkLayer {
    func request<T: Codable>(_ request: URLRequestConvertible, decodeToType type: T.Type, completionHandler: @escaping (Result<T>) -> ()) {
        print(request)
        AF.request(request).responseDecodable(of : type.self) { response in
            print(response)
            switch response.result{
            case .success(let result):
                completionHandler(.success(result))
            case .failure(let error):
                completionHandler(.failure(error))
            }
//            completionHandler(.success(response.value!))
        }
    }
    func getPetTypes<T: Codable> (completionHandler: @escaping (Result<T>) -> ()) {
        let headers: HTTPHeaders = ["Authorization": "Bearer " + Constants.token]
        
        let url = URL(string: (Constants.baseURL + Constants.petsTypeEndPoint) )

        AF.request(url!, method: .get, parameters: [:], encoding: URLEncoding.default, headers: headers)
            .responseDecodable(of : T.self){ response in
                print(response)
                switch response.result{
                case .failure(let error):
                    completionHandler(.failure(error))
                case .success(let response):
                    completionHandler(.success(response))
                }
            }
    }
    
    
    func getPets<T: Codable> ( type : String , completionHandler: @escaping (Result<T>) -> ()) {
        let headers: HTTPHeaders = ["Authorization": "Bearer " + Constants.token]
        let userDictionary = ["type" : type]
        let url = URL(string: (Constants.baseURL + Constants.petsEndPoint) )
        print(T.self)
        AF.request(url!, method: .get, parameters: userDictionary, encoding: URLEncoding.default, headers: headers)
        
            .responseDecodable(of : T.self){ response in
                print(response)
                switch response.result{
                case .failure(let error):
                    completionHandler(.failure(error))
                case .success(let response):
                    completionHandler(.success(response))
                }
                
               
              
                
                
            }
    }
    
    
}
