//
//  TransitionDismissalAnimator.swift
//  PruebaTransition
//
//  Created by Alejandro Rodriguez on 11/10/15.
//  Copyright © 2015 Alejandro Rodriguez. All rights reserved.
//

import UIKit

class TransitionDismissalAnimator: NSObject, UIViewControllerAnimatedTransitioning {

    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.3
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)! as UIViewController
        
        let animationDuration = self .transitionDuration(transitionContext)
        
        UIView.animateWithDuration(animationDuration, animations: { () -> Void in
            fromViewController.view.alpha = 0.0
            fromViewController.view.transform = CGAffineTransformMakeScale(0.1, 0.1)
            }) { (finished) -> Void in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        }
        
    }
    
}
