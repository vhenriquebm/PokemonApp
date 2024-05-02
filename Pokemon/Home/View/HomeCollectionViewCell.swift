//
//  HomeCollectionViewCell.swift
//  Pokemon
//
//  Created by Vitor Henrique Barreiro Marinho on 29/03/24.
//

import UIKit
import SDWebImage

class HomeCollectionViewCell: UICollectionViewCell {
    static var identifier = "HomeCollectionViewCell"
    
    private lazy var pokemonImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = .wartotle
        return imageView
    }()
    
    private lazy var pokemonLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.text = "Pikachu"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var footerView: UIView = {
        let view = UIView()
        view.backgroundColor = .mainPink
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        contentView.addSubview(pokemonImage)
        contentView.addSubview(footerView)
        contentView.addSubview(pokemonLabel)
        
        layer.cornerRadius = 10
        layer.masksToBounds = true
    }
    
    private func configureConstraints() {
        
        let imageSize = self.frame.height * 0.8
        let footerSize = self.frame.height * 0.2
        
        NSLayoutConstraint.activate([
            
            pokemonImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            pokemonImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            pokemonImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            pokemonImage.heightAnchor.constraint(equalToConstant: imageSize),
            
            footerView.topAnchor.constraint(equalTo: pokemonImage.bottomAnchor),
            footerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            footerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            footerView.heightAnchor.constraint(equalToConstant: footerSize),
            
            pokemonLabel.topAnchor.constraint(equalTo: footerView.topAnchor),
            pokemonLabel.leadingAnchor.constraint(equalTo: footerView.leadingAnchor),
            pokemonLabel.trailingAnchor.constraint(equalTo: footerView.trailingAnchor),
            pokemonLabel.bottomAnchor.constraint(equalTo: footerView.bottomAnchor)
        ])
    }
    
    func configure(pokemon: Pokemon?) {
        if let pokemon = pokemon {
            self.pokemonLabel.text = pokemon.name
            guard let url = URL(string: pokemon.imageUrl ?? "") else { return }
            pokemonImage.sd_setImage(with: url)
        }
        
        configureLongPressGesture()
    }
    
    private func configureLongPressGesture() {
        let gesture = UILongPressGestureRecognizer(target: self,
                                                   action: #selector(showDetails))
        
        addGestureRecognizer(gesture)
    }
    
    @objc private func showDetails(sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            print ("It is working")
            
        }
        
    }
}
