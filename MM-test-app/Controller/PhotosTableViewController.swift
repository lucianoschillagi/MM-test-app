//
//  PhotosTableViewController.swift
//  MM-test-app
//
//  Created by Luciano Schillagi on 25/03/2019.
//  Copyright © 2019 luko. All rights reserved.
//

import UIKit
import Alamofire

class PhotosTableViewController: UITableViewController {

	//*****************************************************************
	// MARK: - Properties
	//*****************************************************************
	
	var photos = [Photo]()
	var selectedAlbum: Album?
	
	//*****************************************************************
	// MARK: - VC Life Cycle
	//*****************************************************************
	
	override func viewDidLoad() {
		super.viewDidLoad()
		getAlbumPhotos()
	}
	
	//*****************************************************************
	// MARK: - Networking Methods
	//*****************************************************************
	
	// task: obtener el set de fotos del álbum seleccionado
	private func getAlbumPhotos() {
		
		var selectedAlbumId = Int()
		
		if let selectedAlbum = selectedAlbum {
			selectedAlbumId = selectedAlbum.id
		}
		
		navigationItem.title = String("Album Photos \(selectedAlbumId)")
		
		let getAlbumPhotosEndpoint = "https://jsonplaceholder.typicode.com/photos?albumId=\(selectedAlbumId)"
		
		// http request
		AF.request(getAlbumPhotosEndpoint).responseJSON { response in
			if let data = response.data {
				
				do {
					let decoder = JSONDecoder()
					self.photos = try decoder.decode([Photo].self, from: data)
					self.tableView.reloadData() } catch let jsonErr { print("Failed to decode:",jsonErr) } }
		}
	}
	
	//*****************************************************************
	// MARK: - Table View Data Source Methods
	//*****************************************************************
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return photos.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as UITableViewCell
		let photo = photos[indexPath.row]
		cell.textLabel?.text = photo.title
		cell.detailTextLabel?.text = String(photo.url)
		
		// TODO: AGREGAR LA MINIATURA DE CADA FOTO DEL LISTADO

		return cell
	}
	
	//*****************************************************************
	// MARK: - Table View Delegate Methods
	//*****************************************************************
	
	// task: navegar hacia el album de fotos seleccionado
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let storyboardId = "Photo Detail"
		let controller = storyboard!.instantiateViewController(withIdentifier: storyboardId) as! PhotoDetailViewController
		//controller.selectedLaptop = laptopArray[(indexPath as NSIndexPath).row]
		navigationController!.pushViewController(controller, animated: true)
	}

}
