//
//  MenuViewController.swift
//  ECommerce
//
//  Created by Mithun on 27/11/17.
//  Copyright © 2017 2basetechnologies. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var menuTable : UITableView!
    @IBOutlet weak var signinButton : UIButton!
    
    var menuArray : NSMutableArray!
    var menuImageArray : NSMutableArray!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // FOR ROUNDED BUTTON
        signinButton.layer.cornerRadius = 20
        
        // FOR SHOWING IMAGES AND CONTENTS IN THE SIDE BAR MENU TABLE
        menuArray = ["DEALS", "FASHION", "MOBILES & TABLETS","KITCHEN AND DINING", "HOME, TOOLS & DECOR", "SPORTS & FITNESS", "COMPUTERS & SOFTWARE", "BABY & TOYS", "GROCERY", "PERFUMES & BEAUTY", "AUDIO & VIDEO", "CAMERAS", "FASHION ACCESSORIES", "GAMES & CONSOLES"]
        
        menuImageArray = ["menudeals", "fashion_menu", "mobiles", "kitchen", "menuhome", "sports", "computers", "toys", "grocery", "perfumes", "audio", "cameras", "fashion_ring", "games"]
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let revealController: SWRevealViewController = self.revealViewController()
        let frontNavigationController: UINavigationController = (revealController.frontViewController as AnyObject) as! UINavigationController
        
        if (indexPath.row == 0) {
            
            if !(frontNavigationController.topViewController! is DealsViewController) {
                
                let objDeal = self.storyboard!.instantiateViewController(withIdentifier: "DealsViewController")
                let navigationController: UINavigationController = UINavigationController(rootViewController: objDeal)
                revealController.pushFrontViewController(navigationController, animated: true)
            }
            else {
                revealController.revealToggle(self)
            }
        }
            
            if (indexPath.row == 1) {
                
                if !(frontNavigationController.topViewController! is FashionViewController) {
                    
                    let objFashion = self.storyboard!.instantiateViewController(withIdentifier: "FashionViewController")
                    let navigationController: UINavigationController = UINavigationController(rootViewController: objFashion)
                    revealController.pushFrontViewController(navigationController, animated: true)
                }
                else {
                    revealController.revealToggle(self)
                }
        }
        
        if (indexPath.row == 2) {
            
            if !(frontNavigationController.topViewController! is MobilesViewController) {
                
                let objMobile = self.storyboard!.instantiateViewController(withIdentifier: "MobilesViewController")
                let navigationController: UINavigationController = UINavigationController(rootViewController: objMobile)
                revealController.pushFrontViewController(navigationController, animated: true)
            }
            else {
                revealController.revealToggle(self)
            }
        }
        
        if (indexPath.row == 3) {
            
            if !(frontNavigationController.topViewController! is KitchenViewController) {
                
                let objKitchen = self.storyboard!.instantiateViewController(withIdentifier: "KitchenViewController")
                let navigationController: UINavigationController = UINavigationController(rootViewController: objKitchen)
                revealController.pushFrontViewController(navigationController, animated: true)
            }
            else {
                revealController.revealToggle(self)
            }
        }

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
