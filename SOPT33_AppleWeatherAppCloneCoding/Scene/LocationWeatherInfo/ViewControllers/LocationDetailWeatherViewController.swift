//
//  LocationDetailWeatherViewController.swift
//  SOPT33_AppleWeatherAppCloneCoding
//
//  Created by 곽성준 on 2023/10/19.
//

import UIKit

class LocationDetailWeatherViewController: UIViewController {
    
    var weatherData = WeatherDataStruct.dummy()
    
    var index: Int = 0
    
    private let myLocationVC = DetailWeatherInfoViewController()
    
    private let mokdongVC = DetailWeatherInfoViewController()
    
    private let incheonVC = DetailWeatherInfoViewController()

    private let busanVC = DetailWeatherInfoViewController()

    lazy var locationVCs: [UIViewController] = {
        return  [myLocationVC, mokdongVC, incheonVC, busanVC]
    }()
    
    
    lazy var pageViewController: UIPageViewController = {
        let vc = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        return vc
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setData()
        
        setPageViewController()
        setLayout()
    }
    
    private func setPageViewController() {
        
        pageViewController.dataSource = self
        pageViewController.delegate = self
        
        let firstVC = locationVCs[index]
        pageViewController.setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
                
    }
    
    private func setLayout() {
        
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        
        pageViewController.view.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        pageViewController.didMove(toParent: self)
    }
    
    func setData() {
        myLocationVC.detailWeatherData = weatherData[0]
        mokdongVC.detailWeatherData = weatherData[1]
        incheonVC.detailWeatherData = weatherData[2]
        busanVC.detailWeatherData = weatherData[3]
    }
    
}

extension LocationDetailWeatherViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = locationVCs.firstIndex(of: viewController) else { return nil }
        let previousIndex = index - 1
        if previousIndex < 0 {
            return nil
        }
        return locationVCs[previousIndex]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = locationVCs.firstIndex(of: viewController) else { return nil }
        let nextIndex = index + 1
        if nextIndex == locationVCs.count {
            return nil
        }
        return locationVCs[nextIndex]
    }
}
