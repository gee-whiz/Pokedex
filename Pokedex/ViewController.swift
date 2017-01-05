//
//  ViewController.swift
//  Pokedex
//
//  Created by George Kapoya on 2017/01/05.
//  Copyright © 2017 immedia. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {


	var player = AVAudioPlayer()

	@IBOutlet weak var collectionView: UICollectionView!

	@IBOutlet weak var btnPlay: UIButton!
	var pokemon = [Pokemon]()
	override func viewDidLoad() {
		super.viewDidLoad()

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
		return pokemon.count
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
//           self.collectionView.reloadData()
		}catch {
			print(error)
		}
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		 let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokeCell", for: indexPath) as! PokeCell
         let item = pokemon[indexPath.row]
		 cell.configureCell(item)

		return cell
	}




	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 105, height: 105)
	}



}

