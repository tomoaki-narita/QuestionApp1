//
//  NextViewController.swift
//  QuestionApp1
//
//  Created by output. on 2020/03/08.
//  Copyright © 2020 tomoaki narita. All rights reserved.
//

import UIKit

//protocolを作成
protocol NowScoreDelegate {
    
    func nowScore(score:Int)
}

class NextViewController: UIViewController {
    
    //正答数のラベル
    @IBOutlet weak var correctLabel: UILabel!
    
    //間違った数のラベル
    @IBOutlet weak var wrongLabel: UILabel!
    
    //NowScoreDelegateをdelegateと言う名前で以下で使えるようにする
    var delegate:NowScoreDelegate?
    
    //ViewControllerから正答数をInt型で受け取る変数を準備
    var correctedCount = Int()
    
    //ViewControllerから間違った数をInt型で受け取る変数を準備
    var wrongCount = Int()
    
    //beforeCountと言うInt型の変数を準備
    var beforeCount = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //correctedCountのtextにString型にキャストしたcorrectedCountを入れる
        correctLabel.text = String(correctedCount)
        //wrongLabelのtextにString型にキャストしたwrongCountを入れる
        wrongLabel.text = String(wrongCount)
        
        //最高得点をbeforeCount(変数)に入れる
        //もしserDefaultsのstandardのobjectのforKey("beforeCount"に保存された値)がnilでなければ
        if UserDefaults.standard.object(forKey: "beforeCount") != nil{
            
            //"beforeCount"に入っている値をbeforeCount(変数)に入れる
            beforeCount = UserDefaults.standard.object(forKey: "beforeCount") as! Int
        }
        
    }
    
    //backボタンを押した時の処理
    @IBAction func back(_ sender: Any) {
        
        //もし最高得点であれば入れ替え
        //beforeCount(現在の最高得点)の値がcorrectedCount(現在の得点)より小さかったら(correctedCountの値の方が大きかったら)
        if beforeCount < correctedCount{
            
            //correctedCountを"beforeCount"(キー値)の中に保存
            //correctedCount(大きい方),キー値は"beforeCount"とする
            UserDefaults.standard.set(correctedCount, forKey: "beforeCount")
            
            //delegateのnowScoreの中にcorrectedCount(現在の最高得点を入れる)
            delegate?.nowScore(score: correctedCount)
        
        //そうでない場合は、入れ替えない(値を渡さない)
        //correctedCountの値の方が小さかったら
        }else if beforeCount > correctedCount{
           
            //beforeCountを"beforeCount"(キー値)の中に保存
            UserDefaults.standard.set(beforeCount, forKey: "beforeCount")
            
        }
        
        
        //モーダルで画面遷移しているのでこの1行で戻れる
        dismiss(animated: true, completion: nil)
    
  }

}
