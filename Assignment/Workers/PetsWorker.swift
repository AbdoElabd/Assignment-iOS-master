//
//  PetsWorker.swift
//  SwiftVIPER
//
//  Created by apple on 21/12/2022.
//  Copyright © 2022 abdelrahman elabd. All rights reserved.
//

import Foundation
import Alamofire

class PetsWorker {
    private let networkLayer = NetworkLayer()
    func getToken(completionHandler : @escaping (Result<Token>) -> ())  {
        networkLayer.request(PetRouter.Token, decodeToType: Token.self , completionHandler: completionHandler )
    }
    func getTypesOfPet(completionHandler : @escaping (Result<PetsTypes>) -> ())  {
        networkLayer.getPetTypes(completionHandler: completionHandler)
    }
    
    func getPets(type : String , completionHandler : @escaping (Result<Animals>) -> ())  {
        networkLayer.getPets(type: type, completionHandler: completionHandler)
//        networkLayer.request(PetRouter.getPets, decodeToType: Animals.self , completionHandler: completionHandler )
    }
}
