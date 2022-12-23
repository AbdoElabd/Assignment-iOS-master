//
//  BaseApi.swift
//  SwiftVIPER
//
//  Created by apple on 22/12/2022.
//  Copyright © 2022 Tsubasa Hayashi. All rights reserved.
//

import Foundation
import Alamofire

class BaseAPI<T:TargetType>{
    private func buildParams(task: Task) -> ([String: Any], ParameterEncoding){
            switch task {
            case .requestPlain:
                return ([:], URLEncoding.default)
            case .requestParameters(parameters: let parameters, encoding: let encoding):
                return (parameters, encoding)
            }
        }
}
