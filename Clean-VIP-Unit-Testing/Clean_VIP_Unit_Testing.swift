//
//  Clean_VIP_Unit_Testing.swift
//  Clean-VIP-Unit-Testing
//
//  Created by daniel martinez gonzalez on 6/4/22.
//  Copyright © 2022 Zafar. All rights reserved.
//


@testable import Clean_VIP
import XCTest


class Clean_VIP_Unit_Testing: XCTestCase {
    
    var v: CharacterViewController!
    var window: UIWindow!
    
    
    override func setUp()
    {
        super.setUp()
        window = UIWindow()
        setupViewController()
    }
    
    
    // MARK: - Test setup
    
    
    func setupViewController(){
        v = CharacterViewController()
        v.view = CharacterView()
    }
    
    
    func loadView(){
        window.addSubview(v.view)
        RunLoop.current.run(until: Date())
    }
    
    
    override func tearDown(){
        window = nil
        super.tearDown()
    }
    
    
    // MARK: - Tests
    
    
    func testInteractor() throws {
        // Given
        let spy = CharacterInteractornSpy()
        v.interactor = spy
        // When
        loadView()
        // Then
        XCTAssertTrue(spy.fetchCharacterOnLoadCalled, "viewDidLoad() should ask the interactor to fetch movies categories")
    }
    
    
    func testPresenter() throws {
        
        
    }
    
    
    func testPerformanceExample() throws {
        measure {
            
        }
    }
    
}
