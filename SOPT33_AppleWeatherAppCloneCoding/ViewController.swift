//
//  ViewController.swift
//  SOPT33_AppleWeatherAppCloneCoding
//
//  Created by 곽성준 on 2023/10/16.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {

    private let label = UILabel()
    
    private let labelText: UILabel = {
        let label = UILabel()
        label.font = .sfPro(size: 30, weight: .bold)
        label.textColor = .black
        label.text = "테스트"
        return label
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
        view.addSubview(labelText)
        
        labelText.snp.makeConstraints{
            $0.top.leading.equalToSuperview().inset(100)
        }
    
    }
}


