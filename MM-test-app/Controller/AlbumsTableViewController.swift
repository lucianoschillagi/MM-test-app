//
//  AlbumsTableViewController.swift
//  MM-test-app
//
//  Created by Luciano Schillagi on 25/03/2019.
//  Copyright © 2019 luko. All rights reserved.
//

import UIKit

class AlbumsTableViewController: UITableViewController {
	
	var albums = [Album]()
	
	//*****************************************************************
	// MARK: - VC Life Cycle
	//*****************************************************************

    override func viewDidLoad() {
        super.viewDidLoad()

				navigationController?.navigationBar.prefersLargeTitles = true
      	navigationItem.title = "Albums"
			
				// networking
			//ApiClient.getAlbums()
			
			fetchJSON()
			
    }
	
	fileprivate func fetchJSON() {
		
		let urlString = "https://jsonplaceholder.typicode.com/albums"
	
		guard let url = URL(string: urlString) else { return }
		
		URLSession.shared.dataTask(with: url) { (data, _, err)  in
			DispatchQueue.main.async {
				if let err = err {
					print ("Failed to get data from url:", err)
					return
				}
				
				guard let data = data else { return }
				print(data)
				
				do {
					let decoder = JSONDecoder()
					self.albums = try decoder.decode([Album].self, from: data)
					self.tableView.reloadData()
					
				} catch let jsonErr {
					print("Failed to decode:",jsonErr)
					
				}
				
			}
		}.resume()
		
	}
	
	
	
	
	//*****************************************************************
	// MARK: - Table View Data Source Methods
	//*****************************************************************

		override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
			return albums.count
		}
	
		override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
			let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as UITableViewCell
			let album = albums[indexPath.row]
			cell.textLabel?.text = album.title
			cell.detailTextLabel?.text = String(album.id)
			
			for album in albums {
				print(album.title)
			}
		
			return cell
		}
	
	//*****************************************************************
	// MARK: - Table View Delegate Methods
	//*****************************************************************
		
		// task: navegar hacia el album de fotos seleccionado
		override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
			let storyboardId = "Photos"
			let controller = storyboard!.instantiateViewController(withIdentifier: storyboardId) as! PhotosTableViewController
			//controller.selectedLaptop = laptopArray[(indexPath as NSIndexPath).row]
			navigationController!.pushViewController(controller, animated: true)
		}

}
