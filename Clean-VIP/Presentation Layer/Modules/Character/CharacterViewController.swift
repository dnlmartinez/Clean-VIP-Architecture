//
//  CharacterViewController.swift
//  Clean-VIP
//
//  Created by MacSivsa on 6/4/22.
//

import UIKit
import SDWebImage


protocol CharacterPresenterOutput: AnyObject {
    
    func presenter(didRetrieveItems items: [CharacterModel])
    func presenter(didFailRetrieveItems message: String)
    
    func presenter(didPresentCharacter character: CharacterModel)
    func presenter(didFailPresentCharacter message: String)
}


class CharacterViewController: UIViewController {
    
    // MARK: - Properties
    
    
    var characterView: CharacterView?
    var interactor: CharacterInteractor?
    var router: CharacterRouter?
    
    private var items: [CharacterModel] = [CharacterModel]()
    
    
    // MARK: - Lifecycle Methods
    
    
    override func loadView() {
        super.loadView()
        self.view = characterView
        
        characterView?.tableView.delegate = self
        characterView?.tableView.dataSource = self
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        interactor?.viewDidLoad()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Marvel Characters"
        self.navigationItem.titleView?.tintColor = UIColor.white
    }

}


// MARK: - Presenter Output


extension CharacterViewController: CharacterPresenterOutput {
    
    func presenter(didRetrieveItems items: [CharacterModel]) {
        self.items = items
        self.characterView?.reloadTableView()
    }
    
    
    func presenter(didFailRetrieveItems message: String) {
        showError(with: message)
    }
    
    
    func presenter(didPresentCharacter character: CharacterModel){
        
        self.router?.routeToDetail(with: character)

    }
    
    func presenter(didFailPresentCharacter message: String){
        showError(with: message)
    }
    
}


// MARK: - UITableView DataSource & Delegate



extension CharacterViewController: UITableViewDelegate, UITableViewDataSource {

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            self.items.isEmpty ?
            self.characterView?.showPlaceholder() :
            self.characterView?.hidePlaceholder()
        
        return self.items.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterRow", for: indexPath) as! CharacterRow
        cell.lb_name.text = self.items[indexPath.row].name
        cell.artwork.sd_setImage(with: URL.init(string: self.items[indexPath.row].artwork ?? ""))
        cell.selectionStyle = .none
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.interactor?.didSelectRow(at: indexPath.row)
    }
    
}
