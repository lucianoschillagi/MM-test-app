//
//  PhotoDetailViewController.swift
//  MM-test-app
//
//  Created by Luciano Schillagi on 25/03/2019.
//  Copyright © 2019 luko. All rights reserved.
//

import UIKit
import Alamofire

class PhotoDetailViewController: UIViewController {

	//*****************************************************************
	// MARK: - Properties
	//*****************************************************************
	
	var selectedPhoto: Photo?
	
	//*****************************************************************
	// MARK: - IBOutlets
	//*****************************************************************

	@IBOutlet weak var photoDetail: UIImageView!
	
	//*****************************************************************
	// MARK: - VC Life Cycle
	//*****************************************************************
	
	override func viewDidLoad() {
		super.viewDidLoad()
		navigationItem.title = selectedPhoto?.title

		// networking 🚀
		// task: obtener la imagen de minitura de la foto
		AF.request((selectedPhoto?.url)!).responseJSON { response in
			if let data = response.data {
				self.photoDetail.contentMode = UIView.ContentMode.scaleAspectFit
				self.photoDetail.image = UIImage(data: data)
			}
		}

	}

}

