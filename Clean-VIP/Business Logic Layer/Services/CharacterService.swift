//
//  CharacterService.swift
//  Clean-VIP
//
//  Created by MacSivsa on 6/4/22.
//

import CoreData


protocol CharacterService: AnyObject {
    
    func getCharacter(completion: @escaping ([CharacterModel])-> Void, failure: @escaping (Error)->Void)
    
}


class CharacterServiceImplementation: CharacterService {
    
    let persistentContainer = PersistentContainerProvider.getInstance()
    
    lazy var managedContext: NSManagedObjectContext = {
        persistentContainer.viewContext
    }()
    
    private var network: NetworkService = NetworkServiceImplementation()
    
    private var counter: Int = 0
    
        
    func getCharacter(completion: @escaping ([CharacterModel])-> Void, failure: @escaping (Error)-> Void){
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CharacterModel")
        
        do{
            let result = try managedContext.fetch(fetchRequest)
            
            if let chs = result as? [CharacterModel], chs.count > 1{
                completion(chs)
            }else{
                network.retrieveCharacters { result in
                    if let values = result{
                        
                        DispatchQueue.main.async {
                            var models = [CharacterModel]()
                        
                            for value in values{
                                if let model = self.storeCharacter(object: value){ models.append(model) }
                            }
                            completion(models)
                        }
                    }
                }
            }
        }catch{
            failure(error)
        }
    }
    
    
    private func storeCharacter(object: [String: Any]) -> CharacterModel?{
        
        if let obj = NSEntityDescription.insertNewObject(forEntityName: "CharacterModel", into: managedContext) as? CharacterModel{
            
            do{
                if let id = object["id"] as? Int{
                    obj.identifier = Int32(id)
                }
                
                if let name = object["name"] as? String{
                    obj.name = name
                }
                
                if let information = object["description"] as? String{
                    obj.information = information
                }
                
                if let detailsUrl = object["resourceURI"] as? String{
                    obj.detailsUrl = detailsUrl
                }
                
                if let artworkObj = object["thumbnail"] as? [String:Any], let uri = artworkObj["path"] as? String, let ext = artworkObj["extension"] as? String {
                    obj.artwork = uri + "." + ext
                }
                
                try self.managedContext.save()
                return obj
                
            }catch{ }
            
        }
        
        return nil
    }
    
    
}
