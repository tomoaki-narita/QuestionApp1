//
//  WithOutMP3.swift
//  QuestionApp1
//
//  Created by output. on 2020/03/09.
//  Copyright © 2020 tomoaki narita. All rights reserved.

//MP3を弾くようにする設計図(クラス)を作る

import Foundation

//WithOutMP3とつけてクラスを宣言
//親クラスにSoundFileを持たせる
class WithOutMP3: SoundFile {
    
    override func playSound(fileName: String, extentionName: String) {
        
      
        //もしextentionNameに入ってきた値がmp3だったら
        if extentionName == "mp3" {
            //"このファイルは再生できません"と出力
            print("このファイルは再生できません")
        }
        //playerのstop
        player?.stop()
        
    }
    
  
    
}
