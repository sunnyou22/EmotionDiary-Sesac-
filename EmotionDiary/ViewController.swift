//
//  ViewController.swift
//  EmotionDiary
//
//  Created by 방선우 on 2022/07/12.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var buttonLabels: [UILabel]!
    @IBOutlet weak var test: UILabel!
    @IBOutlet var background: UIView!
    
    var emotionArray = [0,0,0,0,0,0,0,0,0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tag = 0...8
        
        for (tag, button) in zip(tag, buttonLabels) {
            button.tag = tag
        }
        
    }
    
    @IBAction func emotionalButtonCliked(_ sender: UIButton) {
        emotionArray[sender.tag] += 1
//        
//        for buttonLabel in buttonLabels {
//        buttonLabel.text = "\(emotionArray[0])"
//        }
    }
}
        //MARK: - 수업 및 내 감정일기 코드
        
//        background.layer.backgroundColor = UIColor.gray.cgColor
//
//        let emotionWords = ["행복해", "사랑해", "좋아해", "당황해", "속상해", "우울해", "심심해", "무력해", "꿀꿇해"]
//
//        for (i, word) in zip(buttonLabels, emotionWords) {
//            i.text = word
//
//        // 여기에 튜플 써보기
//
//
//        // Do any additional setup after loading the view.
//
//        // 시스템 심볼 쓰기
//        // 내 이미지를 쓰려며는 named로 하는 것
//        //        let systemImage = UIImage(systemName: <#T##String#>)
//
//        // 이게 Literal로 이미지 색 넣는 법
//        // #imageLiteral(
//        // #imageLiteral(
//        // 아래코드 주석처리하면 코드가 나옴
//        //        let literal = #imageLiteral()
//        //        let colrLiteral = #colorLiteral()
//
//    }
//    }
//
//    @IBAction func clickButton(_ sender: UIButton) {
//        for i in buttonLabels {
//            i.text = (i.text ?? "감정이 없습니다") + String(setEmotionCounting())
//        }
//    }
//
//    func setEmotionCounting() -> Int {
//        var clickedNumber = 0
//        clickedNumber += 1
//        return clickedNumber
//    }
//
//    //배경색, 레이블, 이미지
//    func example() -> (UIColor, String, String) {
//        let color: [UIColor] = [.yellow, .red, .blue]
//        let image: [String] = ["sesac_slime1"]
//
//        return (color.randomElement()!, "고래밥", image.randomElement()!)
//    }
//
//    func setUserNickname() {
//        let nickname = ["고래밥", "칙촉", "격투가"]
//        let select = nickname.randomElement()!
//
////        test.text = select // 위에 레이블 test 아웃렛 삭제함
//    }
//
//    // 이거 버튼에 넣기
//    // 액션시트에서는 타이틀 및 메세지 잘 않서서 그냥 nil로 둘다 처리
//    func showAlertcontroller() {
//        //1. 흰 바탕: UIAlertController
//        let alert =  UIAlertController(title: "타이틀", message: "여기는 메세지가 들어갑니다.", preferredStyle: .alert)
//
//        //2.버튼
//        let ok = UIAlertAction(title: "확인", style: .destructive, handler: nil)
//        let cancel = UIAlertAction(title: "취소버튼입니다", style: .cancel, handler: nil)
//        let web = UIAlertAction(title: "새창으로 열기", style: .cancel, handler: nil)
//        let copy = UIAlertAction(title: "복사하기", style: .default, handler: nil)
//
//        //3. 1+2
//        alert.addAction(ok)
//        alert.addAction(cancel)
//        alert.addAction(web)
//        alert.addAction(copy)
//
//
//        //4. present
//        present(alert, animated: true, completion: nil) // completion은 내부적으로 처리하기 위해
//    }
//}
//
