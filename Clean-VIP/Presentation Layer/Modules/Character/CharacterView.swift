//
//  CharacterView.swift
//  Clean-VIP
//
//  Created by MacSivsa on 6/4/22.
//

import UIKit

class CharacterView: UIView {
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    public func showPlaceholder() {
        UIView.animate(withDuration: 0.3) {
            self.placeholderView.alpha = 1.0
            self.tableView.alpha = 0.0
        }
    }
    
    public func hidePlaceholder() {
        UIView.animate(withDuration: 0.3) {
            self.placeholderView.alpha = 0.0
            self.tableView.alpha = 1.0
        }
    }
    
    public func reloadTableView() {
        self.tableView.reloadData()
    }
    
    // MARK: - Properties
    
    lazy var backgroundImg: UIImageView = {
        let background = UIImageView()
        background.contentMode = .scaleAspectFill
        background.image = UIImage.init(named: "background")
        background.alpha = 0.2
        background.translatesAutoresizingMaskIntoConstraints = false
        return background
    }()
    
    
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 90
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "CharacterRow", bundle: nil), forCellReuseIdentifier: "CharacterRow")
        tableView.backgroundColor = UIColor.clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    lazy var placeholderView: UIView = {
        
        let view = UIView.init(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height))
        view.backgroundColor = UIColor.clear
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: 30))
        label.font = UIFont(name: "Avenir-Heavy", size: 25)
        label.contentMode = .center
        label.text = "Loading ... "
        label.textColor = .darkGray
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let indicator = MaterialActivityIndicatorView(frame: CGRect(x: self.frame.size.width / 2, y: self.frame.size.height / 2, width: 140, height: 140))
        indicator.color =  UIColor.init(named: "RedMarvel")!
        indicator.startAnimating()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        view.addSubview(indicator)
        
//        NSLayoutConstraint.activate([
//            indicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            indicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//        ])
//
//        NSLayoutConstraint.activate([
//            label.leftAnchor.constraint(equalTo: view.leftAnchor),
//            label.rightAnchor.constraint(equalTo: view.rightAnchor),
//            label.topAnchor.constraint(equalTo: indicator.bottomAnchor)
//        ])
        
        //view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
}


// MARK: - UI Setup


extension CharacterView {
    
    private func setupUI() {
        
        self.overrideUserInterfaceStyle = .light
        self.backgroundColor = .white
        self.addSubview(backgroundImg)
        self.addSubview(tableView)
        self.addSubview(placeholderView)
        
        NSLayoutConstraint.activate([
            backgroundImg.leftAnchor.constraint(equalTo: self.leftAnchor),
            backgroundImg.rightAnchor.constraint(equalTo: self.rightAnchor),
            backgroundImg.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            backgroundImg.topAnchor.constraint(equalTo: self.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: self.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: self.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: self.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            placeholderView.leftAnchor.constraint(equalTo: self.leftAnchor),
            placeholderView.rightAnchor.constraint(equalTo: self.rightAnchor),
            placeholderView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            placeholderView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
}
