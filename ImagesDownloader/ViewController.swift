//
//  ViewController.swift
//  ImagesDownloader
//
//  Created by Consultant on 4/3/19.
//  Copyright © 2019 JuanVitela. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var imagesArray = [Data]()
    var downloadManager = ServiceManager.shared
    let reuseIdentifier = "CustomCollectionViewCell"
    @IBOutlet weak var collectionViewTable: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        downloadImages()
        
        
    }
    
    func setupCollectionView()  {
        self.collectionViewTable.delegate = self
        self.collectionViewTable.dataSource = self
        
        let cellNib = UINib(nibName: "CustomCollectionViewCell", bundle: nil)
        self.collectionViewTable.register(cellNib, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    func downloadImages() {
        let completion = { [unowned self] (newImage: Data) in
            DispatchQueue.main.async { [unowned self] in
                self.imagesArray.append(newImage)
                self.collectionViewTable.reloadData()
            }
        }
        self.downloadManager.downloadImages(url: "https://pokeapi.co/api/v2/pokemon/hitmontop", completion: completion)
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as! CustomCollectionViewCell
        let imageData = self.imagesArray[indexPath.row]
        cell.configureCell(imageData: imageData)
        
        return cell
    }
    
    
    
}

