//
//  MGXStitchImage.swift
//  MGXStitchImage
//
//  Created by Miu on 2019/3/28.
//

import UIKit

public class MGXStitchImage: NSObject {
    static let gap:CGFloat = 4;
    public class func stitchImage(images:Array<UIImage>, size:CGSize, backgroundColor:UIColor) -> UIImage {
        print("0000")
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        backgroundColor.setFill()
        let imageWidth = self.imageWidth(imageCount: images.count, totalWidth: size.width)
        let imageCount = images.count
        if imageCount == 1 {
            images.first?.draw(in: CGRect(origin: CGPoint.zero, size: size))
        }else if imageCount == 2 {
            let y = (size.width - imageWidth)/2
            for index in 0...1 {
                let image = images[index]
                image.draw(in: CGRect(x: gap + (gap + imageWidth) * CGFloat(index) , y: y, width: imageWidth, height: imageWidth))
            }
        }else if imageCount == 3 {
            let firstImage = images.first
            firstImage?.draw(in: CGRect(x: (size.width - imageWidth) * 0.5, y: gap, width: imageWidth, height: imageWidth))
            for index in 1...2 {
                let image = images[index]
                image.draw(in: CGRect(x: gap + (gap + imageWidth) * CGFloat(index - 1), y: gap + (gap + imageWidth), width: imageWidth, height: imageWidth))
            }
        }else if imageCount == 4 || imageCount == 9{
            var rowCount:Int;
            if imageCount == 4 {
                rowCount = 2;
            }else {
                rowCount = 3;
            }
            for index in 0...(imageCount - 1) {
                let row = index/rowCount
                let column = index%rowCount
                let image = images[index]
                image.draw(in: CGRect(x: gap + (gap + imageWidth) * CGFloat(column), y: gap + (gap + imageWidth) * CGFloat(row), width: imageWidth, height: imageWidth))
            }
        }else if imageCount == 5 {
            let x = (size.width - gap - imageWidth * 2)/2;
            for index in 0...1 {
                let image = images[index]
                image.draw(in: CGRect(x: x + (gap + imageWidth) * CGFloat(index), y: x, width: imageWidth, height: imageWidth))
            }
            for index in 2...4 {
                let image = images[index]
                image.draw(in: CGRect(x: gap + (gap + imageWidth) * CGFloat(index - 2), y: x + imageWidth + gap, width: imageWidth, height: imageWidth))
            }
        }else if imageCount == 6 {
            let y = (size.width - gap - imageWidth * 2)/2;
            for index in 0...5 {
                let row = index/3
                let column = index%3
                print("row:\(row)")
                print("column:\(column)")
                let image = images[index]
                image.draw(in: CGRect(x: gap + (gap + imageWidth) * CGFloat(column), y: y + (gap + imageWidth) * CGFloat(row), width: imageWidth, height: imageWidth))
            }
        }else if imageCount == 7 {
            let firstImage = images.first
            let x = gap + imageWidth + gap;
            firstImage?.draw(in: CGRect(x: x, y: gap, width: imageWidth, height: imageWidth))
            for index in 1...6 {
                let row = (index - 1)/3
                let column = (index - 1)%3
                let image = images[index]
                image.draw(in: CGRect(x: gap + (gap + imageWidth) * CGFloat(column), y: x + (gap + imageWidth) * CGFloat(row), width: imageWidth, height: imageWidth))
            }
        }else if imageCount == 8 {
            let x = (size.width - gap - imageWidth * 2)/2;
            for index in 0...1 {
                let image = images[index]
                image.draw(in: CGRect(x: x + (gap + imageWidth) * CGFloat(index), y: gap, width: imageWidth, height: imageWidth))
            }
            for index in 2...7 {
                let row = (index - 2)/3
                let column = (index - 2)%3
                let image = images[index]
                image.draw(in: CGRect(x: gap + (gap + imageWidth) * CGFloat(column), y:gap + (gap + imageWidth) * CGFloat(row + 1), width: imageWidth, height: imageWidth))
            }
        }
        
        let stitchImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return stitchImage!
    }
    
    class func imageWidth(imageCount:Int, totalWidth:CGFloat) -> CGFloat {
        switch imageCount {
        case 1:
            return totalWidth
        case 2...4:
            return (totalWidth - (gap * 3))/2
        case 5...9:
            return (totalWidth - (gap * 4))/3
        default:
            return 0
        }
        
    }
}
