//
//  ScrollView.swift
//  SpaceX
//
//  Created by Дмитрий Геращенко on 24.08.2022.
//

import UIKit

final class ScrollView: UIScrollView {
    private let rocketImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureImageView() {
        rocketImage.image = UIImage()
        self.addSubview(rocketImage)
    }
}
