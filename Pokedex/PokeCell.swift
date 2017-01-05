//
//  PokeCell.swift
//  Pokedex
//
//  Created by George Kapoya on 2017/01/05.
//  Copyright © 2017 immedia. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
	@IBOutlet weak var lblName: UILabel!
	@IBOutlet weak var thumbImg: UIImageView!
	var pokemon: Pokemon!



	func configureCell(pokemon: Pokemon)  {
	    self.pokemon = pokemon
		lblName.text = self.pokemon.name
		thumbImg.image = UIImage(named: "\(self.pokemon.pokedexId)")
	}




}
