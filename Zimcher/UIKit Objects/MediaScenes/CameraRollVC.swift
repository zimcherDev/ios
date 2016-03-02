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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        let options = PHFetchOptions()
        options.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]


        fetchResult = PHAsset.fetchAssetsWithMediaType(.Image, options: options)
        
        PHPhotoLibrary.sharedPhotoLibrary().registerChangeObserver(self)
        
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fetchResult.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("photoCell", forIndexPath: indexPath) as! PreviewCell
        
        let asset = fetchResult.objectAtIndex(indexPath.row) as! PHAsset
        
        PHImageManager.defaultManager().requestImageForAsset(asset, targetSize: cellSize, contentMode: .AspectFill, options: nil) { image, _ in
            cell.previewImage.image = image
        }
        
        return cell
    }
    
    func photoLibraryDidChange(changeInstance: PHChange) {
        
        let fetchResultArray = fetchResult.copy() as! [PHFetchResult]
        let changes = fetchResultArray
            .map(changeInstance.changeDetailsForFetchResult)
        
        let x = zip(fetchResultArray, changes)
            .map { $0.1 == nil ? $0.0 : $0.1!.fetchResultAfterChanges }
        
        fetchResult = x as! PHFetchResult
        collectionView.reloadData()
    }
}