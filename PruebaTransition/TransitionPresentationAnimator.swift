//
//  TransitionPresentationAnimator.swift
//  PruebaTransition
//
//  Created by Alejandro Rodriguez on 11/10/15.
//  Copyright © 2015 Alejandro Rodriguez. All rights reserved.
//

import UIKit

class TransitionPresentationAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.3
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        let containerView = transitionContext.containerView()
        
        
        let animationDuration = self.transitionDuration(transitionContext)
        
        toVC.view.transform = CGAffineTransformMakeScale(0.1, 0.1)
        toVC.view.layer.shadowColor = UIColor.blackColor().CGColor
        toVC.view.layer.shadowOffset = CGSizeMake(0.0, 2.0)
        toVC.view.layer.shadowOpacity = 0.3
        toVC.view.layer.cornerRadius = 4.0
        toVC.view.clipsToBounds = true
        
        containerView?.addSubview(toVC.view)
        
        UIView.animateWithDuration(animationDuration, animations: { () -> Void in
            toVC.view.transform = CGAffineTransformIdentity
            }) { (finished) -> Void in
                transitionContext.completeTransition(finished)
        }
    }
}
