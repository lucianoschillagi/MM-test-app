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
	
	var selectedAlbum: Album?
	var photos = [Photo]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		getAlbumPhotos()
	}
	
	private func getAlbumPhotos() {
		var selectedAlbumId = Int()
		if let selectedAlbum = selectedAlbum {
			selectedAlbumId = selectedAlbum.id
		}
		
		navigationItem.title = "Album: \(selectedAlbum!.title)"
		let getAlbumPhotosEndpoint = "https://jsonplaceholder.typicode.com/photos?albumId=\(selectedAlbumId)"
		
		AF.request(getAlbumPhotosEndpoint).responseJSON { response in
			if let data = response.data {
				
				do {
					let decoder = JSONDecoder()
					self.photos = try decoder.decode([Photo].self, from: data)
					self.tableView.reloadData() } catch let jsonErr { print("Failed to decode:",jsonErr) } }
				}
		}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return photos.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
		let photo = photos[indexPath.row]
		let preImage = UIImage(named: "preImage")
		cell.imageView?.image = preImage
		cell.textLabel?.text = photo.title
		
		AF.request(photo.thumbnailUrl).responseJSON { response in
			if let data = response.data {
				cell.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
				cell.imageView?.image = UIImage(data: data)
			}
		}
		return cell
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let storyboardId = "Photo Detail"
		let controller = storyboard!.instantiateViewController(withIdentifier: storyboardId) as! PhotoDetailViewController
		controller.selectedPhoto = photos[(indexPath.row)]
		navigationController!.pushViewController(controller, animated: true)
	}

}
