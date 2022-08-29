//
//  ViewController.swift
//  SpaceX
//
//  Created by Дмитрий Геращенко on 23.08.2022.
//

import UIKit

final class ViewController: UIViewController {
    
    private let activityIndicatorView = UIActivityIndicatorView()
    private let scrollView = UIScrollView()
    private let rocketTitle = UILabel()
    private var rockets = [Rocket]()
    private let url = "https://api.spacexdata.com/v4/rockets"
    private let pageControl = UIPageControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureActivityViewIndicator()
        fetchData()
        scrollView.delegate = self
        view.addSubview(scrollView)
    }
    
    private func configureActivityViewIndicator() {
        activityIndicatorView.isHidden = true
        activityIndicatorView.hidesWhenStopped = true
        view.addSubview(activityIndicatorView)
    }
    
    private func fetchData() {
        activityIndicatorView.isHidden = false
        activityIndicatorView.startAnimating()
        
        NetworkManager.fetchRockets(url: url) { (rockets) in
            DispatchQueue.main.async {
                self.activityIndicatorView.stopAnimating()
                self.rockets = rockets
                self.configurePageControl()
            }
        }
    }
    
    private func configureRocketTitle() {
        
    }
    
    @objc private func pageControlValueChanged(_ sender: UIPageControl) {
        let current = sender.currentPage
        scrollView.setContentOffset(CGPoint(x: CGFloat(current) * view.frame.size.width,
                                            y: 0), animated: true)
    }
    
    private func configurePageControl() {
        pageControl.numberOfPages = self.rockets.count
        pageControl.backgroundColor = .systemGray3
        pageControl.addTarget(self, action: #selector(pageControlValueChanged(_:)), for: .valueChanged)
        
        view.addSubview(pageControl)
    }
    
    private func configureScrollView() {
        scrollView.contentSize = CGSize(width: view.frame.size.width * CGFloat(rockets.count), height: scrollView.frame.size.height)
        scrollView.isPagingEnabled = true
        
        for i in 0..<rockets.count {
            let page = PageView(rocket: rockets[i])
            page.frame = CGRect(x: CGFloat(i) * view.frame.size.width,
                                y: 0,
                                width: view.frame.size.width,
                                height: scrollView.frame.size.height)
            scrollView.addSubview(page)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // ActivityView
        activityIndicatorView.frame = CGRect(x: 0,
                                             y: 0,
                                             width: view.frame.size.width,
                                             height: view.frame.size.height)
        // PageControl
        pageControl.frame = CGRect(x: 0,
                                   y: view.frame.size.height - 100,
                                   width: view.frame.size.width,
                                   height: 100)
        // ScrollView
        scrollView.frame = CGRect(x: 0,
                                  y: 0,
                                  width: view.frame.size.width,
                                  height: view.frame.size.height)
        if scrollView.subviews.count == 2 {
            configureScrollView()
        }
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(floorf(Float(scrollView.contentOffset.x) / Float(scrollView.frame.size.width)))
    }
}
