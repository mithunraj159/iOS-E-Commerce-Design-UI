//
//  ViewController.swift
//  ECommerce
//
//  Created by Mithun on 27/11/17.
//  Copyright © 2017 2basetechnologies. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let gotoHome = self.storyboard!.instantiateViewController(withIdentifier:"HomeViewController")
        self.navigationController!.pushViewController(gotoHome, animated: false)
        
//        let gotoHome = self.storyboard!.instantiateViewController(withIdentifier:"DetailsViewController")
//        self.navigationController!.pushViewController(gotoHome, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

