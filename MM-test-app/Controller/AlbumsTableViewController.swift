//
//  AlbumsTableViewController.swift
//  MM-test-app
//
//  Created by Luciano Schillagi on 25/03/2019.
//  Copyright © 2019 luko. All rights reserved.
//

import UIKit

class AlbumsTableViewController: UITableViewController {
	
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

      	navigationItem.title = "Albums"
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

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
