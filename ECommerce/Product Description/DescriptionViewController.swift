//
//  DescriptionViewController.swift
//  ECommerce
//
//  Created by Mithun on 12/12/17.
//  Copyright © 2017 2basetechnologies. All rights reserved.
//

import UIKit


class DescriptionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var descriptionScroll : UIScrollView!
    @IBOutlet weak var descriptionCollection : UICollectionView!
    @IBOutlet weak var reviewCollection : UICollectionView!
    @IBOutlet weak var buyCollection : UICollectionView!
    @IBOutlet weak var addtocartButton : UIButton!
    @IBOutlet weak var cartView : UIView!
    @IBOutlet weak var cartButton : UIButton!
    @IBOutlet weak var wishlistButton : UIButton!
    @IBOutlet weak var changecityButton : UIButton!
    @IBOutlet weak var color1Button : UIButton!
    @IBOutlet weak var color2Button : UIButton!
    @IBOutlet weak var memory1Button : UIButton!
    @IBOutlet weak var memory2Button : UIButton!
    @IBOutlet weak var dealsButton : UIButton!
    @IBOutlet weak var searchButton : UIButton!
    @IBOutlet weak var mycartButton : UIButton!
    @IBOutlet weak var myaccountButton : UIButton!
    
    var cartvalue : Int!
    
    var warrantynameArray = ["Souq.com 2 Years warranty", "2 years accidental damage"]
    var warrantypriceArray = ["Free","327.00 SAR"]
    
     var sellerimageArray = [UIImage(named: "seller1.png"), UIImage(named: "seller2.jpg"), UIImage(named: "seller3.jpeg"), UIImage(named: "seller4.jpg"), UIImage(named: "seller5.jpg"), UIImage(named: "seller6.jpg"), UIImage(named: "seller7.jpeg"), UIImage(named: "seller8.png")]
    
    var sellernameArray = ["iPhone X", "iPhone 8", "Samsung Galaxy","One Plus 5", "Xiomi Redmi Y", "Honor 8", "iPAD Pro", "Samsung Tablet"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // FOR NAVIGATION BAR TITLE
        self.title = "Apple iPhone X"
        
        // FOR CHANGING THE NAVIGATION BAR DEFAULT COLOR TO WHITE COLOR
        let nav = self.navigationController?.navigationBar
        nav?.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
        cartvalue = 0
        
        // FOR BUTTON BORDER COLOR AND TITLE COLOR WHILE LOADING
        color1Button.layer.borderColor = UIColor.init(red: 0.0/255.0, green: 147.0/255.0, blue: 250.0/255.0, alpha: 1).cgColor
        color1Button.layer.borderWidth = 1.5
        
        color2Button.layer.borderColor = UIColor.lightGray.cgColor
        color2Button.layer.borderWidth = 1.5
        
        memory1Button.layer.borderColor = UIColor.lightGray.cgColor
        memory1Button.layer.borderWidth = 1.5
        
        memory2Button.layer.borderColor = UIColor.init(red: 0.0/255.0, green: 147.0/255.0, blue: 250.0/255.0, alpha: 1).cgColor
        memory2Button.layer.borderWidth = 1.5
        
        // FOR SCROLL VIEW
        view.addSubview(descriptionScroll)
        
        // FOR PROGRAMATICALLY SETTING BACK BUTTON IN LEFT SIDE OF NAVIGATION BAR
        let button = UIButton(type: UIButtonType.custom) as UIButton
        button.frame = CGRect(x: 0, y: 0, width: 20, height:30)
        button.setImage(UIImage(named: "backbutton"), for: UIControlState())
        button.addTarget(self, action: #selector(backAction), for: UIControlEvents.touchUpInside)
        let backButton = UIBarButtonItem(customView: button)
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    // FOR SCROLL VIEW
    override func viewWillLayoutSubviews(){
        super.viewWillLayoutSubviews()
        descriptionScroll.contentSize = CGSize(width: UIScreen.main.bounds.size.width, height: 1650)
    }
    
    // BUTTON ACTION OF BACK BUTTON IN NAVIGATION BAR
    @objc func backAction() {
        let gotoHome = self.storyboard!.instantiateViewController(withIdentifier:"HomeViewController")
        self.navigationController!.pushViewController(gotoHome, animated: true)
    }
    
    // BUTTON ACTION FOR ADDTOCART BUTTON
    @IBAction func addtocartButton(sender:UIButton) {
        let gotoCart = self.storyboard!.instantiateViewController(withIdentifier:"CartViewController")
        self.navigationController!.pushViewController(gotoCart, animated: true)
    }
    
    // BUTTON ACTION FOR CHANGING BORDER COLOR AND CONTENT COLOR
    @IBAction func color1Button(sender:UIButton) {
        color2Button.layer.borderColor = UIColor.lightGray.cgColor
        color2Button.layer.borderWidth = 1.5
        color2Button.setTitleColor(UIColor.black, for: .normal)
        
        color1Button.layer.borderColor = UIColor.init(red: 0.0/255.0, green: 147.0/255.0, blue: 250.0/255.0, alpha: 1).cgColor
        color1Button.layer.borderWidth = 1.5
        color1Button.setTitleColor(UIColor.init(red: 0.0/255.0, green: 147.0/255.0, blue: 250.0/255.0, alpha: 1), for: .normal)
    }
    
    // BUTTON ACTION FOR CHANGING BORDER COLOR AND CONTENT COLOR
    @IBAction func color2Button(sender:UIButton) {
        color2Button.layer.borderColor = UIColor.init(red: 0.0/255.0, green: 147.0/255.0, blue: 250.0/255.0, alpha: 1).cgColor
        color2Button.layer.borderWidth = 1.0
        color2Button.setTitleColor(UIColor.init(red: 0.0/255.0, green: 147.0/255.0, blue: 250.0/255.0, alpha: 1), for: .normal)
        
        color1Button.layer.borderColor = UIColor.lightGray.cgColor
        color1Button.layer.borderWidth = 1.0
        color1Button.setTitleColor(UIColor.black, for: .normal)
    }
    
    // BUTTON ACTION FOR CHANGING BORDER COLOR AND CONTENT COLOR
    @IBAction func memory1Button(sender:UIButton) {
        memory2Button.layer.borderColor = UIColor.lightGray.cgColor
        memory2Button.layer.borderWidth = 1.5
        memory2Button.setTitleColor(UIColor.black, for: .normal)
        
        memory1Button.layer.borderColor = UIColor.init(red: 0.0/255.0, green: 147.0/255.0, blue: 250.0/255.0, alpha: 1).cgColor
        memory1Button.layer.borderWidth = 1.5
        memory1Button.setTitleColor(UIColor.init(red: 0.0/255.0, green: 147.0/255.0, blue: 250.0/255.0, alpha: 1), for: .normal)
    }
    
    // BUTTON ACTION FOR CHANGING BORDER COLOR AND CONTENT COLOR
    @IBAction func memory2Button(sender:UIButton) {
        memory1Button.layer.borderColor = UIColor.lightGray.cgColor
        memory1Button.layer.borderWidth = 1.5
        memory1Button.setTitleColor(UIColor.black, for: .normal)
        
        memory2Button.layer.borderColor = UIColor.init(red: 0.0/255.0, green: 147.0/255.0, blue: 250.0/255.0, alpha: 1).cgColor
        memory2Button.layer.borderWidth = 1.5
        memory2Button.setTitleColor(UIColor.init(red: 0.0/255.0, green: 147.0/255.0, blue: 250.0/255.0, alpha: 1), for: .normal)
    }
    
    // BUTTON ACTION FOR TOP CART BUTTON
    @IBAction func cartButton(sender:UIButton) {
        if cartvalue == 0 {
            cartButton.setImage(UIImage(named: "descriptioncartselected")!, for: .normal)
            self.view.makeToast("Item addded to cart", duration: 3.0, position: .center)
            cartvalue = 1
        }
        else {
            cartvalue = 0
            cartButton.setImage(UIImage(named: "descriptioncart")!, for: .normal)
            self.view.makeToast("Item removed from cart", duration: 3.0, position: .center)
        }
    }
    
    // BUTTON ACTION FOR WISH LIST BUTTON
    @IBAction func wishlistButton(sender:UIButton) {
        if cartvalue == 0 {
            wishlistButton.setImage(UIImage(named: "wishlist")!, for: .normal)
            self.view.makeToast("Item removed from wishlist", duration: 3.0, position: .center)
            cartvalue = 1
        }
        else {
            cartvalue = 0
            wishlistButton.setImage(UIImage(named: "wishlistselected")!, for: .normal)
            self.view.makeToast("Item added to wishlist", duration: 3.0, position: .center)
        }
    }
    
    @IBAction func changecityButton(sender:UIButton) {
        print("hello")
        let gotoCart = self.storyboard!.instantiateViewController(withIdentifier:"CartViewController")
        self.navigationController!.pushViewController(gotoCart, animated: false)
    }
    
    @IBAction func dealButton(sender:UIButton) {
        let gotoDeal = self.storyboard!.instantiateViewController(withIdentifier:"DealsViewController")
        self.navigationController!.pushViewController(gotoDeal, animated: true)
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
    
    // COLLECTION VIEW DELEGATES AND DATASOURCES
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == descriptionCollection {
            return warrantynameArray.count
        }
        else if collectionView == reviewCollection {
            return sellernameArray.count
        }
        else {
            return sellernameArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            if collectionView == descriptionCollection {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
            cell.warrantyLabel.text = "\(warrantynameArray[indexPath.row])"
            cell.warrantypriceLabel.text = "\(warrantypriceArray[indexPath.row])"
            cell.warrantyView.layer.borderColor = UIColor.lightGray.cgColor
            cell.warrantyView.layer.borderWidth = 1.5
            return cell
        }
            else if collectionView == reviewCollection {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
            cell.reviewView.layer.borderColor = UIColor.lightGray.cgColor
            cell.reviewView.layer.borderWidth = 1.5
            return cell
        }
            else {
              let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
            cell.buyImage.image = sellerimageArray[indexPath.row]
            cell.buyLabel.text =  sellernameArray[indexPath.row]
              return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == descriptionCollection {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderWidth = 1.5
        cell?.layer.borderColor = UIColor.init(red: 0.0/255.0, green: 147.0/255.0, blue: 250.0/255.0, alpha: 1).cgColor
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if collectionView == descriptionCollection {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderWidth = 1.5
        cell?.layer.borderColor = UIColor.lightGray.cgColor
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
