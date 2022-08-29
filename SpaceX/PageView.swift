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
    private let firstFlightLabel = UILabel()
    private let country = UILabel()
    private let cost = UILabel()
    private let firstStep = UILabel()
    private let engines = UILabel()
    private let fuelAmount = UILabel()
    private let burnTimeSec = UILabel()
    
    init(rocket: Rocket) {
        self.rocket = rocket
        super.init(frame: .zero)
        self.backgroundColor = .systemBackground
        configureRocketImageView()
        configureRocketNameLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureRocketImageView() {
        rocketImage.contentMode = .scaleToFill
        rocketImage.clipsToBounds = true
        
        for i in 0..<rocket.images.count {
            guard
                let imageUrl = URL(string: rocket.images[i]),
                let imageData = try? Data(contentsOf: imageUrl)
            else { return }
            DispatchQueue.main.async {
                self.rocketImage.image = UIImage(data: imageData)
            }
        }
        self.addSubview(rocketImage)
    }
    
    private func configureRocketNameLabel() {
        rocketName.text = rocket.name
        rocketName.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        
        self.addSubview(rocketName)
    }
    
    private func configureFirstFlightLabel() {
        firstFlightLabel.text = rocket.name
        firstFlightLabel.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        
        self.addSubview(rocketName)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        rocketImage.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: 400)
        rocketName.frame = CGRect(x: 40, y: rocketImage.frame.maxY + 40, width: self.frame.size.width - 80, height: 22)
    }
}
