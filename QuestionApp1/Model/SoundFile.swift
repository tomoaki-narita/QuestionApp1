//
//  SoundFile.swift
//  QuestionApp1
//
//  Created by output. on 2020/03/09.
//  Copyright © 2020 tomoaki narita. All rights reserved.
//

import Foundation
//音声を流せるプロパティー
import AVFoundation

//SoundFileと付けてクラスを作る
class SoundFile{
    
    //プロパティーを作る、まだ値を入れないので?をつける
    var player:AVAudioPlayer?
    
    //playSoundメソッド(音声を流す機能)を作る
    //Stringに入ってきた値がfilename,extentionNameにインプットされる
    func playSound(fileName:String,extentionName:String){
        
        //再生する
        //filename,extentionNameにインプットされた値を処理する
        let soundURL = Bundle.main.url(forResource: fileName, withExtension: extentionName)
        
        //do-catch文
        do{
            //効果音を鳴らす
            player = try AVAudioPlayer(contentsOf: soundURL!)
            player?.play()
            
        }catch{
            
            print("エラーです！")
        }
        
    }
    
    
}


