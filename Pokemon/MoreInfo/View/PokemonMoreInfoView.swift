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
    
    private var pokemonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var pokemonDescriptionLabel: UILabel = {
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
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureViews() {
        backgroundColor = .white
        addSubview(pokemonImageView)
        addSubview(pokemonDescriptionLabel)
        addSubview(nextEvolutionView)
        
        print ("DEBUG - O pokemon na more info é \(pokemon)")
        
        
        configureImage(with: pokemon?.imageUrl)
        pokemonDescriptionLabel.text = pokemon?.description
        
        
        
        configureConstraints()
        
    }
    
    private func configureImage(with urlString: String?) {
        guard let imageUrl = urlString,
              let url = URL(string: imageUrl) else { return }
        
        pokemonImageView.sd_setImage(with: url)
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
            nextEvolutionView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
