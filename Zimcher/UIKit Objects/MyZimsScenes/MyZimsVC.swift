//
//  MyZimsVC.swift
//  Zimcher
//
//  Created by Weiyu Huang on 12/28/15.
//  Copyright © 2015 Zimcher. All rights reserved.
//

import UIKit

class MyZimsVC: UIViewController, UITabBarDelegate{

    @IBOutlet weak var tabBar: UITabBar!
    @IBOutlet weak var containerView: UIView!
    let subVCs = [FeedsViewController(), ZimsViewController()]
    weak var currentSubVC: MyZimsSubVC!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar(tabBar)
        
        currentSubVC = subVCs[0]
        addChildViewController(currentSubVC)
        installSubVCviews(currentSubVC)
    }
    
    private func setupTabBar(tabBar: UITabBar)
    {
        tabBar.items?.forEach { item in
            item.setTitleTextAttributes([NSFontAttributeName: FONTS.SF_MEDIUM.fontWithSize(16),
                NSForegroundColorAttributeName: COLORSCHEME.MYZIMS.TABBAR
                ], forState: .Normal)
            item.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -4)
        }
        
        
        let selectionIndicatorView = UIView(frame: CGRect(x: 0, y: 0, width: tabBarItemWidth(tabBar), height: UI.MYZIMS.TABBAR_HEIGHT))
        let border = UIView(frame: CGRect(x: 0, y: UI.MYZIMS.TABBAR_HEIGHT - UI.MYZIMS.TABBAR_BORDER_HEIGHT, width: tabBarItemWidth(tabBar), height: UI.MYZIMS.TABBAR_BORDER_HEIGHT))
        border.backgroundColor = COLORSCHEME.MYZIMS.TABBAR
        selectionIndicatorView.addSubview(border)
            
        tabBar.selectionIndicatorImage = UIImage.imageFromView(selectionIndicatorView)
        
        //first item is selected by default
        tabBar.selectedItem = tabBar.items?.first
        
        let bgView = UIView(frame: selectionIndicatorView.frame)
        let innerBorder = UIView(frame: CGRect(x: 0, y: UI.MYZIMS.TABBAR_HEIGHT-1, width: tabBarItemWidth(tabBar), height: 1))
        bgView.addSubview(innerBorder)
        innerBorder.backgroundColor = PALETTE.PINKISH_GRAY
        
        tabBar.backgroundImage = UIImage.imageFromView(bgView)
        
        tabBar.delegate = self
    }
    
    func tabBarItemWidth(tabBar: UITabBar) -> CGFloat
    {
        return view.frame.width/CGFloat(tabBar.items!.count)
    }
    
    private func installSubVCviews(subVC: MyZimsSubVC)
    {
        subVC.view.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(subVC.view)
        subVC.view.topAnchor.constraintEqualToAnchor(containerView.topAnchor).active = true
        subVC.view.bottomAnchor.constraintEqualToAnchor(containerView.bottomAnchor).active = true
        subVC.view.leadingAnchor.constraintEqualToAnchor(containerView.leadingAnchor).active = true
        subVC.view.trailingAnchor.constraintEqualToAnchor(containerView.trailingAnchor).active = true
        
    }
    
    func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        guard let selectedIdx = tabBar.items?.indexOf(item) where selectedIdx < subVCs.count else { return }
        let toVC = subVCs[selectedIdx]
        guard toVC != currentSubVC else { return }
        
        //guard selectedIdx < subVCs.count else { return }
        addChildViewController(toVC)
        currentSubVC.willMoveToParentViewController(nil)
        
        transitionFromViewController(currentSubVC, toViewController: toVC, duration: 0.3, options: [],
            animations: {
                self.installSubVCviews(toVC)
            }) { _ in
                self.currentSubVC.removeFromParentViewController()
                self.currentSubVC = toVC
                self.currentSubVC.willMoveToParentViewController(self)
        }
    }


}
