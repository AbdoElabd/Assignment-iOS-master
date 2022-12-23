//
//  ExtensionTableView.swift
//  SwiftVIPER
//
//  Created by apple on 20/12/2022.
//  Copyright © 2022 Abdelrahman Elabd All rights reserved.
//

import Foundation
import UIKit

extension PetsViewController : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRow
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mainTableView.dequeueReusableCell(withIdentifier: "petstableviewcell", for: indexPath) as! PetsTableViewCell
        presenter.configure(cell: cell, indexPath: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.routeToDetails(indexPath: indexPath)
//        presenter.view?.routeToDetails(indexpath : indexPath)
    }
    
}
