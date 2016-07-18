//
//  RLStickyParallaxHeaderController.swift
//  RLStickyHeaderFlowLayout
//
//  Created by Roy lee on 16/7/17.
//  Copyright © 2016年 Roy lee. All rights reserved.
//

import UIKit

class RLStickyParallaxHeaderController: RLBaseCollectionController {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // config the header
        self.parallaxHeaderReferenceHeight = 426
        self.parallaxHeaderMinimumReferenceHeight = 110
        self.parallaxHeaderAlwaysOnTop = true
        self.disableStickyHeaders = true
        
        // load header
        self.headerNib = UINib.init(nibName: "RLAlwaysOnTopHeader", bundle: NSBundle.mainBundle())
        
        // init data
        for index in 1...5 {
            print("\(index) times 5 is \(index * 5)")
        }
        var data: [String:String] = [:]
        for index in 0..<20 {
            data[String(index)] = "Song "
        }
        self.sections = [data]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView!.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    }
    
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionElementKindSectionHeader {
            
            let header = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "sectionHeader", forIndexPath: indexPath) as? RLSectionHeader
            
            return header!
            
        } else if kind == RLStickyHeaderParallaxHeader {
            let header = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "header", forIndexPath: indexPath)
            
            return header
        }
        
        return UICollectionReusableView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}