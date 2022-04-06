//
//  CharacterDetailPresenter.swift
//  Clean-VIP
//
//  Created by MacSivsa on 6/4/22.
//

import Foundation

protocol CharacterDetailPresenter: AnyObject {
    func interactor(didRetrieveCharacter character: CharacterModel)
    func interactor(didFailRetrieveCharacter error: String)
}


class CharacterDetailPresenterImplementation: CharacterDetailPresenter {
    
    var viewController: CharacterDetailPresenterOutput?
    
    func interactor(didRetrieveCharacter character: CharacterModel) {
        viewController?.presenter(loadCharacter: character)
    }
    
    func interactor(didFailRetrieveCharacter error: String) {
        viewController?.presenter(didFailRetrieveItem: error)
    }
}
