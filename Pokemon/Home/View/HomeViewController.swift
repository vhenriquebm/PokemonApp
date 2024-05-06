//
//  ViewController.swift
//  Pokemon
//
//  Created by Vitor Henrique Barreiro Marinho on 29/03/24.
//

import UIKit

class HomeViewController: UICollectionViewController {
    private var pokemons:[Pokemon?] = []
    private var searchBar: UISearchBar?
    
    private var pokemonInfoView: PokemonInfoView = {
        let view = PokemonInfoView()
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var visualEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .dark)
        let view = UIVisualEffectView(effect: blurEffect)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureSearchBar()
        
        let service = PokemonService()
        configureVisualEffectViewConstraints()
        
        
        
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
        
        configureVisualEffectView()
        configureGesture()
    }
    
    private func configureSearchBar() {
        searchBar = UISearchBar()
        searchBar?.sizeToFit()
        searchBar?.showsCancelButton = true
        searchBar?.becomeFirstResponder()
        searchBar?.tintColor = .white
        searchBar?.delegate = self
        
        navigationItem.rightBarButtonItem = nil
        navigationItem.titleView = searchBar
    }
    
    private func configureVisualEffectView() {
        view.addSubview(visualEffectView)
        visualEffectView.alpha = 0
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            
            pokemonInfoView.heightAnchor.constraint(equalToConstant: 500),
            pokemonInfoView.widthAnchor.constraint(equalToConstant: view.frame.width - 64),
            
            pokemonInfoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pokemonInfoView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            
            
        ])
    }
    
    private func configureVisualEffectViewConstraints() {
        NSLayoutConstraint.activate([
            visualEffectView.topAnchor.constraint(equalTo: view.topAnchor),
            visualEffectView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            visualEffectView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            visualEffectView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func configureGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(dismissInfoView))
        
        visualEffectView.addGestureRecognizer(gesture)
        
    }
    
    @objc private func dismissInfoView() {
        dismissWithAnimation()
    }
    
    func dismissWithAnimation(pokemon: Pokemon? = nil) {
        UIView.animate(withDuration: 0.5) {
            self.visualEffectView.alpha = 0
            self.pokemonInfoView.alpha = 0
            self.pokemonInfoView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        } completion: { _ in
            self.pokemonInfoView.removeFromSuperview()
        }
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
        cell.delegate = self
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

//MARK: - HomeColleViewCellDelegate

extension HomeViewController: HomeColleViewCellDelegate {
    
    func presentInfoView(with pokemon: Pokemon) {
        pokemonInfoView.pokemon = pokemon // Defina o pokemon aqui
        
        // Adicione a PokemonInfoView à HomeViewController
        view.addSubview(pokemonInfoView)
        pokemonInfoView.delegate = self
        visualEffectView.alpha = 1
        
        // Configure as restrições após adicionar a PokemonInfoView à HomeViewController
        configureConstraints()
        
        pokemonInfoView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        pokemonInfoView.alpha = 0
        animateInfoView()
    }
    
    private func animateInfoView() {
        UIView.animate(withDuration: 0.5) {
            self.pokemonInfoView.alpha = 1
            self.pokemonInfoView.transform = .identity
        }
    }
}

// MARK: - InfoViewDelegate

extension HomeViewController: InfoViewDelegate {
    
    func dismiss(with pokemon: Pokemon) {
        dismissWithAnimation(pokemon: pokemon)
    }
}

// MARK: - UISearchBarDelegate

extension HomeViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        navigationItem.titleView = nil
        
        let barButton = UIBarButtonItem(barButtonSystemItem: .search,
                                        target: self, action: #selector(search))
        
        barButton.tintColor = .white
        
        navigationItem.rightBarButtonItem =  barButton
    }
}

