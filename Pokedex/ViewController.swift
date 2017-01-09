//
//  ViewController.swift
//  Pokedex
//
//  Created by George Kapoya on 2017/01/05.
//  Copyright © 2017 immedia. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {

	@IBOutlet weak var searchBar: UISearchBar!
	var player = AVAudioPlayer()
	@IBOutlet weak var collectionView: UICollectionView!
	@IBOutlet weak var btnPlay: UIButton!
	var pokemon = [Pokemon]()
	var filteredPokemon  = [Pokemon]()
	var isInSearchMode  = false
	override func viewDidLoad() {
		super.viewDidLoad()

		self.searchBar.showsCancelButton  = true
		self.searchBar.returnKeyType = .done



		parsePokemonCSV()
		initAudio()
	}



	@IBAction func btnPlayTapped(_ sender: UIButton) {
		if  player.isPlaying {
			player.pause()
			sender.alpha = 0.2
		}else{
			player.play()
			sender.alpha  = 1.0
		}
	}

	func initAudio()  {
		let path = Bundle.main.path(forResource: "music", ofType: "mp3")
		do{
			player  = try  AVAudioPlayer(contentsOf: URL(string: path!)!)
			player.prepareToPlay()
			player.numberOfLoops = -1
			player.play()
		}catch{
			print(error)
		}
	}

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		if isInSearchMode {
			return filteredPokemon.count
		}else{
          	return pokemon.count
		}

	}

	func numberOfSections(in collectionView: UICollectionView) -> Int {

		return 1
	}

	func parsePokemonCSV()  {
		let path = Bundle.main.path(forResource: "pokemon", ofType: "csv")
		do {
			let csv = try CSV(contentsOfURL: path!)
			let rows = csv.rows
			for item in rows {
				let pokeId = Int(item["id"]!)
				let name = item["identifier"]
			    pokemon.append(Pokemon(name: name!, pokedexId: pokeId!))
			}
		}catch {
			print(error)
		}
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		 let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokeCell", for: indexPath) as! PokeCell

		let item: Pokemon!

		if isInSearchMode {
			item = filteredPokemon[indexPath.row]
			 cell.configureCell(item)
		}else{
			item = pokemon[indexPath.row]
			 cell.configureCell(item)
		}


		return cell
	}

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

		if segue.identifier == "ShowPokeDetail" {
			if let vc = segue.destination as?  PokemonDetailViewController {
				if let item = sender as? Pokemon {
					vc.pokemon = item
				}
			}
		}

	}

	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let item: Pokemon!
		if isInSearchMode {
			item = filteredPokemon[indexPath.row]
		}else{
			item = pokemon[indexPath.row]
		}


		performSegue(withIdentifier: "ShowPokeDetail", sender: item)

	}


	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 105, height: 105)
	}



	func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
		view.endEditing(true)
	}

	func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
		view.endEditing(true)
	}

	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		view.endEditing(true)
	}

	func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
		if searchBar.text  == nil || searchBar.text == "" {
			isInSearchMode = false
			collectionView.reloadData()
		}else{
			isInSearchMode = true
			let seachedtext = searchText.lowercased()
			filteredPokemon  = pokemon.filter({$0.name.range(of: seachedtext)  != nil})
			collectionView.reloadData()
		}

	}



}

