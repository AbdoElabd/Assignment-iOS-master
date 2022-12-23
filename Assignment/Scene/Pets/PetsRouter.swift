//
//  PetsRouter.swift
//  SwiftVIPER
//
//  Created by apple on 20/12/2022.
//  Copyright © 2022 Tsubasa Hayashi. All rights reserved.
//

import UIKit

class PetsRouter: PetsRounterProtocol {
    weak var currentViewController : UIViewController?
    static func createModul() -> UIViewController{
        let viewController = UIStoryboard(name: "Pets", bundle: nil).instantiateViewController(withIdentifier: "\(PetsViewController.self)")  as! PetsViewController
        let interactor = PetsInteractor()
        let router = PetsRouter()
        let presenter = PetsPresenter(view: viewController, interactor: interactor, route: router)
        viewController.presenter = presenter
        interactor.presenter = presenter
        router.currentViewController = viewController
        return viewController
      }
    
    static func routeToDetails() -> UIViewController{
        let viewController = UIStoryboard(name: "Pets", bundle: nil).instantiateViewController(withIdentifier: "PetsDetailsViewController")  as! PetsDetailsViewController
        
        return viewController
      }
    
    
    }
