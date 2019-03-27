//
//  AlbumsTableViewController.swift
//  MM-test-app
//
//  Created by Luciano Schillagi on 25/03/2019.
//  Copyright © 2019 luko. All rights reserved.
//

import UIKit
import Alamofire

class AlbumsTableViewController: UITableViewController {
	
	var albums = [Album]()

	override func viewDidLoad() {
		super.viewDidLoad()
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.title = "Albums"
		getAlbums()
	}
	
	private func getAlbums() {

		let getAlbumsEndpoint = "https://jsonplaceholder.typicode.com/albums"
		AF.request(getAlbumsEndpoint).responseJSON { response in

			if let data = response.data {

				do {
					let decoder = JSONDecoder()
					self.albums = try decoder.decode([Album].self, from: data)
					self.tableView.reloadData()

				} catch let jsonErr { print("Failed to decode:",jsonErr) } }
		}
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return albums.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as UITableViewCell
		let album = albums[indexPath.row]
		cell.textLabel?.text = album.title
		cell.detailTextLabel?.text = String(album.id)
		return cell
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let storyboardId = "Photos"
		let controller = storyboard!.instantiateViewController(withIdentifier: storyboardId) as! PhotosTableViewController
		print("La fila seleccionada es la \(indexPath.row)")
		controller.selectedAlbum = albums[(indexPath.row)]
		navigationController!.pushViewController(controller, animated: true)
	}

}
