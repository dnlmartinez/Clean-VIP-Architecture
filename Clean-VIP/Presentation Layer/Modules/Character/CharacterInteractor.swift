//
//  CharacterInteractor.swift
//  Clean-VIP
//
//  Created by MacSivsa on 6/4/22.
//

import Foundation

protocol CharacterInteractor: AnyObject {
    
    func viewDidLoad()
    func didSelectRow(at index: Int)
}

class CharacterInteractorImplementation: CharacterInteractor {
    
    var presenter: CharacterPresenter?
    
    private let characterService = CharacterServiceImplementation()
    private var characters: [CharacterModel] = []
    
    func viewDidLoad()  {
        
        
        characterService.getCharacter { result in
            if result.count > 0{
                self.characters = result
                self.presenter?.interactor(didRetrieveCharacters: self.characters)
            }else{
                self.presenter?.interactor(didFailRetrieveCharacters: "Error Trying to retrieve characters")
            }
        } failure: { error in
            self.presenter?.interactor(didFailRetrieveCharacters: error)
        }

        
    }
    
    func didSelectRow(at index: Int) {
        if self.characters.indices.contains(index) {
            presenter?.interactor(didPresentCharacter: self.characters[index])
        }
    }
    
}
