//
//  PetsProtocols.swift
//  SwiftVIPER
//
//  Created by apple on 20/12/2022.
//  Copyright © 2022 abdelrahman elabd. All rights reserved.
//

import Foundation

protocol PetsViewProtocol : class {
    var presenter : PetsPresenterProtocol! {get set }
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func reloadTypes ()
    func reloadDate()
    func routeToDetails(viewController: PetsDetailsViewController)
}
protocol PetsPresenterProtocol : class {
    func viewdidload()
    var view : PetsViewProtocol? {get set }
    var numberOfTypes : Int {get}
    var numberOfRow : Int {get}
    func configure(cell : PetsTableViewCell , indexPath : IndexPath)
    func configureTypePet(cell : PetsCollectionView , indexPath : IndexPath)
    func changePetType(indexpath : IndexPath)
    func routeToDetails(indexPath : IndexPath)
}
protocol PetsRounterProtocol {
    
}
protocol PetsInteractorInputProtocol {
    var presenter : PetsInteractorOutputProtocol? {get set}
    func getToken()
    func getPetsTypes()
    func getPets(type : String)
}
protocol PetsInteractorOutputProtocol  : class{
    func tokenFetchSuccessfully(token : Token)
    func tokenFetchFailure(witherror error : Error)
    func getPetsTypeSuccessfully(types : PetsTypes)
    func getPetsTypeFailure(witherror error : Error)
    func petsFetchSuccessfully(pets : Animals)
    func petsFetchFailure(witherror error : Error)
}
protocol PetCellView {
    func configCell(viewModel : AnimalViewModel)
}

protocol PetTypeCollectionViewCell {
    func configCell(viewModel : TypeViewModel)
}
protocol PetProtocol {
    func configCell(viewModel : AnimalViewModel)
}
