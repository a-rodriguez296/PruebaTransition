//
//  DetailPresentationController.swift
//  PruebaTransition
//
//  Created by Alejandro Rodriguez on 11/10/15.
//  Copyright © 2015 Alejandro Rodriguez. All rights reserved.
//

import UIKit

class DetailPresentationController: UIPresentationController {

    var dimmingView: UIView?
    
    
    override init(presentedViewController: UIViewController, presentingViewController: UIViewController) {
        super.init(presentedViewController: presentedViewController, presentingViewController: presentingViewController)
        setupDimmingView()
    }
    
    
    
    func setupDimmingView() {
        dimmingView = UIView(frame: presentingViewController.view.bounds)
        
        let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .Dark)) as UIVisualEffectView
        visualEffectView.frame = dimmingView!.bounds
        visualEffectView.autoresizingMask = [.FlexibleHeight, .FlexibleWidth]
        dimmingView?.addSubview(visualEffectView)
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: "dimmingViewTapped:")
        dimmingView?.addGestureRecognizer(tapRecognizer)
    }
    
    func dimmingViewTapped(tapRecognizer: UITapGestureRecognizer) {
        presentingViewController.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func presentationTransitionWillBegin() {
        let containerView = self.containerView
        let presentedViewController = self.presentedViewController
        
        dimmingView?.frame = containerView!.bounds
        dimmingView?.alpha = 0.0
        
        containerView!.insertSubview(dimmingView!, atIndex: 0)
        presentedViewController.transitionCoordinator()?.animateAlongsideTransition({ (coordinatorContext) -> Void in
            self.dimmingView?.alpha = 1.0
            }, completion: nil)
    }
    
    override func dismissalTransitionWillBegin() {
        presentedViewController.transitionCoordinator()?.animateAlongsideTransition({ (coordinatorContext) -> Void in
            self.dimmingView?.alpha = 0.0
            }, completion: nil)
    }
    
    override func containerViewWillLayoutSubviews() {
        dimmingView?.frame = containerView!.bounds
        presentedView()!.frame = frameOfPresentedViewInContainerView()
    }
    
    override func sizeForChildContentContainer(container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        
        
        return CGSizeMake(parentSize.width * 0.75, parentSize.height * 0.75)
    }
    
    override func frameOfPresentedViewInContainerView() -> CGRect {
        var presentedViewFrame = CGRectZero
        let containerBounds = containerView!.bounds
        
        let contentContainer = presentedViewController
        presentedViewFrame.size = sizeForChildContentContainer(contentContainer, withParentContainerSize: containerBounds.size)
        
        
        presentedViewFrame.origin.x = presentingViewController.view.frame.size.width/2 - presentedViewFrame.size.width/2
        
        presentedViewFrame.origin.y = presentingViewController.view.frame.size.height/2 - presentedViewFrame.size.height/2
        
        return presentedViewFrame
    }
    
}
