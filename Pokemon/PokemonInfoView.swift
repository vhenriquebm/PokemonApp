//
//  PokemonInfoView.swift
//  Pokemon
//
//  Created by Vitor Henrique Barreiro Marinho on 02/05/24.
//

import UIKit

class PokemonInfoView: UIView {
    
    private lazy var nameContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .mainPink
        view.addSubview(nameLabel)
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Charmander"
        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .red
        return imageView
    }()
    
    private let typeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Type: Fire"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .mainPink
        return label
    }()
    
    private let pokedexIdLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Pokedex Id: 4"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .mainPink
        return label
    }()
    
    private let defenseLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let heightLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Height: 6"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .mainPink
        return label
    }()
    
    private let attackLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let weightLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Weight: 85"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .mainPink
        return label
    }()
    
    private let firstSeparatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray5
        return view
    }()
    
    private let secondSeparatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray5
        return view
    }()
    
    private let thirdSeparatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray5
        return view
    }()
    
    private let fourthSeparatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray5
        return view
    }()
    
    private let moreInfoButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .mainPink
        button.setTitle("View More Info", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.addTarget(PokemonInfoView.self, action: #selector(showMoreInfo), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        layer.masksToBounds = true
        backgroundColor = .white
        
        addSubViews()
        configureConstraints()
    }
    
    private func addSubViews() {
        addSubview(nameContainerView)
        addSubview(imageView)
        addSubview(typeLabel)
        addSubview(defenseLabel)
        addSubview(heightLabel)
        addSubview(pokedexIdLabel)
        addSubview(attackLabel)
        addSubview(weightLabel)
        addSubview(moreInfoButton)
        addSubview(firstSeparatorView)
        addSubview(secondSeparatorView)
        addSubview(thirdSeparatorView)
        addSubview(fourthSeparatorView)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            nameContainerView.topAnchor.constraint(equalTo: topAnchor),
            nameContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            nameContainerView.heightAnchor.constraint(equalToConstant: 50),
            
            nameLabel.centerXAnchor.constraint(equalTo: nameContainerView.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: nameContainerView.centerYAnchor),
            
            imageView.heightAnchor.constraint(equalToConstant: 60),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.topAnchor.constraint(equalTo: nameContainerView.bottomAnchor,constant: 20),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            typeLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            typeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            typeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),

            firstSeparatorView.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 20),
            firstSeparatorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            firstSeparatorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            firstSeparatorView.heightAnchor.constraint(equalToConstant: 1),
            
            pokedexIdLabel.topAnchor.constraint(equalTo: firstSeparatorView.bottomAnchor, constant: 20),
            pokedexIdLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            pokedexIdLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),

            secondSeparatorView.topAnchor.constraint(equalTo: pokedexIdLabel.bottomAnchor, constant: 20),
            secondSeparatorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            secondSeparatorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            secondSeparatorView.heightAnchor.constraint(equalToConstant: 1),
            
            
            heightLabel.topAnchor.constraint(equalTo: secondSeparatorView.bottomAnchor, constant: 20),
            heightLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            heightLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),

            thirdSeparatorView.topAnchor.constraint(equalTo: heightLabel.bottomAnchor, constant: 20),
            thirdSeparatorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            thirdSeparatorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            thirdSeparatorView.heightAnchor.constraint(equalToConstant: 1),
            
            
            
            weightLabel.topAnchor.constraint(equalTo: thirdSeparatorView.bottomAnchor, constant: 20),
            weightLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            weightLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),

            fourthSeparatorView.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: 20),
            fourthSeparatorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            fourthSeparatorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            fourthSeparatorView.heightAnchor.constraint(equalToConstant: 1),

        ])
    }
    
    @objc private func showMoreInfo() {
        
    }
}
