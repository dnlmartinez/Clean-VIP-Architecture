//
//  CharacterDetailViewController.swift
//  Clean-VIP
//
//  Created by MacSivsa on 6/4/22.
//

import UIKit

protocol CharacterDetailPresenterOutput: AnyObject {
    func presenter(loadCharacter item: CharacterModel)
    func presenter(didFailRetrieveItem message: String)
}

class CharacterDetailViewController: UIViewController {
    
    
    // MARK: - Lifecycle Methods
    
    
    override func loadView() {
        super.loadView()
        self.view = characterDetailView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.interactor?.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    // MARK: - Properties
    
    
    var characterDetailView: CharacterDetailView?
    var interactor: CharacterDetailInteractor?
    
    weak var presenter: CharacterDetailPresenter?
    
    var router: CharacterDetailRouter?
    
}


// MARK: - Presenter Output


extension CharacterDetailViewController: CharacterDetailPresenterOutput {
    
    
    func presenter(loadCharacter item: CharacterModel){
        characterDetailView?.update(with: item)
    }
    
    
    func presenter(didFailRetrieveItem message: String) {
        showError(with: message)
    }
    
    
}
