//
//  FashionViewController.swift
//  ECommerce
//
//  Created by Mithun on 08/12/17.
//  Copyright © 2017 2basetechnologies. All rights reserved.
//

import UIKit

class FashionViewController: UIViewController,  UITableViewDelegate, UITableViewDataSource,UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var fashionScroll : UIScrollView!
    @IBOutlet weak var fashionCollection : UICollectionView!
    @IBOutlet weak var mainTable : UITableView!
    @IBOutlet weak var categoryTable : UITableView!
    @IBOutlet weak var searchText : UITextField!
    @IBOutlet weak var dealsButton : UIButton!
    @IBOutlet weak var searchButton : UIButton!
    @IBOutlet weak var mycartButton : UIButton!
    @IBOutlet weak var myaccountButton : UIButton!
    
    
    let section = ["Bags", "New Arrivals | Men", "New Arrivals | Women", "Collections", "Sportswear"]
    
     var fashionimageArray = [UIImage(named: "fashionbags.jpg"), UIImage(named: "newarrivalmen.jpeg"), UIImage(named: "newarrivalladies.jpg"), UIImage(named: "collections.jpg"), UIImage(named: "sportswear.jpg"), UIImage(named: "outlet.jpg"), UIImage(named: "women.jpeg"), UIImage(named: "men.jpg")]
    
    var fashionnameArray = ["Bags", "New Arrivals Men", "New Arrivals Women","Collections", "Sportswear", "Outlet", "Women", "Men"]
    
    var tableimageArray = [UIImage(named: "tablemen.jpg"), UIImage(named: "tablewomen.jpg"), UIImage(named: "tableparty.jpg"), UIImage(named: "tablestreet.jpg"), UIImage(named: "tableshoes.jpeg"), UIImage(named: "tablewomenslipers.jpeg"), UIImage(named: "tableprinted.jpg"), UIImage(named: "tabletshirts.jpeg")]
    
    var tablenameArray = ["MEN NEW ARRIVALS", "WOMEN NEW ARRIVALS", "PARTY WEAR","STREETWEAR/SNEAKERS", "NEW/MEN SHOES-UP TO 60% OFF", "NEW/WOMEN SHOES-UP TO 60% OFF", "PERFECT PRINTS - UP TO 60%", "MEN/T-SHIRTS"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // FOR NAVIGATION BAR TITLE
        self.title = "FASHION"
        
        // FOR CHANGING THE NAVIGATION BAR DEFAULT COLOR TO WHITE COLOR
        let nav = self.navigationController?.navigationBar
        nav?.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
        // FOR TEXTFIELD RESIGN
        let scrollgesture: UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(handleTap))
        scrollgesture.delegate = self as? UIGestureRecognizerDelegate
        fashionScroll.addGestureRecognizer(scrollgesture)
        
        // FOR SCROLL VIEW
        view.addSubview(fashionScroll)
        
        // FOR TEXTFIELD RESIGN
//        let scrollgesture: UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(handleTap))
//        scrollgesture.delegate = self
//        fashionScroll.addGestureRecognizer(scrollgesture)
        
        // FOR PROGRAMATICALLY SETTING BACK BUTTON IN LEFT SIDE OF NAVIGATION BAR
        let button = UIButton(type: UIButtonType.custom) as UIButton
        button.frame = CGRect(x: 0, y: 0, width: 20, height:30)
        button.setImage(UIImage(named: "backbutton"), for: UIControlState())
        button.addTarget(self, action: #selector(backAction), for: UIControlEvents.touchUpInside)
        let backButton = UIBarButtonItem(customView: button)
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
       // Resign keypads
        searchText.resignFirstResponder()
    }
    
    // BUTTON ACTION OF BACK BUTTON IN NAVIGATION BAR
    @objc func backAction() {
        let gotoHome = self.storyboard!.instantiateViewController(withIdentifier:"HomeViewController")
        self.navigationController!.pushViewController(gotoHome, animated: false)
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
    
    // FOR SCROLL VIEW
    override func viewWillLayoutSubviews(){
        super.viewWillLayoutSubviews()
        fashionScroll.contentSize = CGSize(width: UIScreen.main.bounds.size.width, height: 568)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // COLLECTION VIEW DELEGATES AND DATASOURCES
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return fashionimageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
        cell.fashionImage.image = fashionimageArray[indexPath.row]
        cell.fashionLabel.text = fashionnameArray[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    // TABLE VIEW DELEGATES AND DATASOURCE
    private func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableimageArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "CustomCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CustomCell
        cell.fashionImage.image = tableimageArray[indexPath.row]
        cell.fashionLabel.text = tablenameArray[indexPath.row]
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        return cell
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
