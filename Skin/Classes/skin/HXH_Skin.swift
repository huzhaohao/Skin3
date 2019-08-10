//
//  HXH_Skin.swift
//  HXH_Skin
//
//  Created by huzhaohao on 2019/4/27.
//  Copyright © 2019 huzhaohao. All rights reserved.
//

import UIKit

class HXH_Skin: NSObject {
    
    
    //MARK: -设置皮肤类型
    static var _skinType: NSInteger = 0;
    public static var skinType: NSInteger {
        set{
            _skinType = newValue;
            NotificationCenter.default.post(name: NSNotification.Name("skinType"), object: nil);
        }
        get{
            return _skinType;
        }
    }
    
    /// 根据颜色的key获取对应皮肤类型下的颜色
    ///
    /// - Parameter key: skin**.pist文件里面的key
    /// - Returns: 在某种皮肤下的颜色
   public class func color(key:String) -> UIColor {
        
        let colorStr:String! = self.skinDic().object(forKey: key) as? String;
        let color:UIColor = self.color(withHexString:colorStr as String, andAlpha: 1)!;
        return color;
    }
    
    
    ///根据颜色的key获取对应皮肤类型下的颜色
    ///
    /// - Parameter key: skin**.pist文件里面的key
    /// - Returns: 在某种皮肤下的颜色
    public class func getColorString(key:String) -> String {
        let value:String = self.skinDic().object(forKey: key) as! String;
        return value;
    }
    
    
    /// 根据图片的key获取对应皮肤类型下的图片名
    ///
    /// - Parameter key: skin**.pist文件里面的key
    /// - Returns: 对应皮肤类型下的图片名
    public class func imageName(key: String) -> String? {
        let name = self.skinDic().object(forKey: key) as? String
        return name
    }
    
    //MARK: --- Color方法--------
    class func color(withHexString hexString: String?, andAlpha alpha: Float) -> UIColor? {
        var hexString = hexString
        var col: UIColor?
        hexString = hexString?.replacingOccurrences(of: "#", with: "0x")
        var hexValue: uint = 0
        if (Scanner(string: hexString ?? "")).scanHexInt32(&hexValue) {
            col = self.color(withHex: hexValue, alpha: CGFloat(alpha))
        } else {
            col = UIColor.black
        }
        return col
    }
    class func color(withHex hexValue: uint, alpha alphaValue: CGFloat) -> UIColor? {
        return UIColor(red: CGFloat((Float((hexValue & 0xff0000) >> 16)) / 255.0), green: CGFloat((Float((hexValue & 0xff00) >> 8)) / 255.0), blue: CGFloat((Float(hexValue & 0xff)) / 255.0), alpha: alphaValue)
    }
    

  
    //MARK: --- 私有方法--------
    private static var skinAllDic:NSMutableDictionary = NSMutableDictionary.init();
    private class func skinDic() -> NSDictionary {
        
        let key:String = String.init(format: "skin_%ld",skinType);
        var skinDic:NSDictionary? = skinAllDic.object(forKey: key) as? NSDictionary;
        if(skinDic == nil){
            skinDic = self.loadSkinDic();
            skinAllDic.setObject(skinDic!, forKey: key as NSCopying);
        }
        return skinDic! ;
    }
    
    private class func loadSkinDic() -> NSDictionary {
        var path:String? = Bundle.main.path(forResource: String.init(format: "skin_%ld",skinType), ofType: "plist");
        if(path == nil){
            path = Bundle.main.path(forResource: String.init(format: "skin_%ld",0), ofType: "plist");
            return nil!;
        }else{
            let dic:NSDictionary! = NSDictionary.init(contentsOfFile: path!);
            return dic ;
        }
    }
    
    
}







