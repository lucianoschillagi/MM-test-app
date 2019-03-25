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
	2- Get Photos
	*/

	/// Get Albums
	// task: obtener una serie de albunes de fotos
	static func getAlbums() {
		
		// http request
		AF.request(ApiClient.Constants.GetAlbumsEndpoint).responseJSON { response in
			print("Request: \(String(describing: response.request))")   // original url request
			print("Response: \(String(describing: response.response))") // http url response
			print("Result: \(response.result)")                         // response serialization result
			
			if let json = response.result.value {
				print("JSON: \(json)") // serialized json response
			}
			
			if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
				print("Data: \(utf8Text)") // original server data as UTF8 string
			}
		}
	
	}
	

	/// Get Photos
	// task: obtener las fotos de un determinado álbum
	static func getPhotos() {
		
		// http request
		AF.request("https://jsonplaceholder.typicode.com/photos").responseJSON { response in
			print("Request: \(String(describing: response.request))")   // original url request
			print("Response: \(String(describing: response.response))") // http url response
			print("Result: \(response.result)")                         // response serialization result
			
			if let json = response.result.value {
				print("JSON: \(json)") // serialized json response
				
			}
			
			if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
				print("Data: \(utf8Text)") // original server data as UTF8 string
				
			}
			
		}
		
	}



} // end class


