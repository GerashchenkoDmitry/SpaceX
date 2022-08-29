//
//  PageView.swift
//  SpaceX
//
//  Created by Дмитрий Геращенко on 29.08.2022.
//

import UIKit

final class PageView: UIView {
    
    private let rocket: Rocket
    private let rocketImage = UIImageView()
    private let rocketName = UILabel()
    
    init(rocket: Rocket) {
        self.rocket = rocket
        super.init(frame: .zero)
        
        configureRocketImage()
        configureRocketName()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureRocketImage() {
        rocketImage.contentMode = .scaleAspectFit
        rocketImage.clipsToBounds = false
        rocketImage.image = UIImage(systemName: "circle.grid.cross.fill")
        
        self.addSubview(rocketImage)
    }
    
    private func configureRocketName() {
        rocketName.text = rocket.name
        rocketName.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        
        self.addSubview(rocketName)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        rocketImage.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: 400)
        rocketName.frame = CGRect(x: 40, y: rocketImage.frame.maxY + 40, width: self.frame.size.width - 80, height: 22)
    }
}
