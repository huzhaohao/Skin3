//
//  UIView_Extension.swift
//  HXH_Skin
//
//  Created by huzhaohao on 2019/4/28.
//  Copyright © 2019 huzhaohao. All rights reserved.
//

import Foundation
import UIKit




extension UIView {
    
    struct XKeys {
        static var backGroudcolor_SkinKey : String = "backGroudcolor_SkinKey"
    }
    
    public  var backGroudcolor_SkinKey: String{
        get{
           return objc_getAssociatedObject(self, &XKeys.backGroudcolor_SkinKey) as! String
        }
        set{
            self.backgroundColor = HXH_Skin.color(key: newValue );
             objc_setAssociatedObject(self, &XKeys.backGroudcolor_SkinKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
   @objc public  func skinFresh() -> Void {
        
        if(backGroudcolor_SkinKey.count > 0){
            self.backgroundColor = HXH_Skin.color(key: backGroudcolor_SkinKey);
        }
        for subview in self.subviews {
            subview.skinFresh();
        }
    }
    // .x
    public var x: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            var rect = self.frame
            rect.origin.x = newValue
            self.frame = rect
        }
    }
    
    // .y
    public var y: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            var rect = self.frame
            rect.origin.y = newValue
            self.frame = rect
        }
    }
    
    // .maxX
    public var maxX: CGFloat {
        get {
            return self.frame.maxX
        }
    }
    
    // .maxY
    public var maxY: CGFloat {
        get {
            return self.frame.maxY
        }
    }
    
    // .centerX
    public var centerX: CGFloat {
        get {
            return self.center.x
        }
        set {
            self.center = CGPoint(x: newValue, y: self.center.y)
        }
    }
    
    // .centerY
    public var centerY: CGFloat {
        get {
            return self.center.y
        }
        set {
            self.center = CGPoint(x: self.center.x, y: newValue)
        }
    }
    
    // .width
    public var width: CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            var rect = self.frame
            rect.size.width = newValue
            self.frame = rect
        }
    }
    
    // .height
    public var height: CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            var rect = self.frame
            rect.size.height = newValue
            self.frame = rect
        }
    }
}

extension UILabel {
    struct XKeys {
        static var textColor_SkinKey : String = "textColor_SkinKey"
    }
    public  var textColor_SkinKey: String{
        get{
            return objc_getAssociatedObject(self, &XKeys.textColor_SkinKey) as! String
        }
        set{
            self.textColor = HXH_Skin.color(key: newValue );
            objc_setAssociatedObject(self, &XKeys.textColor_SkinKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
     override  public func skinFresh() -> Void {
        
        if(backGroudcolor_SkinKey.count > 0){
            self.backgroundColor = HXH_Skin.color(key: backGroudcolor_SkinKey);
        }
        if(textColor_SkinKey.count > 0){
            self.textColor = HXH_Skin.color(key: textColor_SkinKey);
        }
    }
}
