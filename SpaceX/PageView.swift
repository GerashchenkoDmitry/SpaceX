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
    private let rocketNameValue = UILabel()
    
    private let firstFlightLabel = UILabel()
    private let firstFlightValue = UILabel()

    private let countryLabel = UILabel()
    private let countryValue = UILabel()

    private let costLabel = UILabel()
    private let costValue = UILabel()

    private let firstStepLabel = UILabel()
    
    private let enginesLabel = UILabel()
    private let enginesValue = UILabel()

    private let fuelAmountLabel = UILabel()
    private let fuelAmountValue = UILabel()

    private let burnTimeLabel = UILabel()
    private let burnTimeValue = UILabel()
    
    init(rocket: Rocket) {
        self.rocket = rocket
        super.init(frame: .zero)
        self.backgroundColor = .systemBackground
        configureRocketImageView()
        configureRocketNameLabel()
        
        configureFirstFlightLabel()
        configureFirstFlightValue()
        
        configureCountryLabel()
        configureCountryValue()
        
        configureCostLabel()
        configureCostValue()
        
        configureFirstStepLabel()
        
        configureEnginesLabel()
        configureEnginesValue()
        
        configureFuelAmountLabel()
        configureFuelAmountValue()
        
        configureBurnTimeLabel()
        configureBurnTimeValue()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Configure Rocket Image
    
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
    
    // MARK: Configure Rocket Name Label

    private func configureRocketNameLabel() {
        rocketNameLabel.text = rocket.name
        rocketNameLabel.font = UIFont.systemFont(ofSize: 32, weight: .semibold)
        
        self.addSubview(rocketNameLabel)
    }
    
    // MARK: Configure First Flight

    private func configureFirstFlightLabel() {
        firstFlightLabel.text = "First flight"
        firstFlightLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        firstFlightLabel.sizeToFit()
        
        self.addSubview(firstFlightLabel)
    }
    
    private func configureFirstFlightValue() {
        firstFlightValue.text = "\(rocket.firstFlight)"
        firstFlightValue.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        firstFlightValue.textAlignment = .right
        
        self.addSubview(firstFlightValue)
    }
    
    // MARK: Configure Country

    private func configureCountryLabel() {
        countryLabel.text = "Country"
        countryLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        countryLabel.sizeToFit()
        
        self.addSubview(countryLabel)
    }
    
    private func configureCountryValue() {
        countryValue.text = "\(rocket.country)"
        countryValue.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        countryValue.textAlignment = .right
        
        self.addSubview(countryValue)
    }
    
    // MARK: Configure Cost per Launch

    private func configureCostLabel() {
        costLabel.text = "Cost per Launch"
        costLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        costLabel.sizeToFit()
        
        self.addSubview(costLabel)
    }
    
    private func configureCostValue() {
        costValue.text = "$\(Float(rocket.costPerLaunch) / 1_000_000) mln"
        costValue.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        costValue.textAlignment = .right
        
        self.addSubview(costValue)
    }
    
    // MARK: configure First Step
    
    private func configureFirstStepLabel() {
        firstStepLabel.text = "First Step"
        firstStepLabel.font = UIFont.systemFont(ofSize: 27, weight: .semibold)
        
        self.addSubview(firstStepLabel)
    }
    
    // MARK: Configure first step number of engines
    
    private func configureEnginesLabel() {
        enginesLabel.text = "Engines"
        enginesLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        enginesLabel.sizeToFit()
        
        self.addSubview(enginesLabel)
    }
    
    private func configureEnginesValue() {
        enginesValue.text = "\(rocket.firstStage?.engines ?? 0)"
        enginesValue.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        enginesValue.textAlignment = .right
        
        self.addSubview(enginesValue)
    }
    
    // MARK: Configure first step fuel amount
    
    private func configureFuelAmountLabel() {
        fuelAmountLabel.text = "Fuel Amount"
        fuelAmountLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        fuelAmountLabel.sizeToFit()
        
        self.addSubview(fuelAmountLabel)
    }
    
    private func configureFuelAmountValue() {
        fuelAmountValue.text = "\(rocket.firstStage?.fuelAmountTons ?? 0) ton"
        fuelAmountValue.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        fuelAmountValue.textAlignment = .right
        
        self.addSubview(fuelAmountValue)
    }
    
    // MARK: Configure first step fuel amount
    
    private func configureBurnTimeLabel() {
        burnTimeLabel.text = "Burn Time"
        burnTimeLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        burnTimeLabel.sizeToFit()
        
        self.addSubview(burnTimeLabel)
    }
    
    private func configureBurnTimeValue() {
        burnTimeValue.text = "\(rocket.firstStage?.burnTimeSec ?? 0) sec"
        burnTimeValue.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        burnTimeValue.textAlignment = .right
        
        self.addSubview(burnTimeValue)
    }
    
    // MARK: Layout views on the screen
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Rocket Image
        
        rocketImageLabel.frame = CGRect(x: 0,
                                        y: 0,
                                        width: self.frame.size.width,
                                        height: 400)
        // Rocket Name
        
        rocketNameLabel.frame = CGRect(x: 20,
                                       y: rocketImageLabel.frame.maxY + 20,
                                       width: self.frame.size.width - 40,
                                       height: 32)
        // First Flight
        
        firstFlightLabel.frame.origin.x = self.safeAreaInsets.left + 20
        firstFlightLabel.frame.origin.y = rocketNameLabel.frame.maxY + 16
        
        firstFlightValue.frame = CGRect(x: firstFlightLabel.frame.maxX + 20,
                                        y: firstFlightLabel.frame.origin.y,
                                        width: self.frame.size.width - firstFlightLabel.frame.size.width - 60,
                                        height: 22)
        // Country
        
        countryLabel.frame.origin.x = self.safeAreaInsets.left + 20
        countryLabel.frame.origin.y = firstFlightLabel.frame.maxY + 16
        
        countryValue.frame = CGRect(x: countryLabel.frame.maxX + 20,
                                    y: countryLabel.frame.origin.y,
                                    width: self.frame.size.width - countryLabel.frame.size.width - 60,
                                    height: 22)
        
        // Cost
        
        costLabel.frame.origin.x = self.safeAreaInsets.left + 20
        costLabel.frame.origin.y = countryLabel.frame.maxY + 16
        
        costValue.frame = CGRect(x: costLabel.frame.maxX + 20,
                                    y: costLabel.frame.origin.y,
                                    width: self.frame.size.width - costLabel.frame.size.width - 60,
                                    height: 22)
        
        // First Step
        
        firstStepLabel.frame = CGRect(x: 20,
                                      y: costLabel.frame.maxY + 20,
                                      width: self.frame.size.width,
                                      height: 32)
        
        // First Step Engines
        
        enginesLabel.frame.origin.x = self.safeAreaInsets.left + 20
        enginesLabel.frame.origin.y = firstStepLabel.frame.maxY + 16
        
        enginesValue.frame = CGRect(x: enginesLabel.frame.maxX + 20,
                                    y: enginesLabel.frame.origin.y,
                                    width: self.frame.size.width - enginesLabel.frame.size.width - 60,
                                    height: 22)
        
        // First Step Fuel Amount
        
        fuelAmountLabel.frame.origin.x = self.safeAreaInsets.left + 20
        fuelAmountLabel.frame.origin.y = enginesLabel.frame.maxY + 16
        
        fuelAmountValue.frame = CGRect(x: fuelAmountLabel.frame.maxX + 20,
                                    y: fuelAmountLabel.frame.origin.y,
                                    width: self.frame.size.width - fuelAmountLabel.frame.size.width - 60,
                                    height: 22)
        
        // Burn Time
        
        burnTimeLabel.frame.origin.x = self.safeAreaInsets.left + 20
        burnTimeLabel.frame.origin.y = fuelAmountLabel.frame.maxY + 16
        
        burnTimeValue.frame = CGRect(x: burnTimeLabel.frame.maxX + 20,
                                     y: burnTimeLabel.frame.origin.y,
                                     width: self.frame.size.width - burnTimeLabel.frame.size.width - 60,
                                     height: 22)
    }
}
