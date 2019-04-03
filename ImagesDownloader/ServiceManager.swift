//
//  ServiceManager.swift
//  ImagesDownloader
//
//  Created by Consultant on 4/3/19.
//  Copyright © 2019 JuanVitela. All rights reserved.
//

import Foundation

class ServiceManager {
    static let shared = ServiceManager ()
    private init() { }
    
    
    func downloadImages(url : String, completion : @escaping (Data) -> ()) -> Bool {
        
        guard let urlString = URL(string: url) else { return false }
        
        let dataTask  = URLSession.shared.dataTask(with: urlString) { (data, response, error) in
            if let error = error {
                print("Error in the download \(error.localizedDescription)")
                return
            }else{
                if let safeData = data {
                    print("Successfully received data")
                    completion(safeData)
                }
                
            }
        }
        
        dataTask.resume()
        return true
    }
}
