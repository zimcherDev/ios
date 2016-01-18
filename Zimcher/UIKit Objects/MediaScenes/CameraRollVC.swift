//
//  CameraRollVC.swift
//  Zimcher
//
//  Created by Weiyu Huang on 1/9/16.
//  Copyright © 2016 Zimcher. All rights reserved.
//

import UIKit
import Photos

class CameraRollVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet weak var downButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var datasource = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let cellSize = (collectionView.collectionViewLayout as! UICollectionViewFlowLayout).itemSize
        
        let options = PHFetchOptions()
        options.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]


        let assets = PHAsset.fetchAssetsWithMediaType(.Image, options: options)
        
        datasource.removeAll()
        assets.enumerateObjectsUsingBlock { asset, idx, stop in
        PHImageManager.defaultManager().requestImageForAsset(asset as! PHAsset, targetSize: cellSize, contentMode: .AspectFill, options: nil)  { image, dict in
            
            guard let img = image else {
                print(dict)
                return
            }
            
            self.datasource.append(img)
            self.collectionView.reloadData()
    }
}
        
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("photoCell", forIndexPath: indexPath) as! PreviewCell
        
        cell.previewImage.image = datasource[indexPath.row]
        
        return cell
    }
}