//
//  CharacterPresenter.swift
//  Clean-VIP
//
//  Created by MacSivsa on 6/4/22.
//

import Foundation

protocol CharacterPresenter: AnyObject {
    func interactor(didRetrieveCharacters characters: [CharacterModel])
    func interactor(didFailRetrieveCharacters error: Error)
    func interactor(didFailRetrieveCharacters message: String)
    func interactor(didPresentCharacter character: CharacterModel)
    func interactor(didFailPresentCharacter error: Error)
}


class CharacterPresenterImplementation: CharacterPresenter {
    weak var viewController: CharacterPresenterOutput?
    
    func interactor(didRetrieveCharacters characters: [CharacterModel]) {
        viewController?.presenter(didRetrieveItems: characters)
    }
    
    func interactor(didFailRetrieveCharacters error: Error) {
        viewController?.presenter(didFailRetrieveItems: error.localizedDescription)
    }
    
    func interactor(didFailRetrieveCharacters message: String){
        viewController?.presenter(didFailRetrieveItems: message)
    }
    
    
    func interactor(didPresentCharacter character: CharacterModel){
        viewController?.presenter(didPresentCharacter: character)
    }
    
    func interactor(didFailPresentCharacter error: Error){
        viewController?.presenter(didFailRetrieveItems: error.localizedDescription)
    }
    
}
