//
//  ImagesList.swift
//  QuestionApp1
//
//  Created by output. on 2020/03/08.
//  Copyright © 2020 tomoaki narita. All rights reserved.
//

import Foundation

//ImagesListと付けてクラスを作成
class ImagesList{
    
    //ImagesModelクラスをこのクラスで使えるようにする
    //ImagesModelクラスが入る配列をlistと言う名前で初期化
    var list = [ImagesModel]()
    
    //ImagesListクラスを初期化
    //初期化された時点で以下の記述がImagesListに入る
    init(){
        //listのappend(配列)
        //imageName"0"~"10"まで画像があるので
        //"0"は人間なのでcorrectOrNotはtrue
        list.append(ImagesModel(imageName: "0", correctOrNot: true))
        list.append(ImagesModel(imageName: "1", correctOrNot: false))
        list.append(ImagesModel(imageName: "2", correctOrNot: false))
        list.append(ImagesModel(imageName: "3", correctOrNot: false))
        list.append(ImagesModel(imageName: "4", correctOrNot: true))
        list.append(ImagesModel(imageName: "5", correctOrNot: false))
        list.append(ImagesModel(imageName: "6", correctOrNot: true))
        list.append(ImagesModel(imageName: "7", correctOrNot: true))
        list.append(ImagesModel(imageName: "8", correctOrNot: false))
        list.append(ImagesModel(imageName: "9", correctOrNot: true))
        list.append(ImagesModel(imageName: "10", correctOrNot: true))
        
    }
    
}
