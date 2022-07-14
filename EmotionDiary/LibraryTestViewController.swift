//
//  LibraryTestViewController.swift
//  EmotionDiary
//
//  Created by 방선우 on 2022/07/14.
//

import UIKit

class LibraryTestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //DateFormatter: 알아보기 쉬운 날짜 + 시간대 (yyyy MM dd hh:mm:ss)
        let format = DateFormatter()
        format.dateFormat = "M월 d일, yy년" // 월은 대문자여야함
        
        let result = format.string(from: Date())
        print(result, Date())
        
        let word = "3월 2일, 19년"
        let dateResult = format.date(from: word)
        
        print(dateResult)
        print("ddd")
    }

}
