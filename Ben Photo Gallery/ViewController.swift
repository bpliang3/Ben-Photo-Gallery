//
//  ViewController.swift
//  Ben Photo Gallery
//
//  Created by Ben Liang on 11/11/15.
//  Copyright (c) 2015 Ben Liang. All rights reserved.
//

import UIKit
import Photos

let reuseIdentifier = "PhotoCell"
let albumName = "My App"

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var assetCollection: PHAssetCollection!
    var photosAsset: PHFetchResult!
    var albumFound: Bool = false
    
    // Actions and Outlets
    
    @IBAction func btnCamera(sender: AnyObject) {
        println("Camera was pushed")
    }
    
    @IBAction func btnPhotoAlbum(sender: AnyObject) {
        println("Photo Album was pushed")
    }
      
    @IBOutlet var CollectionView: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let fetchOptions = PHFetchOptions()
        fetchOptions.predicate = NSPredicate(format: "title = %@", albumName)
        
        // Check if the folder exists, if not, create
        let collection = PHAssetCollection.fetchAssetCollectionsWithType(.Album, subtype: .Any, options: fetchOptions)
        
        if collection.firstObject != nil {
            // found the album
            self.albumFound = true
            self.assetCollection = collection.firstObject as! PHAssetCollection // would have problems if user has multiple album folders named "My App"
        } else {
            // create the folder
            NSLog("\nFolder \"$@\" does not exist\n Creating now...", albumName)
            PHPhotoLibrary.sharedPhotoLibrary().performChanges({
                let request = PHAssetCollectionChangeRequest.creationRequestForAssetCollectionWithTitle(albumName)
                }, completionHandler: {(success:Bool, error:NSError!)in
                    NSLog("Creation of folder -> %@", (success ? "Success" : "Error!"))
                    self.albumFound = (success ? true:false)
                })
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // UICollectionViewDataSource Methods
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: UICollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! UICollectionViewCell
        
        //Modify the Cell
        cell.backgroundColor = UIColor.blueColor()
        
        return cell
    }


}

