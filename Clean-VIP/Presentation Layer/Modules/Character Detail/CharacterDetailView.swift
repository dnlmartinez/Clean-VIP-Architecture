//
//  CharacterDetailView.swift
//  Clean-VIP
//
//  Created by MacSivsa on 6/4/22.
//

import UIKit

class CharacterDetailView: UIView {
    
    
    // MARK: - Initialization
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    
    
    public func update(with model: CharacterModel) {
        
        DispatchQueue.main.async {
            self.artwork.sd_setImage(with: URL.init(string: model.artwork ?? ""))
            self.titlelb.text = model.name
            self.descriptionlb.text = model.information
        }
    }
    
    
    lazy var artwork: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    lazy var titlelb: UILabel = {
        let title = UILabel()
        title.textColor = UIColor.black
        title.numberOfLines = 2
        title.contentMode = .topLeft
        title.font = UIFont.boldSystemFont(ofSize: 24)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    
    lazy var descriptionlb: UITextView = {
        let title = UITextView()
        title.textColor = UIColor.black
        title.contentMode = .topLeft
        title.font = UIFont.systemFont(ofSize: 18, weight: .thin)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    
}


// MARK: - UI Setup



extension CharacterDetailView {

    private func setupUI() {
        
        self.overrideUserInterfaceStyle = .light
        self.backgroundColor = .white

        self.addSubview(titlelb)
        self.addSubview(descriptionlb)
        self.addSubview(artwork)
                
        NSLayoutConstraint.activate([
            artwork.leftAnchor.constraint(equalTo: self.leftAnchor),
            artwork.rightAnchor.constraint(equalTo: self.rightAnchor),
            artwork.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            artwork.heightAnchor.constraint(equalToConstant: 320)
        ])

        NSLayoutConstraint.activate([
            titlelb.topAnchor.constraint(equalTo: self.artwork.bottomAnchor, constant: 40),
            titlelb.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 40),
            titlelb.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 40),
            titlelb.heightAnchor.constraint(equalToConstant: 40)
        ])

        NSLayoutConstraint.activate([
            descriptionlb.topAnchor.constraint(equalTo: self.titlelb.bottomAnchor),
            descriptionlb.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 40),
            descriptionlb.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -40),
            descriptionlb.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
    }
    
}
