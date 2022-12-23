//
//  ExtensionCollectionView.swift
//  SwiftVIPER
//
//  Created by apple on 20/12/2022.
//  Copyright © 2022 Abdelrahman Elabd . All rights reserved.
//

import UIKit

extension PetsViewController : UICollectionViewDelegate ,  UICollectionViewDataSource  , UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfTypes
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = PetsNamesCollectinView.dequeueReusableCell(withReuseIdentifier: "PetsCollectionView", for: indexPath) as! PetsCollectionView
        presenter.configureTypePet(cell: cell, indexPath: indexPath)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.changePetType(indexpath: indexPath)
    }
}
