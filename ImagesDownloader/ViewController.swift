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
    @IBOutlet weak var collectionViewTable: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionViewTable.delegate = self
        self.collectionViewTable.dataSource = self
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        cell.configureCell
        
        return cell
    }
    
    
    
}

