//
//  PersistentContainerProvider.swift
//  Clean-VIP
//
//  Created by MacSivsa on 6/4/22.
//

import CoreData

class PersistentContainerProvider {
    
    private init() {}
    
    private static let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    public static func getInstance() -> NSPersistentContainer {
        return persistentContainer
    }
}
