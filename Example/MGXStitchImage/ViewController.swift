//
//  ViewController.swift
//  MGXStitchImage
//
//  Created by 329735967@qq.com on 03/28/2019.
//  Copyright (c) 2019 329735967@qq.com. All rights reserved.
//

import UIKit
import MGXStitchImage
class ViewController: UIViewController {

    
    @IBOutlet var imageViews: [UIImageView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var images = [UIImage]()
        for index in 0..<imageViews!.count {
            let image = UIImage(named: "\(index + 1)")
            images.append(image!)
            let imageView = imageViews[index]
            imageView.backgroundColor = UIColor.lightGray
            imageView.image = MGXStitchImage.stitchImage(images: images, size: imageView.frame.size,backgroundColor: UIColor.init(white: 0.8, alpha: 1.0))
        }
    }



}

