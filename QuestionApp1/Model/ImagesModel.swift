//
//  ImagesModel.swift
//  QuestionApp1
//
//  Created by output. on 2020/03/08.
//  Copyright © 2020 tomoaki narita. All rights reserved.
//

import Foundation

//ImagesModelと付けてクラスを作成
class ImagesModel{
    
    //画像名を取得して、その画像名が人間かそうでないかをフラグによって判定するための機能
    //imageText(定数)をString型で宣言
    let imageText:String
    
    //answer(定数)をBool型で宣言
    let answer:Bool
    
    //ImagesModelをイニシャライズ(初期化)
    init(imageName:String,correctOrNot:Bool){
        
        //imageTextの中にimageName(外部引数)を入れる
        imageText = imageName
        
        //answerの中にcorrectOrNot(外部引数)を入れる
        answer = correctOrNot
        
    }
}
