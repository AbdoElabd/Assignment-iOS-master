//
//  PetsInteractor.swift
//  SwiftVIPER
//
//  Created by apple on 20/12/2022.
//  Copyright © 2022 abdelrahman elabd. All rights reserved.
//

import UIKit

class PetsInteractor: PetsInteractorInputProtocol {
    
    weak var presenter: PetsInteractorOutputProtocol?
    private let petsWorker = PetsWorker()
    func getToken() {
        petsWorker.getToken { [weak self] result in
            guard let self = self else {return}
            switch result{
            case .success(let token):
                self.presenter?.tokenFetchSuccessfully(token: token)
            case .failure(let error):
                self.presenter?.tokenFetchFailure(witherror: error)
            }
        }

    }
    
    func getPets(type : String) {
        petsWorker.getPets(type: type) { [weak self] result in
                guard let self = self else {return}
                switch result{
                case .success(let animals):
                    self.presenter?.petsFetchSuccessfully(pets: animals )
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                    self.presenter?.petsFetchFailure(witherror: error)
                    break
                }
            }
        
    }
    
    
    func getPetsTypes() {
        
        petsWorker.getTypesOfPet() { [weak self] result in
                    guard let self = self else {return}
                    switch result{
                    case .success(let petsType):
                        print(petsType.types.count)
                        self.presenter?.getPetsTypeSuccessfully(types: petsType)
                        break
                    case .failure(let error):
                        print(error.localizedDescription)
                        self.presenter?.getPetsTypeFailure(witherror: error)
                        break
                    }
                }    }
    
}
