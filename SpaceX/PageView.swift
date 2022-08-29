//
//  PageView.swift
//  SpaceX
//
//  Created by Дмитрий Геращенко on 29.08.2022.
//

import UIKit

final class PageView: UIView {
    
    private let rocket: Rocket
    private let rocketImageLabel = UIImageView()
    private let rocketNameLabel = UILabel()
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
        configureFirstFlightLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureRocketImageView() {
        rocketImageLabel.contentMode = .scaleToFill
        rocketImageLabel.clipsToBounds = true
        
        for i in 0..<rocket.images.count {
            guard
                let imageUrl = URL(string: rocket.images[i]),
                let imageData = try? Data(contentsOf: imageUrl)
            else { return }
            DispatchQueue.main.async {
                self.rocketImageLabel.image = UIImage(data: imageData)
            }
        }
        self.addSubview(rocketImageLabel)
    }
    
    private func configureRocketNameLabel() {
        rocketNameLabel.text = rocket.name
        rocketNameLabel.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        
        self.addSubview(rocketNameLabel)
    }
    
    private func configureFirstFlightLabel() {
        firstFlightLabel.text = "First flight: \(rocket.firstFlight)"
//        firstFlightLabel.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        
        self.addSubview(firstFlightLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        rocketImageLabel.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: 400)
        
        rocketNameLabel.frame = CGRect(x: 40, y: rocketImageLabel.frame.maxY + 40, width: self.frame.size.width - 80, height: 22)
        
        firstFlightLabel.frame = CGRect(x: 40, y: rocketNameLabel.frame.maxY + 16, width: self.frame.size.width - 80, height: 22)
    }
}
