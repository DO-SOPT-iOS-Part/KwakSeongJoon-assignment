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
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = locationVCs.count
        pageControl.currentPage = index
        pageControl.setIndicatorImage(ImageLiterals.detailView.GPSImage, forPage: 0)
        return pageControl
    }()
    
    private lazy var mapButton = UIBarButtonItem(image: ImageLiterals.detailView.mapImage, style: .plain, target: self, action: #selector(mapButtonTapped))
    
    private lazy var goToListVCButton = UIBarButtonItem(image: ImageLiterals.detailView.locationListImage, style: .plain, target: self, action: #selector(goToListVCButtonTapped))
    
    private lazy var flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    
    lazy var pagecontrol = UIBarButtonItem(customView: pageControl)
   
    let toolBar = UIToolbar()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setData()
        setPageViewController()
        setLayout()
        setToolBar()
        hideBackButton()
    }

    private func setPageViewController() {
        
        pageViewController.dataSource = self
        pageViewController.delegate = self
        
        let firstVC = locationVCs[index]
        pageViewController.setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        
    }
    
    private func setLayout() {
        
        addChild(pageViewController)
        view.addSubviews(pageViewController.view)

        pageViewController.view.snp.makeConstraints {
            $0.edges.equalToSuperview()

        }
        
        pageViewController.didMove(toParent: self)
        
    }
    
    private func setData() {
        myLocationVC.detailWeatherData = weatherData[0]
        mokdongVC.detailWeatherData = weatherData[1]
        incheonVC.detailWeatherData = weatherData[2]
        busanVC.detailWeatherData = weatherData[3]
    }
    
    private func setToolBar() {
        mapButton.tintColor = .white
        goToListVCButton.tintColor = .white
        
        self.navigationController?.isToolbarHidden = false
        self.toolbarItems = [mapButton, flexibleSpace, pagecontrol, flexibleSpace, goToListVCButton]
       
        let toolbarBackgroundColor = UIToolbarAppearance()
        toolbarBackgroundColor.configureWithOpaqueBackground()
        toolbarBackgroundColor.backgroundColor = UIColor(red: 0.165, green: 0.188, blue: 0.251, alpha: 1)
        
        self.navigationController?.toolbar.standardAppearance = toolbarBackgroundColor
    }
    
    private func hideBackButton() {
        self.navigationItem.setHidesBackButton(true, animated: true)

    }
    
    @objc
    private func mapButtonTapped() {
        
    }
    
    @objc
    private func goToListVCButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension LocationDetailWeatherViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = locationVCs.firstIndex(of: viewController) else { return nil }
        let previousIndex = index - 1
        if previousIndex >= 0 {
            //            pageControl.currentPage = previousIndex
            return locationVCs[previousIndex]
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = locationVCs.firstIndex(of: viewController) else { return nil }
        let nextIndex = index + 1
        if nextIndex < locationVCs.count {
            //            pageControl.currentPage = nextIndex
            return locationVCs[nextIndex]
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if completed {
            if let currentViewController = pageViewController.viewControllers?.first,
               let index = locationVCs.firstIndex(of: currentViewController) {
                pageControl.currentPage = index
            }
        }
        
    }
    
}
