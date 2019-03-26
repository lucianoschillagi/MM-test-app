//
//  ApiClient.swift
//  MM-test-app
//
//  Created by Luciano Schillagi on 25/03/2019.
//  Copyright © 2019 luko. All rights reserved.
//


import Foundation
import Alamofire

/* Abstract
Un objeto que contiene los métodos para interactuar con la API.
*/

class ApiClient: NSObject {

	//*****************************************************************
	// MARK: - Initializer
	//*****************************************************************

	override init() { super.init() }

	//*****************************************************************
	// MARK: - Properties
	//*****************************************************************

	var session = URLSession.shared

	//*****************************************************************
	// MARK: - Networking Methods
	//*****************************************************************

	/*
	TASKS:
	1- Get Albums
	2- Get Album Photos
	3- Get Photos Images
	*/

	/// Get Albums
	// task: obtener una serie de albunes de fotos
	static func getAlbums(completionHandlerForGetAlbums: @escaping (_ success: Bool, _ result: [Album]?, _ error: String?) -> Void) {
		

	}
	
	
	/// Get Album Photos
	// task: obtener las fotos de un determinado álbum
	static func getAlbumPhotos() {
		
//		// http request
//		AF.request("https://jsonplaceholder.typicode.com/photos").responseJSON { response in
//			print("Request: \(String(describing: response.request))")   // original url request
//			print("Response: \(String(describing: response.response))") // http url response
//			print("Result: \(response.result)")                         // response serialization result
//
//			if let json = response.result.value {
//				print("JSON: \(json)") // serialized json response
//
//			}
//
//			if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
//				print("Data: \(utf8Text)") // original server data as UTF8 string
//
//			}
//
//		}
		
	}

	
	/// Get Photos Images
	// task: obtener las imagenes de las fotos
	static func getPhotosImages() {

		
		
		
		
	}



} // end class


