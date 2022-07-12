//
//  ViewController.swift
//  EmotionDiary
//
//  Created by 방선우 on 2022/07/12.
//

import UIKit

class ViewController: UIViewController {
    let emotionWords = ["행복해", "사랑해", "좋아해", "당황해", "속상해", "우울해", "심심해", "무력해", "꿀꿀해"]
    var emotionArray = [0,0,0,0,0,0,0,0,0]
    
    @IBOutlet var buttonLabels: [UILabel]!
    @IBOutlet var background: UIView!
    @IBOutlet var buttonImage: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        background.backgroundColor = UIColor.yellow
        
        //MARK: tag 추가
        for i in 0...8 {
            buttonImage[i].tag = i
        }
        
        //MARK: Image 추가 및 레이블 설정
        inputImage()
    }
    
    //MARK: 클릭 시 1. 버튼 설정 단어로 초기화 2. 클릭횟수 옆에 붙여주기
    @IBAction func emotionalButtonCliked(_ sender: UIButton) {
        buttonLabels[sender.tag].text! = emotionWords[sender.tag]
        emotionArray[sender.tag] += 1
        buttonLabels[sender.tag].text! += String(emotionArray[buttonImage[sender.tag].tag])
    }
    
    //MARK: 버튼 Image 구성
    func inputImage() {
        for (i, word) in zip(0...8, emotionWords) {
            let image = UIImage(named: "sesac_slime\(i + 1)")
            buttonImage[i].setImage(image, for: .normal)
            buttonLabels[i].text = word
        }
    }
}
