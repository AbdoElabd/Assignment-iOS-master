//
//  PetsDetailsViewController.swift
//  SwiftVIPER
//
//  Created by apple on 23/12/2022.
//  Copyright © 2022 Tsubasa Hayashi. All rights reserved.
//

import UIKit
import Kingfisher

class PetsDetailsViewController: UIViewController , PetProtocol{
   
    
    
    @IBOutlet weak var image : UIImageView!
    @IBOutlet weak var nameLbl : UILabel!
    @IBOutlet weak var sizeLbl : UILabel!
    @IBOutlet weak var colorLbl : UILabel!
    @IBOutlet weak var addressLbl : UILabel!
    var currentPetViewModel : AnimalViewModel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configCell(viewModel: currentPetViewModel)
        // Do any additional setup after loading the view.
    }
    @IBAction func disPressToShowWebSite(_ sender : UIButton){
        if let url = URL(string: "https://www.petfinder.com/") {
            UIApplication.shared.open(url)
        }
    }
    func configCell(viewModel: AnimalViewModel) {
        image.kf.setImage(with: currentPetViewModel.imageUrl)
        if currentPetViewModel.imageUrl == nil{
            image.image = UIImage(named: "placeHolder")
        }
        nameLbl.text = viewModel.name
        sizeLbl.text = viewModel.size
        colorLbl.text = viewModel.color
        addressLbl.text = viewModel.address
    }
        
    


}
