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

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		layer.cornerRadius = 5.0
	}


	func configureCell(_ pokemon: Pokemon)  {
	    self.pokemon = pokemon
		lblName.text = self.pokemon.name
		thumbImg.image = UIImage(named: "\(self.pokemon.pokedexId)")
	}




}
