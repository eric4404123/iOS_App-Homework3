//
//  QnAPsyViewController.swift
//  Homework3
//
//  Created by Chi Hung Liu on 2019/11/21.
//  Copyright © 2019 Chi Hung Liu. All rights reserved.
//

import UIKit

class QnAPsyViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var ansButtons: [UIButton]!
    
    //答案與問題的陣列
    let questions = [
    QAlist(question:"1.如果朋友生病住院，你探望時覺得送下面哪種花最適合？", choices: ["A.白色百合花", "B.紫色鬱金香", "C.黃色玫瑰花"]),
    QAlist(question:"2.和父母爭吵過後，你會主動道歉？", choices:["A.不是", "B.不確定", "C.是的"]),
    QAlist(question:"3.給臥室裝窗簾，你會選擇下列哪種顏色的窗簾？", choices:["A.粉色", "B.淺藍色", "C.米白色"]),
    QAlist(question:"4.你的知心好友有多少個？", choices:["A.0個", "B.1~3個", "C.3個以上"]),
    QAlist(question:"5.以下幾種小動物，你最喜歡的是？", choices:["A.金魚", "B.波斯貓", "C.鸚鵡"]),
    QAlist(question:"6.坐在火車上，有陌生人來搭訕，你會？", choices:["A.冷漠以對，隨口應付", "B.不確定", "C.微笑面對，熱心回答"]),
    QAlist(question:"7.你獨自到郊外旅遊，突然迷路了，你會？", choices:["A.報警", "B.向附近村民求救，請求幫忙", "C.向路人詢問出路"]),
    QAlist(question:"8.如果家裡只剩下三種吃的東西，飢餓時你會選擇哪一個？", choices:["A.饅頭", "B.漢堡", "C.牛肉拉麵"]),
    QAlist(question:"9.你燒得一手好菜？", choices:["A.是的", "B.不確定", "C.不是"]),
    QAlist(question:"10.如果有朋友，凌晨一點左右，打電話找你聊天，你會？", choices:["A.關機", " B.接電話，坦白說自己想睡覺", "C.陪他聊天，想睡時再告訴對方"])
    ]
    
    //對應所得分數所屬的宅度
    let personality = ["宅人等級：★★★★★你是個缺乏安全感的人，不喜歡把自己的故事和別人一起分享，許多心事只願放在心裡，不願意與人交流，喜歡享受獨處的感覺。家是你唯一感到溫暖和安全的地方，在這個狹小的空間裡，你可以放鬆心情，為所欲為。宅在家裡，你喜歡上網，購物，讀書，沉浸在自己的世界裡，對外界不聞不問，你的「宅」功可謂是相當了得。",
    "宅人等級：★★★★從小養尊處優、得到父母寵愛的你，不需要為了錢財而忙碌，到處奔波。因此，「宅」似乎就變成了你的一種習慣。由於家庭對你的保護過度，造成你與社會接觸得較少，使得你的溝通能力較弱，也不善於處理人際關係方面的問題。對你而言，只有家人才沒有陌生的感覺，其他人都很難走進你的內心，獲得你的信任。",
        
    "宅人等級：★★★你是個有理想、有抱負的人，有著美好的願望，對未來也有許多期許。只是，工作方面的小不如意，讓你的心情稍稍有些失落。但是，你宅在家裡，只是希望有個人的自由空間，做一些自己想做的事情，你很少在家玩樂，而是不斷地給自己的充電，學習一些新的技能，提高自己的能力和素質。因此，你屬於宅得比較充實的一類人。",
        
    "宅人等級：★★生活中遇到了不少挫折，讓你變得有些悲觀，對自己缺乏信心，對社會也有些排斥。你不想和任何人接觸，也不想別人來打擾你。宅在家裡，你不用再帶著面具做人，想幹什麼就幹什麼，沒有絲毫的壓力。你不過是階段性的宅人，等你恢復了自信，就會變得活潑、開朗了。"
        
        ]
    
    //變數宣告
    var index = 0
    var pointA = 0
    var pointB = 0
    var pointC = 0
    var sum = 0
    
    //當按鈕按下時執行
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        //先執行NextQuestion判斷題目狀況
        NextQuestion()
        
        //使用button元件裡的tag編號來判斷按下的是哪一顆按鍵
        if sender.tag == 0
        {
            pointA += 1
        }
        if sender.tag == 1
        {
            pointB += 2
        }
        if sender.tag == 2
        {
            pointC += 3
        }
        
        //最後分數加總
        sum = pointA + pointB + pointC
    }
    
    func NextQuestion()
    {
        //判斷目前執行到的題數是否為最後的題目
        if index < questions.count - 1
        {
            index += 1
            questionLabel.text = questions[index].question
            ansButtons[0].setTitle(questions[index].choices[0], for: .normal)
            ansButtons[1].setTitle(questions[index].choices[1], for: .normal)
            ansButtons[2].setTitle(questions[index].choices[2], for: .normal)
        }
        
        //題目執行完畢，統計分數
        else
        {
            if sum>=10 && sum<=17
            {
                questionLabel.text = personality[0]
                
                //隱藏按鈕
                ansButtons[0].isHidden = true
                ansButtons[1].isHidden = true
                ansButtons[2].isHidden = true
            }
            
            if sum>=18 && sum<=20
            {
                questionLabel.text = personality[1]
                
                ansButtons[0].isHidden = true
                ansButtons[1].isHidden = true
                ansButtons[2].isHidden = true
            }
            
            if sum>=21 && sum<=23
            {
                questionLabel.text = personality[2]
                
                ansButtons[0].isHidden = true
                ansButtons[1].isHidden = true
                ansButtons[2].isHidden = true
            }
            
            if sum>=24 && sum<=30
            {
                questionLabel.text = personality[3]
                
                ansButtons[0].isHidden = true
                ansButtons[1].isHidden = true
                ansButtons[2].isHidden = true
            }
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //頁面載入時，載入題目與答案
        questionLabel.text = questions[index].question
        ansButtons[0].setTitle(questions[index].choices[0], for: .normal)
        ansButtons[1].setTitle(questions[index].choices[1], for: .normal)
        ansButtons[2].setTitle(questions[index].choices[2], for: .normal)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
