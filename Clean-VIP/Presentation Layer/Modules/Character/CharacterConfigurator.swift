//
//  CharacterConfigurator.swift
//  Clean-VIP
//
//  Created by MacSivsa on 6/4/22.
//

import UIKit

class CharacterConfigurator {
    
    static func configureModule(viewController: CharacterViewController) {
        
        let view = CharacterView()
        let router = CharacterRouterImplementation()
        let interactor = CharacterInteractorImplementation()
        let presenter = CharacterPresenterImplementation()
        
        viewController.characterView = view
        viewController.router = router
        viewController.interactor = interactor

        interactor.presenter = presenter
        
        presenter.viewController = viewController
        
        router.navigationController = viewController.navigationController
    }
    
}
