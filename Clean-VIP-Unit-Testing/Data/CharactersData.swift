//
//  CharactersData.swift
//  Clean-VIP-Unit-Testing
//
//  Created by daniel martinez gonzalez on 7/4/22.
//  Copyright © 2022 Zafar. All rights reserved.
//

@testable import Clean_VIP
import Foundation
import CoreData


class CharacterInteractornSpy: CharacterInteractorImplementation {
    
    var fetchCharacterOnLoadCalled = false
    
    override func viewDidLoad() {
        fetchCharacterOnLoadCalled = true
    }
    
}


struct CharacterData {
    let identifier: Int
    let name: String
    let information: String
    let detailsUrl: String
    let artwork: String
}


struct CharcterDataMock {
 
    var characters: [CharacterModel] {
        
        let managedContext = PersistentContainerProvider.getInstance().viewContext
        var list: [CharacterModel] = [CharacterModel]()
            
        for i in 0 ..< 9{
            if let obj = NSEntityDescription.insertNewObject(forEntityName: "CharacterModel", into: managedContext) as? CharacterModel{
                obj.identifier = Int32(i * 1000)
                obj.name = "Name_\(i)"
                obj.information = "Information_\(i)"
                obj.detailsUrl = "Details_\(i)"
                obj.artwork = ""
                list.append(obj)
            }
        }
        return list
    }
    
    
}
