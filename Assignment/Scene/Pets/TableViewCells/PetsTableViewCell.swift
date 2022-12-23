//
//  PetsTableViewCell.swift
//  SwiftVIPER
//
//  Created by apple on 20/12/2022.
//  Copyright © 2022 Abdelrahman Elabd. All rights reserved.
//

import UIKit
import Kingfisher


class PetsTableViewCell: UITableViewCell , PetCellView {
    
    @IBOutlet weak var petImage : UIImageView!
    @IBOutlet weak var petName : UILabel!
    @IBOutlet weak var petGender : UILabel!
    @IBOutlet weak var petType : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    func configCell(viewModel: AnimalViewModel) {
        petImage.kf.setImage(with: viewModel.imageUrl)
        if viewModel.imageUrl == nil{
            petImage.image = UIImage(named: "placehodel2")
        }
        petName.text = viewModel.name
        petGender.text = viewModel.gender
        petType.text = viewModel.type 
    }
}
