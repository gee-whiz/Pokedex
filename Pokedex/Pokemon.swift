//
//  Pokemon.swift
//  Pokedex
//
//  Created by George Kapoya on 2017/01/05.
//  Copyright © 2017 immedia. All rights reserved.
//

import Foundation


class Pokemon {

	fileprivate var _name:String!
	fileprivate var _pokedexId: Int!


	var name:String {
		return _name
	}

	var pokedexId:Int {
		return _pokedexId
	}

	init(name: String, pokedexId: Int) {

		self._name = name
		self._pokedexId = pokedexId
	}



}
