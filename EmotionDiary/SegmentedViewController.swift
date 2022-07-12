//
//  SegmentedViewController.swift
//  EmotionDiary
//
//  Created by 방선우 on 2022/07/12.
//

import UIKit

// 우리끼는 0번째 세그인걸 알지만 다른 사람들은 모르자나
enum MusicType: Int {
    case all = 0
    case korea = 1
    case other = 2
}

class SegmentedViewController: UIViewController {
    @IBOutlet weak var segmentController: UISegmentedControl!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segementBtnAction(segmentController) // 클릭하지 않아도 기본적으로띄워놓기(첫번쨰 세그먼트)
    }
    
    @IBAction func segementBtnAction(_ sender: UISegmentedControl) {
        
        //방법 2 좀더 다른 사람과 공유하기 좋은 방법
        if segmentController.selectedSegmentIndex == MusicType.all.rawValue {
            resultLabel.text = "첫번째 세그먼트 선택"
        } else if segmentController.selectedSegmentIndex == MusicType.korea.rawValue {
            resultLabel.text = "두번째 세그 선택"
        } else if segmentController.selectedSegmentIndex == MusicType.other.rawValue {
            resultLabel.text = "세번째 세그 선택"
        }
        
        //방법1
        if segmentController.selectedSegmentIndex == 0 {
            resultLabel.text = "첫번째 세그먼트 선택"
        } else if segmentController.selectedSegmentIndex == 1 {
            resultLabel.text = "두번째 세그먼트 선택"
        } else if segmentController.selectedSegmentIndex == 2 {
            resultLabel.text = "세번째 세그먼트 선택"
        }
        
    }
    
    
    
}
