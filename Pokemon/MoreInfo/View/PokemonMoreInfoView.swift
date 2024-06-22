//
//  PokemonMoreInfoView.swift
//  Pokemon
//
//  Created by Vitor Henrique Barreiro Marinho on 15/05/24.
//

import UIKit

class PokemonMoreInfoView: UIView {
    
    var pokemon: Pokemon? {
        didSet {
            configureViews()
        }
    }
    
    var evolutions: [Pokemon]? {
        didSet {
            configureEvolutionImages()
        }
    }
    
    private var pokemonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private var pokemonDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private var nextEvolutionView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .mainPink
        return view
    }()
    
    private var nextEvolutionTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 0
        label.text = "Next Evolution"
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private var secondEvolutionImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private var thirdEvolutionImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var evolutionStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [secondEvolutionImage,thirdEvolutionImage ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureViews() {
        backgroundColor = .white
        
        addSubViews()
        configureImage()
        pokemonDescriptionLabel.text = pokemon?.description
        configureConstraints()
    }
    
    private func addSubViews() {
        addSubview(pokemonImageView)
        addSubview(pokemonDescriptionLabel)
        addSubview(nextEvolutionView)
        addSubview(nextEvolutionTitle)
        addSubview(evolutionStackView)
    }
    
    private func configureImage() {
        
        guard let imageUrl = pokemon?.imageUrl,
              let url = URL(string: imageUrl) else { return }
        
        pokemonImageView.sd_setImage(with: url)
        
    }
    
    private func configureEvolutionImages() {
        
        if let firstEvolution = evolutions?.first?.imageUrl {
            let url = URL(string: firstEvolution)
            secondEvolutionImage.sd_setImage(with: url)
        }
       
        if let secondEvolution = evolutions?[1].imageUrl {
            let url = URL(string: secondEvolution)
            thirdEvolutionImage.sd_setImage(with: url)
        }
    }
    
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            
            pokemonImageView.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            pokemonImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            pokemonImageView.heightAnchor.constraint(equalToConstant: 60),
            pokemonImageView.widthAnchor.constraint(equalToConstant: 80),
            
            pokemonDescriptionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            pokemonDescriptionLabel.leadingAnchor.constraint(equalTo: pokemonImageView.trailingAnchor, constant: 10),
            pokemonDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            nextEvolutionView.topAnchor.constraint(equalTo: pokemonDescriptionLabel.bottomAnchor, constant: 40),
            nextEvolutionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            nextEvolutionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            nextEvolutionView.heightAnchor.constraint(equalToConstant: 50),
            
            nextEvolutionTitle.centerXAnchor.constraint(equalTo: nextEvolutionView.centerXAnchor),
            nextEvolutionTitle.centerYAnchor.constraint(equalTo: nextEvolutionView.centerYAnchor),
            
            evolutionStackView.topAnchor.constraint(equalTo: nextEvolutionView.bottomAnchor, constant: 10),
            evolutionStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            evolutionStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            secondEvolutionImage.heightAnchor.constraint(equalToConstant: 100),
            
            thirdEvolutionImage.heightAnchor.constraint(equalToConstant: 100),
            
        ])
    }
}
