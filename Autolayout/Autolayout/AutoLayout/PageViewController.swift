//
//  PageViewController.swift
//  AutoLayout
//
//  Created by Mondale on 2/19/20.
//  Copyright © 2020 Mondale. All rights reserved.
//

import UIKit

class PageViewController: UIViewController {
    
    var firstVC = ViewController()
    var secondVC = ViewController2()
    var thirdVC = ViewController3()
    
    var views = [UIViewController]()
    var pageControl = UIPageControl()
    var pageViewController = UIPageViewController()
    
    
    
    override func viewDidLoad() {
        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        views.append(contentsOf: [firstVC, secondVC, thirdVC])
        self.configurePageControl()
        // Setting view of pageViewController to current view
        self.view.addSubview(pageViewController.view)
        self.view.backgroundColor = .white
        pageViewController.dataSource = self
        pageViewController.delegate = self
        
        // Setting first controller to present
        if let firstViewController = views.first {
            pageViewController.setViewControllers([firstViewController],
                direction: .forward,
                animated: true,
                completion: nil)
        }
    }
    
    // Creating page control indicator
    func configurePageControl() {
        pageControl = UIPageControl(frame: CGRect(x: 0,y: UIScreen.main.bounds.maxY - 50,width: UIScreen.main.bounds.width,height: 50))
        self.pageControl.numberOfPages = views.count
        self.pageControl.currentPage = 0
        self.pageControl.alpha = 1.0
        self.pageControl.tintColor = UIColor.lightGray
        self.pageControl.pageIndicatorTintColor = UIColor.lightGray
        // TODO: Change current color of  indicator
        self.pageControl.currentPageIndicatorTintColor = UIColor.black
        self.pageViewController.view.addSubview(pageControl)
    }
    
}

// MARK: UIPageViewControllerDataSource

extension PageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    // Data source
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        // Getting previous index of viewcontroller to present
        guard let viewControllerIndex = views.firstIndex(of:viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard views.count > previousIndex else {
            return nil
        }
        
        return views[previousIndex]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        // Getting next index of viewcontroller to present
        guard let viewControllerIndex = views.firstIndex(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let viewsCount = views.count

        guard viewsCount != nextIndex else {
            return nil
        }
        
        guard viewsCount > nextIndex else {
            return nil
        }
        
        return views[nextIndex]
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        // Setting indicator count PageControl
        return views.count
    }

    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        // First view controller to present
        guard let firstViewController = views.first,
            let firstViewControllerIndex = views.firstIndex(of:firstViewController) else {
                return 0
        }
        
        return firstViewControllerIndex
    }
    
    // Delegates
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        // Set first index for page control
        let pageContentViewController = pageViewController.viewControllers![0]
        self.pageControl.currentPage = views.firstIndex(of: pageContentViewController)!
    }
}
