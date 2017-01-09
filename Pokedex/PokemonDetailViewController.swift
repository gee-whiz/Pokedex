//
//  PokemonDetailViewController.swift
//  Pokedex
//
//  Created by George Kapoya on 2017/01/05.
//  Copyright © 2017 immedia. All rights reserved.
//

import UIKit

class PokemonDetailViewController: UIViewController {

	@IBOutlet weak var lblHeight: UILabel!
	@IBOutlet weak var imgMain: UIImageView!
	@IBOutlet weak var lblAttack: UILabel!

	@IBOutlet weak var lblEvo: UILabel!
	@IBOutlet weak var lblWeight: UILabel!
	@IBOutlet weak var lblPokeDexId: UILabel!
	@IBOutlet weak var lblDefense: UILabel!
	@IBOutlet weak var lblType: UILabel!
	@IBOutlet weak var lblDescreiption: UILabel!
	@IBOutlet weak var lblTitle: UILabel!
	@IBOutlet weak var btnBack: UIButton!
	@IBOutlet weak var lblName: UILabel!
	var pokemon: Pokemon!
    override func viewDidLoad() {
        super.viewDidLoad()


      // lblName.text = pokemon.name
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
