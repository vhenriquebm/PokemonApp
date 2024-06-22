//
//  PokemonInfoViewController.swift
//  Pokemon
//
//  Created by Vitor Henrique Barreiro Marinho on 09/05/24.
//

import UIKit

class PokemonMoreInfoViewController: BaseViewController {
    private var pokemon: Pokemon?
    private var evolutions: [Pokemon]?
    
    private var pokemonMoreInfoView: PokemonMoreInfoView = {
        let view = PokemonMoreInfoView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configureViews() {
        view.addSubview(pokemonMoreInfoView)
    }
    
    override func configureConstraints() {
        NSLayoutConstraint.activate([
            pokemonMoreInfoView.topAnchor.constraint(equalTo: view.topAnchor),
            pokemonMoreInfoView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pokemonMoreInfoView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pokemonMoreInfoView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}


