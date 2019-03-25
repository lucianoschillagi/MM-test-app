//
//  ModelObjects.swift
//  MM-test-app
//
//  Created by Luciano Schillagi on 25/03/2019.
//  Copyright © 2019 luko. All rights reserved.
//

/* Model */

import UIKit

/* Abstract:
Los objetos del modelo: álbum y foto.
*/

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

