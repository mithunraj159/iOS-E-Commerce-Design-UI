//
//  DealsViewController.swift
//  ECommerce
//
//  Created by Mithun on 07/12/17.
//  Copyright © 2017 2basetechnologies. All rights reserved.
//

import UIKit

class DealsViewController: UIViewController {
    
    @IBOutlet weak var dealScroll : UIScrollView!
    @IBOutlet weak var menuButton : UIBarButtonItem!
    @IBOutlet weak var searchImage : UIImageView!
    @IBOutlet weak var searchText : UITextField!
    @IBOutlet weak var homeButton : UIButton!
    @IBOutlet weak var searchButton : UIButton!
    @IBOutlet weak var mycartButton : UIButton!
    @IBOutlet weak var myaccountButton : UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // FOR NAVIGATION BAR TITLE
        self.title = "DEALS"
        
        // FOR CHANGING THE NAVIGATION BAR DEFAULT COLOR TO WHITE COLOR
        let nav = self.navigationController?.navigationBar
        nav?.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
        searchImage.layer.cornerRadius = 5.0
        
        // FOR TEXTFIELD RESIGN
        let scrollgesture: UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(handleTap))
        scrollgesture.delegate = self as? UIGestureRecognizerDelegate
        dealScroll.addGestureRecognizer(scrollgesture)
        
        // FOR SCROLL VIEW
        view.addSubview(dealScroll)
        
        // FOR SHOWING SIDE BAR MENU
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        // Resign keypads
        searchText.resignFirstResponder()
    }
    
    @IBAction func homeButton(sender:UIButton) {
        let gotoHome = self.storyboard!.instantiateViewController(withIdentifier:"HomeViewController")
        self.navigationController!.pushViewController(gotoHome, animated: true)
    }
    
    @IBAction func searchButton(sender:UIButton) {
        let gotoSearch = self.storyboard!.instantiateViewController(withIdentifier:"SearchViewController")
        self.navigationController!.pushViewController(gotoSearch, animated: false)
    }
    
    @IBAction func mycartButton(sender:UIButton) {
        let gotoCart = self.storyboard!.instantiateViewController(withIdentifier:"CartViewController")
        self.navigationController!.pushViewController(gotoCart, animated: true)
    }
    
    @IBAction func myaccountButton(sender:UIButton) {
        let gotoAccount = self.storyboard!.instantiateViewController(withIdentifier:"AccountViewController")
        self.navigationController!.pushViewController(gotoAccount, animated: true)
    }
    
    override func viewWillLayoutSubviews(){
        super.viewWillLayoutSubviews()
        dealScroll.contentSize = CGSize(width: UIScreen.main.bounds.size.width, height: 1000)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
