//
//  IconFont.swift
//  IconFont
//
//  Created by midmirror on 16/7/5.
//  Copyright © 2016年 midmirror. All rights reserved.
//

import Foundation
import UIKit

open class IconFont: NSObject {
    
    open var code: String = ""
    open var fontName: String = ""
    var attributes = [String : AnyObject]()
    var color = UIColor()
    
    public init(code: String, size: CGFloat, fontName:String, color: UIColor) {
        self.code = code
        self.fontName = fontName
        self.attributes = [String : AnyObject]()
        self.attributes[NSParagraphStyleAttributeName] = NSMutableParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle
        
        // 使用代码注册字体、或者用 info.plist注册字体
        let font = UIFont.init(name: fontName, size: size)
        
        self.attributes[NSFontAttributeName] = font
        self.attributes[NSForegroundColorAttributeName] = color
        self.color = color
    }
    
    /** 将字体渲染成图片 */
    open func image(_ size: CGSize)->UIImage {
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        let context = UIGraphicsGetCurrentContext()
        
        let textRect  = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        context?.setFillColor(self.color.cgColor)
        let fontCode = code as NSString
        fontCode.draw(in: textRect, withAttributes: self.attributes)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
    
    /** 返回一张正方形图片 */
    open func imageSquare(_ width: CGFloat) -> UIImage {
        
        return self.image(CGSize(width: width, height: width))
    }
}


/** 如果在 info.plist 中增加 Fonts provided by application这一项，并注册字体就不用这里的代码 */
open class IconFontLoader {
    
    static let shared = IconFontLoader()
    
    /** 载入字体文件 */
    public class func loadFont(fontName: String, size: CGFloat) -> UIFont {
        let name = fontName.components(separatedBy: ".").first!
        if UIFont(name: name, size: size) == nil {
            registerFont(fontName)
        }
        return UIFont(name: name, size: size)!
    }
    
    /** 注册字体 */
    class func registerFont(_ fontName: String) {
        
        let fontPath = Bundle.main.path(forResource: fontName, ofType: nil)
        
        let fileHandle : FileHandle = FileHandle(forReadingAtPath: fontPath!)!
        let data : Data = fileHandle.readDataToEndOfFile()
        
        let provider = CGDataProvider(data: data as CFData)
        let font = CGFont(provider!)
        
        var error: Unmanaged<CFError>?
        if !CTFontManagerRegisterGraphicsFont(font, &error) {
            let errorDescription: CFString = CFErrorCopyDescription(error!.takeUnretainedValue())
            let nsError = error!.takeUnretainedValue() as AnyObject as! NSError
            NSException(name: NSExceptionName.internalInconsistencyException, reason: errorDescription as String, userInfo: [NSUnderlyingErrorKey: nsError]).raise()
        }
    }
}
