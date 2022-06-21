//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//
import UIKit
//メディア再生に必要
import AVFoundation

class ViewController: UIViewController {
    
    //AVAudioPlayerをplayerとしてインスタンス化
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //タップされたボタンのタイトル等の情報がsenderに入る
    @IBAction func keyPressed(_ sender: UIButton) {
        //playSoundファンクションを呼んでタップされたボタンと同じタイトルの.wavファイルを再生する
        playSound(soundName: sender.currentTitle!)
        
        //タップしたボタンのalphaを0.5に
        sender.alpha = 0.5
        //0.2秒後にalphaを1に戻す
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
            sender.alpha = 1
        }
    }
    
    //再生関数
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
}
