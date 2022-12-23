//
//  PetsPresenter.swift
//  SwiftVIPER
//
//  Created by apple on 20/12/2022.
//  Copyright © 2022 Tsubasa Hayashi. All rights reserved.
//

import UIKit

class PetsPresenter: PetsPresenterProtocol , PetsInteractorOutputProtocol {
    
    
    
    weak var view: PetsViewProtocol?
    private let interactor : PetsInteractorInputProtocol
    private let route : PetsRounterProtocol
    private var pets : Animals!
    private var petsType : PetsTypes!
    
    init(view: PetsViewProtocol, interactor: PetsInteractorInputProtocol, route: PetsRounterProtocol) {
        self.view = view
        self.interactor = interactor
        self.route = route
    }
    func viewdidload() {
        view?.showLoadingIndicator()
        interactor.getToken()
    }
    func petsFetchSuccessfully(pets: Animals) {
        view?.hideLoadingIndicator()
        self.pets = pets
        view?.reloadDate()
    }
    
    func petsFetchFailure(witherror error: Error) {
        view?.hideLoadingIndicator()
        interactor.getToken()
    }
    
    var numberOfRow: Int{
        guard let pets = pets else {return 0}
        return pets.animals.count
    }
    var numberOfTypes: Int{
        guard let types = petsType else {return 0}
        return types.types.count
    }
    func tokenFetchSuccessfully(token: Token) {
        Constants.token = token.accessToken
        interactor.getPetsTypes()
    }
    func tokenFetchFailure(witherror error: Error) {
        view?.hideLoadingIndicator()
        interactor.getToken()
    }
    func getPetsTypeSuccessfully(types: PetsTypes) {
        view?.hideLoadingIndicator()
        view?.reloadTypes()
        self.petsType = types
        interactor.getPets(type: types.types.first?.name ?? "")
    }
    
    func getPetsTypeFailure(witherror error: Error) {
        view?.hideLoadingIndicator()
    }
    func configure(cell: PetsTableViewCell, indexPath: IndexPath) {
        let pet = pets.animals[indexPath.row]
        let viewModel = AnimalViewModel(animal: pet)
        cell.configCell(viewModel: viewModel)
    }
    func configureTypePet(cell: PetsCollectionView, indexPath: IndexPath) {
        let type = petsType.types[indexPath.row]
        let viewModel = TypeViewModel(animal: type)
        cell.configCell(viewModel: viewModel)
    }
    func changePetType(indexpath: IndexPath) {
        let type = petsType.types[indexpath.row].name
        interactor.getPets(type: type)
    }
    
    func routeToDetails(indexPath: IndexPath) {
        let animal = pets.animals[indexPath.row]
        let pet = pets.animals[indexPath.row]
        let viewModel = AnimalViewModel(animal: pet)
        let detailsViewcontroller = PetsRouter.routeToDetails() as? PetsDetailsViewController
        detailsViewcontroller?.currentPetViewModel = viewModel
        view?.routeToDetails(viewController: detailsViewcontroller!)
    }
    
}
