//
//  PhotoDetailViewController.swift
//  MM-test-app
//
//  Created by Luciano Schillagi on 25/03/2019.
//  Copyright © 2019 luko. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

	//*****************************************************************
	// MARK: - VC Life Cycle
	//*****************************************************************
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func viewWillAppear(_ animated: Bool) {
		self.navigationController?.navigationBar.prefersLargeTitles = false
	}
	
	

}

