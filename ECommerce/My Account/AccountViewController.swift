//
//  AccountViewController.swift
//  ECommerce
//
//  Created by Mithun on 15/12/17.
//  Copyright © 2017 2basetechnologies. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    @IBOutlet weak var homeButton : UIButton!
    @IBOutlet weak var searchButton : UIButton!
    @IBOutlet weak var dealButton : UIButton!
    @IBOutlet weak var mycartButton : UIButton!
    @IBOutlet weak var signinButton : UIButton!
    @IBOutlet weak var accountTable : UITableView!
    
    var menuArray : NSMutableArray!
    var menuImageArray : NSMutableArray!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "My Account"
        
        // FOR ROUNDED BUTTON
        signinButton.layer.cornerRadius = 20
        
        // FOR SHOWING IMAGES AND CONTENTS IN THE SIDE BAR MENU TABLE
        menuArray = ["My Orders", "My Wishlist", "Yours","My Address Book", "News Feed", "Country & Language", "Communication Preferences", "Contact Us", "Call us", "Share with friends", "Leave feedback", "Rate us on App Store"]
        
        menuImageArray = ["menudeals", "mobiles", "kitchen", "menuhome", "sports", "computers", "toys", "grocery", "perfumes", "audio", "cameras", "games"]
    }
    
    @IBAction func homeButton(sender:UIButton) {
        let gotoHome = self.storyboard!.instantiateViewController(withIdentifier:"HomeViewController")
        self.navigationController!.pushViewController(gotoHome, animated: true)
    }
    
    @IBAction func searchButton(sender:UIButton) {
                let gotoSearch = self.storyboard!.instantiateViewController(withIdentifier:"SearchViewController")
                self.navigationController!.pushViewController(gotoSearch, animated: false)
    }
    
    @IBAction func dealButton(sender:UIButton) {
        let gotoDeal = self.storyboard!.instantiateViewController(withIdentifier:"DealsViewController")
        self.navigationController!.pushViewController(gotoDeal, animated: true)
    }
    
    @IBAction func mycartButton(sender:UIButton) {
        let gotoCart = self.storyboard!.instantiateViewController(withIdentifier:"CartViewController")
        self.navigationController!.pushViewController(gotoCart, animated: true)
    }
    
    // TABLE VIEW DELEGATES AND DATASOURCE
    private func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return menuArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "CustomCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CustomCell
        cell.nameLabel.text = "\(menuArray[indexPath.row])"
        cell.menuimage.image =   UIImage(named: "\(menuImageArray[indexPath.row])")
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        return cell
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
