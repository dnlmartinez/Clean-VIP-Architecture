//
//  Clean_VIP_Snapshot_Testing.swift
//  Clean-VIP-Unit-Testing
//
//  Created by daniel martinez gonzalez on 7/4/22.
//  Copyright © 2022 Zafar. All rights reserved.
//

@testable import Clean_VIP
import XCTest
import SnapshotTesting



class Clean_VIP_Snapshot_Testing: XCTestCase {

    
    func testCharacterViewController() {
      
        let vc = CharacterViewController()
        vc.view = CharacterView()
        let presenter = CharacterPresenterImplementation()
        presenter.viewController = vc
        vc.viewDidLoad()
        presenter.interactor(didRetrieveCharacters: CharcterDataMock().characters)
        assertSnapshot(matching: vc, as: .image(on: .iPhoneX), record: false)
    }
    
    
    
}
