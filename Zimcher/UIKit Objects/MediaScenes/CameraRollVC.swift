//
//  CameraRollVC.swift
//  Zimcher
//
//  Created by Weiyu Huang on 1/9/16.
//  Copyright © 2016 Zimcher. All rights reserved.
//

import UIKit
import Photos

class CameraRollVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, PHPhotoLibraryChangeObserver {
    @IBOutlet weak var downButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var cellSize:CGSize {
        return (collectionView.collectionViewLayout as! UICollectionViewFlowLayout).itemSize
    }
    
    var fetchResult: PHFetchResult!
    
    var datasource: [UIImage] {
        var data = [UIImage]()
        fetchResult.enumerateObjectsUsingBlock { asset, idx, stop in
        PHImageManager.defaultManager().requestImageForAsset(asset as! PHAsset, targetSize: self.cellSize, contentMode: .AspectFill, options: nil)  { image, dict in
            
            guard let img = image else {
                print(dict)
                return
            }
            
            data.append(img)
            self.collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        let options = PHFetchOptions()
        options.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]


        fetchResult = PHAsset.fetchAssetsWithMediaType(.Image, options: options)
        
        }
        
        PHPhotoLibrary.sharedPhotoLibrary().registerChangeObserver(self)
        
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
    
    func photoLibraryDidChange(changeInstance: PHChange) {
        
        fetchResult.enumerateObjectsUsingBlock { result, _, _ in
            guard let change = changeInstance.changeDetailsForFetchResult(result as! PHFetchResult) else { return }
            
            
            
        }
    }
}