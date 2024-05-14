//
//  PokemonInfoViewController.swift
//  Pokemon
//
//  Created by Vitor Henrique Barreiro Marinho on 09/05/24.
//

import UIKit

class PokemonMoreInfoViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureConstraints()
    }
    
    private var pokemonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private var pokemonDescriptionLabel: UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "This pokemon is the strongest This pokemon is the strongestThis pokemon is the strongestThis pokemon is the strongestThis pokemon is the strongestThis pokemon is the strongestThis pokemon is the strongestThis pokemon is the strongest"
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }
    
    private var nextEvolutionView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .mainPink
        return view
    }()
    
    private func configureView() {
        view.addSubview(pokemonImageView)
        view.addSubview(pokemonDescriptionLabel)
        view.addSubview(nextEvolutionView)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
        
            pokemonImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            pokemonImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            pokemonImageView.heightAnchor.constraint(equalToConstant: 100),
            pokemonImageView.widthAnchor.constraint(equalToConstant: 100),

            pokemonDescriptionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            pokemonImageView.leadingAnchor.constraint(equalTo: pokemonImageView.trailingAnchor),
            pokemonImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}


