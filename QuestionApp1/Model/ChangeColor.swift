//
//  ChangeColor.swift
//  QuestionApp1
//
//  Created by output. on 2020/03/09.
//  Copyright © 2020 tomoaki narita. All rights reserved.

//値を入れるとグラデーションがかかるクラスを作成

import Foundation
//色を使うのでUIKitをインポートする
import UIKit
//ChangeColorとつけてクラスを作成
class ChangeColor{
    
    //changeColorにRGB(3原色)の引数をつける
    //データ型はCGFloat
    //->CAGradientLayerはレイヤーを返すと言う意味
    func changeColor(topR:CGFloat,topG:CGFloat,topB:CGFloat,topAlpha:CGFloat,bottomR:CGFloat,bottomG:CGFloat,bottomB:CGFloat,bottomAlpha:CGFloat)->CAGradientLayer{
        
        //グラデーションの開始色(top)
        let topColor = UIColor(red:topR , green:topG , blue:topB , alpha: topAlpha)
        
        //グラデーションの開始色(bottom)
        let bottomColor = UIColor(red:bottomR , green:bottomG , blue:bottomB , alpha: bottomAlpha)
        
        //グラデーションの色を配列で管理する
        let gradientColor = [topColor.cgColor,bottomColor.cgColor]
        
        //CAGradientLayerをgradientLayerとして初期化
        let gradientLayer = CAGradientLayer()
       
        //gradientLayerのcolorsにgradientColor(配列)を入れる
        gradientLayer.colors = gradientColor
        
        //gradientLayerを返す
        return gradientLayer
   
    }
    
}
