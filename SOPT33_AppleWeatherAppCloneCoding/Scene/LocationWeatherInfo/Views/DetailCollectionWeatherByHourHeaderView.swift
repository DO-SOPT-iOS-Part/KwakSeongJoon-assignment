//
//  DetailCollectionWeatherByHourHeaderView.swift
//  SOPT33_AppleWeatherAppCloneCoding
//
//  Created by 곽성준 on 11/8/23.
//

import UIKit

final class DetailCollectionWeatherByHourHeaderView: UICollectionReusableView {
        
    static let identifier = "DetailCollectionWeatherByHourHeaderView"
    
    private let hourWeatherDescriptionLabel: SFFontLabel = {
        let label = SFFontLabel(size: 18, weight: .regular)
        label.numberOfLines = 2
        label.text = "나는넌야나는ㄴ ㅏㄴ는 너냥 아마도 너는 나고 나는 너고 아니야 나는 몰라 너야 나야 ㅏ너양 ㅏ냐아냐아야"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
        
    }
    
    private func setLayout() {
        self.addSubviews(hourWeatherDescriptionLabel)
        
        hourWeatherDescriptionLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
