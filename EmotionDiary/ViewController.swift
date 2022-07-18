//
//  ViewController.swift
//  EmotionDiary
//
//  Created by 방선우 on 2022/07/12.
//

import UIKit

extension UIButton {
    func setInsets(forContentPadding contentPadding: UIEdgeInsets, imageTitlePadding: CGFloat?) {
        
        if let imageTitlePadding = imageTitlePadding {
            
            self.contentEdgeInsets = UIEdgeInsets(
                top: contentPadding.top,
                left: contentPadding.left,
                bottom: contentPadding.bottom,
                right: contentPadding.right + imageTitlePadding
            )
            self.titleEdgeInsets = UIEdgeInsets(
                top: 0,
                left: imageTitlePadding,
                bottom: 0,
                right: -imageTitlePadding
            )
        } else {
            self.contentEdgeInsets = UIEdgeInsets(
                top: contentPadding.top,
                left: contentPadding.left,
                bottom: contentPadding.bottom,
                right: contentPadding.right
            )
        }
    }
}

class ViewController: UIViewController {
    let emotionWords = ["행복해", "사랑해", "좋아해", "당황해", "속상해", "우울해", "심심해", "무력해", "꿀꿀해"]
    var emotionArray = [0,0,0,0,0,0,0,0,0]
    
    @IBOutlet var buttonLabels: [UILabel]!
    @IBOutlet var background: UIView!
    @IBOutlet var buttonImage: [UIButton]!
    @IBOutlet weak var emotionCountReset: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        background.backgroundColor = UIColor.yellow
        
        //MARK: Image 추가 및 tag 추가
        //        inputImage(buttonList: buttonImage)
        inputImage()
        
        //MARK: 마음비우기 버튼 UI
        emotionCountReset.setTitle("마음비우기", for: .normal)
        emotionCountReset.setTitleColor(.black, for: .normal)
        emotionCountReset.layer.backgroundColor = UIColor.lightGray.cgColor
        emotionCountReset.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        emotionCountReset.setInsets(forContentPadding: .init(top: 5, left: 5, bottom: 5, right: 5), imageTitlePadding: nil)
        emotionCountReset.layer.cornerRadius = 10
        
        
        
        
        // 이전 실험 코드
        //        for i in 1...9 {
        //            inputImage(number: i)
        //        }
        
        //    func inputImage(number: Int) {
        //        let image = UIImage(named: "sesac_slime\(number)")
        //
        //        for button in buttonImage {
        //            button.setImage(image, for: .normal)
        //        }
        //    }
    }
    
    //MARK: 클릭 시 1. 버튼 설정 단어로 초기화 2. 클릭횟수 옆에 붙여주기
    @IBAction func emotionalButtonCliked(_ sender: UIButton) {
        /*
         //MARK: 이거는 내가 작성한 코드
         // 동작: 버튼레이블 행복해등으로 초기화 -> 합성할당된 값 옆에 붙여주기 -> 다음 클릭 -> 다시 초기화
         buttonLabels[sender.tag].text! = emotionWords[sender.tag]
         emotionArray[sender.tag] += 1
         buttonLabels[sender.tag].text! += String(emotionArray[buttonImage[sender.tag].tag])
         */
        
        //MARK: 멘토님이 도와주신 코드..유레카...
        //        emotionArray[sender.tag] += 1
        //        buttonLabels[sender.tag].text = "\(emotionWords[sender.tag])"  + "\(emotionArray[sender.tag])"
        
        //MARK: userDefaults 사용해보기
        /*
         1. 기존값을 불러온다.
         2. 새로운 값을 저장한다.
         3. 새로운 값을 불러온다.
         4. 텍스트 필드에 할당해준다
         */
        
        //1.
        let currentValue = UserDefaults.standard.integer(forKey: "emotionClickedCount\([sender.tag])")
        //2.
        let updateValus = currentValue + 1
        //3.
        UserDefaults.standard.set(updateValus, forKey: "emotionClickedCount\([sender.tag])")
        //4.
        buttonLabels[sender.tag].text = "\(emotionWords[sender.tag])\(UserDefaults.standard.integer(forKey: "emotionClickedCount\([sender.tag])"))"
    }
    
    //MARK: 마음 비우기 버튼 로직
    @IBAction func emotionResetBtnClick(_ sender: UIButton) {
        showAlert(title: "마음 비우기", message: "마음을 정말 정리하시겠습까?")
    }
    
    //MARK: 버튼 Image 구성
    func inputImage() {
        for i in 0...8 {
            buttonImage[i].tag = i
            buttonImage[buttonImage[i].tag].setImage(UIImage(named: "sesac_slime\(i + 1)"), for: .normal)
            
            buttonLabels[i].text = "\(emotionWords[i])\(UserDefaults.standard.integer(forKey: "emotionClickedCount\([i])"))"
        }
        /*  -> userDefault를 지정해줘서 쓸 수 없는 코드
         for (i, word) in zip(0...8, emotionWords) {
         
         let image = UIImage(named: "sesac_slime\(i + 1)")
         buttonImage[i].setImage(image, for: .normal)
         buttonLabels[i].text = word
         }
         */
        
    }
    //
    //        for buttonLabel in buttonLabels {
    //        buttonLabel.text = "\(emotionArray[0])"
    //        }
    
    //MARK: - Alert 추가(새싹님 코드 참고)
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "네", style: .destructive, handler: { (_) in
            for i in 0...8 {
                // 각 버튼마다 값을 지워주고 -> 기본값 반환 Int는 0
                UserDefaults.standard.removeObject(forKey: "emotionClickedCount\([i])")
                // 변경된 값을 넣어주기
                self.buttonLabels[i].text = "\(self.emotionWords[i])\(UserDefaults.standard.integer(forKey: "emotionClickedCount\([i])"))"
            }
        })
        alert.addAction(ok)
        present(alert, animated: true, completion: .none)
        
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
    //        //        let systemImage = UIImage(systemName: T##String)
    //
    //        // 이게 Literal로 이미지 색 넣는 법
    //        // #imageLiteral(
    //        // #imageLiteral(
    //        // 아래코드 주석처리하면 코드가 나옴
    //        //        let literal = #imageLiteral()
    //        //        let colrLiteral = #colorLiteral()
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
}
