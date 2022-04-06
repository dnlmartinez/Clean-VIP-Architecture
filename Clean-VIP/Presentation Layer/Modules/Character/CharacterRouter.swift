//
//  CharacterRouter.swift
//  Clean-VIP
//
//  Created by MacSivsa on 6/4/22.
//

import UIKit


protocol CharacterRouter: AnyObject {
    
    var navigationController: UINavigationController? { get }
    
    func routeToDetail(with character: CharacterModel)
    
}


class CharacterRouterImplementation: CharacterRouter {
 
    weak var navigationController: UINavigationController?
    
    func routeToDetail(with character: CharacterModel){
        let viewController = CharacterDetailViewController()
        CharacterDetailConfigurator.configureModule(character: character, viewController: viewController)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}
