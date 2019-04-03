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
    
    
    func downloadImages(url : String) -> Bool {
        
        guard let urlString = URL(string: url) else { return false }
        
        URLSession.shared.dataTask(with: urlString) { (data, response, error) in
            if let error = error {
                print("Error in the download \(error.localizedDescription)")
            }else{
                if let data = data {
                    
                }
                
            }
        }
        return true
    }
}
