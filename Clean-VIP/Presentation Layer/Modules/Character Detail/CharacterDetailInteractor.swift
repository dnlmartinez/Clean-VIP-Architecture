//
//  CharacterDetailInteractor.swift
//  Clean-VIP
//
//  Created by MacSivsa on 6/4/22.
//

import Foundation

protocol CharacterDetailInteractor: AnyObject {
    
    var character: CharacterModel? { get }
    
    func viewDidLoad()
}

class CharacterDetailInteractorImplementation: CharacterDetailInteractor {
    
    var character: CharacterModel?
    
    var presenter: CharacterDetailPresenter?
    
    private let characacterService = CharacterServiceImplementation()
    
    func viewDidLoad() {
        if let character = character{
            presenter?.interactor(didRetrieveCharacter: character)
        }else{
            presenter?.interactor(didFailRetrieveCharacter: "Invalid Model")
        }
    }
    
}
