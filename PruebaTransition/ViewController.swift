//
//  ViewController.swift
//  PruebaTransition
//
//  Created by Alejandro Rodriguez on 11/10/15.
//  Copyright © 2015 Alejandro Rodriguez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let detailTransitioningDelegate : PresentationManager = PresentationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let detailVC = segue.destinationViewController as! DetailViewController
        detailVC.transitioningDelegate = detailTransitioningDelegate
        detailVC.modalPresentationStyle = .Custom
    }

}

