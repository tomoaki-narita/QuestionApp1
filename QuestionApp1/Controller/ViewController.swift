//
//  ViewController.swift
//  QuestionApp1
//
//  Created by output. on 2020/03/08.
//  Copyright © 2020 tomoaki narita. All rights reserved.
//

import UIKit

//NextViewControllerで作ったプロトコル(NowScoreDelegate)を宣言
class ViewController: UIViewController,NowScoreDelegate {
    
    //imageView
    @IBOutlet weak var imageView: UIImageView!
    
    //maxScoreLabel
    @IBOutlet weak var maxScoreLabel: UILabel!
    
    //正答の数、間違った数を入れる変数を作成
    var correctCount = 0
    var wrongCount = 0
    
    //maxScore画像(最高得点)
    var maxScore = 0
    
    //questionNumber(画像)
    var questionNumber = 0
    
    //ImagesListを初期化、配列を呼べるようになる
    let imagesList = ImagesList()
    
    //IBActionで検知した正答がどちらなのかを取得する変数
    var pickedAnswer = false
    
    //WithOutMP3クラスを実体化
//    var withOutMP3 = WithOutMP3()
    
    //soundFileと言う名前でSoundFileクラスを実体化
    var soundFile = SoundFile()
    
    //changeColorと言う名前でChangeColorクラスを入れる
    var changeColor = ChangeColor()
    
    //gradientLayerと言う名前でCAGradientLayerクラスを入れる
    var gradientLayer = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //viewがロードされた時にグラデーションを作る
        //changeColorは返り値なのでCAGradientLayerクラスで受け取る
      gradientLayer = changeColor.changeColor(topR: 0.07, topG: 0.13, topB: 0.26, topAlpha: 1.0, bottomR: 0.54, bottomG: 0.74, bottomB: 0.74, bottomAlpha: 1.0)
        
        //gradientLayerのframeにviewのbounds(全体と言う意味)を入れる
        gradientLayer.frame = view.bounds
        
        //viewのlayerのinsertSublayer(layerを使うときのコード)
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        //imageViewの角を丸くする
        imageView.layer.cornerRadius = 20.0
    }
    
    //画面遷移して戻ってきた時にcorrectCount,wrongCount,questionNumber,を0に戻すメソッド
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        correctCount = 0
        wrongCount = 0
        questionNumber = 0
        
        //始めに表示するimageViewのimageを0に戻す
        //ImagesListクラスのlist.を指す
        imageView.image = UIImage(named: imagesList.list[0].imageText)
        
        //もしUserDefaultsのstandardのobjectのforKey(beforeCountのキー値)がnilでない場合は
        if UserDefaults.standard.object(forKey: "beforeCount") != nil{
           
            //maxScoreの中にbeforeCountに入っている値をInt型で入れる
            maxScore = UserDefaults.standard.object(forKey: "beforeCount") as! Int
        }
        
        //maxScoreLabelのtextにmaxScoreをString型にキャストして入れる
        maxScoreLabel.text = String(maxScore)
    
    
    }
    //buttonメソッド(押された時の処理)
    //ここでは○ボタンメソッドのなかにXボタンをドラッグアンドドロップ
    //○ボタンはTag1,XボタンはTag2に設定
    @IBAction func answer(_ sender: Any) {
        
        //senderの型がAnyなのでAnyObjectにキャスト
        //もし、○ボタンが押された時(.tag == 1)
        if (sender as AnyObject).tag == 1{
            
            //拡張子がmp3だった場合は音声を流さない
//            withOutMP3.playSound(fileName: "maruSound", extentionName: "mp3")
           
            //○ボタンの音声を流す
            soundFile.playSound(fileName: "maruSound", extentionName: "mp3")
            
            //押したボタンが○ボタンだった
            pickedAnswer = true
    
        //そうでなく、もしXボタンが押された時(.tag == 2)
        }else if (sender as AnyObject).tag == 2{
         
            //Xボタンの音声を流す
            soundFile.playSound(fileName: "batsuSound", extentionName: "mp3")
            
            //押したボタンがXボタンだった
            pickedAnswer = false
         
        }
        //checkメソッドを呼ぶ(ボタンが押される度に呼ばれる)
        check()
        
        //checkの後にnextQuestionsメソッドを呼ぶ
        //○かXボタンが押されたら次の画像に進む
        nextQuestions()
        
        }
        //pickedAnswerとImagesListのcorrectOrNotの値が一致しているかチェックするメソッド
        func check(){
            
            //正答のチェック
            //nextQuestionsメソッドでimagesListのlist[questionNumber]配列が+1づつ進むようにしたので
            //配列の中にある0~10の画像を正誤判定できる
            let correctAnswer = imagesList.list[questionNumber].answer
            
            //もしcorrectAnswerに入っている値がpickedAnswerと一緒であれば"正解"と出力
            if correctAnswer == pickedAnswer{
                print("正解")
                
                //正答数をインクリメント(+1)していく
                correctCount = correctCount + 1
            
            //そうでなく、correctAnswerに入っている値がpickedAnswerと違う場合は、"間違い"と出力
            }else{
                print("間違い")
                
                //間違った数をインクリメント(+1)していく
                wrongCount = wrongCount + 1
                
            }
            
    }
    //配列の中の画像を全て正誤判定するためのメソッド
    
    func nextQuestions(){
        
        //もしquestionNumberが9含む以下だったら
        if questionNumber <= 9{
            
            //questionNumberに+1していく
            questionNumber = questionNumber + 1
            
            //imageViewのimageに+1されたimagesListのlist[questionNumber]配列が入る
            imageView.image = UIImage(named: imagesList.list[questionNumber].imageText)
        
        //そうでない場合(この場合は終了した時)"問題終了"と出力
        }else{
            print("問題終了")
            
            //問題終了したら画面遷移する
            //モーダルで遷移するのでsegueのIDにつけた"next"とする
            performSegue(withIdentifier: "next", sender: nil)
        }
           }
    //今のscoreを反映
    func nowScore(score: Int) {
        
        //最高得点だった場合、画面を戻った時に音声を流す
        soundFile.playSound(fileName: "sound", extentionName: "mp3")
        
        //maxScoreLabelのtextにscoreをString型で入れる
        maxScoreLabel.text = String(score)
              
        
        
    }
    //画面遷移する時に正答数(correctCount)と間違った数(wrongCount)を
    //NextViewControllerに渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //もしsegueのIDが"next"だったら
        if segue.identifier == "next"{
            
            //nextVC(定数)を、segueのdestination(目的地)NextViewControllerとして
            let nextVC = segue.destination as! NextViewController
            
            //nextVCのcorrectedCountに現在のcorrectCountを入れる
            nextVC.correctedCount = correctCount
            
            //nextVCのwrongCountに、ViewControllerの現在のwrongCountを入れる
            nextVC.wrongCount = wrongCount
            
            //nextVCのdelegateをself(このViewController)で宣言、任せられた
            nextVC.delegate = self
        }
        
    }
       
        
    
}

