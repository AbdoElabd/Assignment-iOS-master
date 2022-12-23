//
//  PetsCollectionView.swift
//  SwiftVIPER
//
//  Created by apple on 20/12/2022.
//  Copyright © 2022 Tsubasa Hayashi. All rights reserved.
//

import UIKit

class PetsCollectionView: UICollectionViewCell , PetTypeCollectionViewCell {
    
    @IBOutlet weak var nameLbl : UILabel!
    func configCell(viewModel: TypeViewModel) {
        nameLbl.text = viewModel.name
    }
}
