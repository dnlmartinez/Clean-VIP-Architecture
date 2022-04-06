//
//  CharacterDetailConfigurator.swift
//  Clean-VIP
//
//  Created by MacSivsa on 6/4/22.
//

import Foundation

class CharacterDetailConfigurator {
    
    static func configureModule(character: CharacterModel, viewController: CharacterDetailViewController) {
        
        let view = CharacterDetailView()
        let router = CharacterDetailRouterImplementation()
        let interactor = CharacterDetailInteractorImplementation()
        let presenter = CharacterDetailPresenterImplementation()
        
        interactor.character = character
        
        viewController.characterDetailView = view
        viewController.router = router
        viewController.interactor = interactor
        
        interactor.presenter = presenter
        
        presenter.viewController = viewController
    }
    
}
