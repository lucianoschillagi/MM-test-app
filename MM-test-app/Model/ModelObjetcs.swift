//
//  ModelObjects.swift
//  MM-test-app
//
//  Created by Luciano Schillagi on 25/03/2019.
//  Copyright © 2019 luko. All rights reserved.
//

import UIKit

struct Album: Decodable {
	let id: Int
	let title: String
}

struct Photo: Decodable {
	let albumId: Int
	let title: String
	let url: String
	let thumbnailUrl: String
}

