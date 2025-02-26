//
//  CreditViewController.swift
//  UpDownGame
//
//  Created by nelime on 2/25/25.
//

import UIKit

class CreditViewController: UIViewController {

    
    @IBAction func touchUpDismissButton(_ sender: UIButton) {
        
        // 이전 화면으로 돌아가는 코드, 애니메이션 있고, 돌아간 후에 따로 할일은 없으니 completion: nil
        dismiss(animated: true, completion: nil)
    }

   
}
