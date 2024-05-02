//
//  ViewController.swift
//  Pokemon
//
//  Created by Vitor Henrique Barreiro Marinho on 29/03/24.
//

import UIKit

class HomeViewController: UICollectionViewController {
    private var pokemons:[Pokemon?] = []
    
    private var pokemonInfoView: PokemonInfoView = {
        let view = PokemonInfoView()
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        
        let service = PokemonService()
        
        
        service.getPokemons { result in
            switch result {
            case let .success(pokemonData):
                
                DispatchQueue.main.async {
                    self.pokemons = pokemonData
                    self.collectionView.reloadData()
                }
                
            case let .failure(error):
                print ("DEBUG - Error to fetch pokemons: \(error.localizedDescription)")
            }
        }
        
    }
    
    
    private func configureView() {
        configureNavigationBar()
        
        collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
        
        view.addSubview(pokemonInfoView)
        configureConstraints()
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            
            pokemonInfoView.heightAnchor.constraint(equalToConstant: 500),
            pokemonInfoView.widthAnchor.constraint(equalToConstant: view.frame.width - 64),
            
            pokemonInfoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pokemonInfoView.centerYAnchor.constraint(equalTo: view.centerYAnchor)

        ])
    }
    
    private func configureNavigationBar() {
        navigationItem.title = "Pokedex"
        
        let barButton = UIBarButtonItem(barButtonSystemItem: .search,
                                        target: self, action: #selector(search))
        
        barButton.tintColor = .white
        
        navigationItem.rightBarButtonItem =  barButton
        
    }
    
    
    
    @objc private func search() {
        
    }
}

extension HomeViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as! HomeCollectionViewCell
        
        let pokemon = pokemons[indexPath.row + 1]
        cell.configure(pokemon: pokemon)
        
        
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (collectionView.frame.size.width / 3) - 12
        
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 4, bottom: 1, right: 4)
    }
}
