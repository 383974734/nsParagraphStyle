//
//  ViewController.swift
//  view
//
//  Created by SunTing on 2017/8/31.
//  Copyright © 2017年 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        attributedStringS()
    }
    
    
    func attributedString() {
        let label = UILabel(frame: CGRect(x: 0 , y: 0, width: UIScreen.main.bounds.size.width, height: 200))
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.textAlignment = NSTextAlignment.center
        view.addSubview(label)
        let str = "我是一个尝试的文字"
        let attributedString = NSMutableAttributedString(string: str)
        //设置字体大小NSFontAttributeName
        attributedString.addAttribute(NSFontAttributeName, value: UIFont.systemFont(ofSize: 30), range: NSMakeRange(2, 3))
        //设置文字颜色
        attributedString.addAttribute(NSForegroundColorAttributeName, value: UIColor.red, range: NSMakeRange(7, 2))
        //设置文字背景颜色
        attributedString.addAttribute(NSBackgroundColorAttributeName, value: UIColor.orange.withAlphaComponent(0.5), range: NSMakeRange(0, 9))
        //设置文字之间的间距
        attributedString.addAttribute(NSKernAttributeName, value: 14, range: NSMakeRange(0, 6))

        label.attributedText = attributedString


    }
    
    func attributedStringS() {
        let labels = UILabel(frame: CGRect(x: 0 , y: 30, width: UIScreen.main.bounds.size.width, height: 200))
        labels.font = UIFont.systemFont(ofSize: 60)
        view.addSubview(labels)
        
        let str = "点击屏幕"
        let dicS = [NSForegroundColorAttributeName : UIColor.red,//文字颜色
            NSStrikethroughStyleAttributeName: 1,//删除线宽度
            NSFontAttributeName : UIFont(name: "Zapfino", size: 16.0)!] as [String : Any]//字体
        let attributedString = NSMutableAttributedString(string: str, attributes: dicS)
        attributedString.setAttributes(dicS, range:NSMakeRange(0, 3))
        labels.attributedText = attributedString
        
    }
    
    //循环显示所有字体
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //整理出来的字体数组
        let array = ["Zapfino", "Verdana-Italic", "Verdana", "Verdana-BoldItalic", "Verdana-Bold", "TrebuchetMS-Bold", "Trebuchet-BoldItalic", "TrebuchetMS", "TrebuchetMS-Italic", "TimesNewRomanPS-ItalicMT", "TimesNewRomanPS-BoldItalicMT", "TimesNewRomanPS-BoldMT", "TimesNewRomanPSMT", "STHeitiTC-Medium", "STHeitiTC-Light", "STHeitiSC-Light", "STHeitiSC-Medium", "MarkerFelt-Thin", "HiraKakuProN-W3", "HelveticaNeue-Bold", "HelveticaNeue", "Helvetica-Bold", "Helvetica", "Helvetica-BoldOblique", "Helvetica-Oblique", "Georgia-Italic", "Georgia-BoldItalic", "Georgia", "Georgia-Bold", "DBLCDTempBlack", "CourierNewPSMT", "CourierNewPS-BoldItalicMT", "CourierNewPS-ItalicMT", "CourierNewPS-BoldMT", "Courier-Bold", "Courier-Oblique", "Courier-BoldOblique", "ArialRoundedMTBold", "Arial-ItalicMT", "Arial-BoldItalicMT", "Arial-BoldMT", "ArialMT", "AppleGothic", "AmericanTypewriter-Bold", "AmericanTypewriter"]
        //STHeitiK-Medium//STHeitiK-Light//STHeitiJ-Light, "STHeitiJ-Medium", "Courier",, "ArialUnicodeMS"-------------------这些字体是显示出出来的
        //如果所有的字体都显示了   就不在从新添加了
        if index == array.count {
            return
        }
        
        //初始化一个显示字体的label（我这个方法不是最好的   如果写一个tableview展示会方便一些）
        let labels  = UILabel(frame: CGRect(x: 0 , y: index * 15 + 30, width: Int(UIScreen.main.bounds.size.width), height: 15))
        labels.textAlignment = NSTextAlignment.center//居中
        view.addSubview(labels)//添加
        
        let dicS = [NSForegroundColorAttributeName : UIColor.randomColor,//文字颜色
            NSStrikethroughStyleAttributeName: 1,//删除线宽度
            NSFontAttributeName : UIFont(name: array[index], size: 8.0)!] as [String : Any]//字体
        
        //初始化富文本
        let attributedString = NSMutableAttributedString(string: "字体--\(array[index])--", attributes: dicS)
        
        attributedString.setAttributes(dicS, range:NSMakeRange(0, 1))

        labels.attributedText = attributedString
        
        index += 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
}

extension UIColor {
    //返回随机颜色
    class var randomColor: UIColor {
        get {
            let red = CGFloat(arc4random()%256)/255.0
            let green = CGFloat(arc4random()%256)/255.0
            let blue = CGFloat(arc4random()%256)/255.0
            return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        }
    }
}

