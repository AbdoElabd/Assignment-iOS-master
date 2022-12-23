//
//  PetsViewController.swift
//  SwiftVIPER
//
//  Created by apple on 20/12/2022.
//  Copyright © 2022 Tsubasa Hayashi. All rights reserved.
//

import UIKit
import Alamofire

class PetsViewController:  UIViewController,PetsViewProtocol  {
    
    
    
    @IBOutlet weak var PetsNamesCollectinView : UICollectionView!
    @IBOutlet weak var mainTableView : UITableView!
    
    var presenter: PetsPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.setupTableView()
        self.setupCollectionView()
        // Do any additional setup after loading the view.
        presenter.viewdidload()
    }
    func setupTableView()  {
        mainTableView.delegate = self
        mainTableView.dataSource = self
    }
    func setupCollectionView()  {
        PetsNamesCollectinView.delegate = self
        PetsNamesCollectinView.dataSource = self
    }
    
    func showLoadingIndicator() {
        
    }
    
    func hideLoadingIndicator() {
        
    }
    func reloadDate() {
        self.mainTableView.reloadData()
    }
    func reloadTypes()  {
        self.PetsNamesCollectinView.reloadData()
    }
    
    func routeToDetails(viewController: PetsDetailsViewController) {
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    
    
}


