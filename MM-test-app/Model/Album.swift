//
//  Album.swift
//  MM-test-app
//
//  Created by Luciano Schillagi on 25/03/2019.
//  Copyright © 2019 luko. All rights reserved.
//

import UIKit

// model object
struct Album: Decodable {
	let userId: Int
	let id: Int
	let title: String
}
