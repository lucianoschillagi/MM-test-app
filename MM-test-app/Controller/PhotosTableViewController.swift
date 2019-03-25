//
//  PhotosTableViewController.swift
//  MM-test-app
//
//  Created by Luciano Schillagi on 25/03/2019.
//  Copyright © 2019 luko. All rights reserved.
//

import UIKit

class PhotosTableViewController: UITableViewController {

	//*****************************************************************
	// MARK: - Fake Model
	//*****************************************************************
	
	//	var protoModel: [[String:Any]] = [["userId": 1, "id": 1, "title": "quidem molestiae enim"],
	//																		["userId": 1, "id": 2, "title": "sunt qui excepturi placeat culpa"],
	//																		["userId": 1, "id": 3, "title": "omnis laborum odio"]]
	
	let data = ["data 1", "data 2", "data 3", "data 4"]
	
	//*****************************************************************
	// MARK: - VC Life Cycle
	//*****************************************************************
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		navigationItem.title = "Photos"
	}
	
	override func viewWillAppear(_ animated: Bool) {
		self.navigationController?.navigationBar.prefersLargeTitles = true
	}
	
	//*****************************************************************
	// MARK: - Table View Data Source Methods
	//*****************************************************************
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return data.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
		cell.textLabel?.text = data[indexPath.row]
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
