//
//  ViewController.swift
//  SOPT33_AppleWeatherAppCloneCoding
//
//  Created by 곽성준 on 2023/10/16.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {

    private let imageTest: UIImageView = {
        let imageTest = UIImageView(image: ImageLiterals.detailView.backgroundImage)
        return imageTest
    }()
    
    private let labelTest: UILabel = {
        let label = UILabel()
        label.font = .sfPro(size: 30, weight: .bold)
        label.textColor = .black
        label.text = "테스트"
        return label
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
        view.addSubview(imageTest)
        
        imageTest.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    
    }
}


