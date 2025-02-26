//
//  ViewController.swift
//  UpDownGame
//
//  Created by nelime on 2/23/25.
//

import UIKit

// 스토리보드에 추가된 씬을 관리하는 뷰 컨트롤러 파일
class ViewController: UIViewController {
    
    // 컴이 생각하는 숫자
    var randomValue: Int = 0
    // 사용자의 시도 횟수
    var tryCount: Int = 0
    
    // @IBOutlet 스토리보드속 컴포넌트를 변수화
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var tryCountLabel: UILabel!
    @IBOutlet weak var sliderValueLabel: UILabel!
    @IBOutlet weak var minimumValueLabel: UILabel!
    @IBOutlet weak var maximumValueLabel: UILabel!

    // 뷰 생명주기 중 viewDidLoad에 실행될 코드
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 슬라이더의 손잡이에 커스텀 이미지 넣기, .normal: 평상시를 포함한 모든 상황에서 사용
        slider.setThumbImage(UIImage(named: "slider_thumb"), for: .normal)
        
        reset()
    }
    
    // @IBAction 스토리보드속 컴포넌트 상호작용시에 실행될 함수 선언
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        print(sender.value)  // 슬라이더의 현재 값을 로그에 프린트
        sliderValueLabel.text = String(Int(sender.value))  // 스토리보드상의 sliderValueLabel에 슬라이더 값을 표시
    }
    
    // 알림표시 함수
    func showAlert(message: String) {
        // 제목은 없고, 본문만 있고, 스타일은 알림형식의 alertController 객체
        let alert = UIAlertController(title: nil,
                                      message: message,
                                      preferredStyle: .alert)
        
        // OK라고 표시되는 평범한 버튼 스타일의 alertAction 객체, 누르면 reset()
        let okAction = UIAlertAction(title: "OK",
                                     style: .default) { _ in
            self.reset()
        }
        
        // alert 객체에 action객체 추가
        alert.addAction(okAction)
        
        // alert객체 표시 방법, 애니메이션 존재, 완료된후 할건 딱히 없음
        present(alert,
                animated: true,
                completion: nil)
    }
    
    
    @IBAction func touchUpHitButton(_ sender: UIButton) {
        print(slider.value)
        let hitValue = Int(slider.value)
        slider.value = Float(hitValue)
        
        tryCount += 1
        tryCountLabel.text = "\(tryCount) / 5"
        
        if randomValue == hitValue {
            showAlert(message: "YOU WIN!!")
            reset()
        } else if tryCount >= 5 {
            showAlert(message: "YOU LOSE...")
            reset()
        } else if randomValue > hitValue {
            minimumValueLabel.text = "\(hitValue)"
            slider.minimumValue = Float(hitValue)
        } else {
            maximumValueLabel.text = "\(hitValue)"
            slider.maximumValue = Float(hitValue)
        }
    }
    
    @IBAction func touchUpResetButton(_ sender: UIButton) {
        print("touch up reset button")
        reset()
    }
    
    func reset() {
        print("reset")
        randomValue = Int.random(in: 0...30)
        tryCount = 0
        tryCountLabel.text = "0 / 5"
        slider.minimumValue = 0
        slider.maximumValue = 30
        slider.value = 15
        
        minimumValueLabel.text = "0"
        maximumValueLabel.text = "30"
        sliderValueLabel.text = "15"
    }

}

