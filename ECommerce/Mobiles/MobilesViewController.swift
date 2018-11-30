//
//  MobilesViewController.swift
//  ECommerce
//
//  Created by Mithun on 11/12/17.
//  Copyright © 2017 2basetechnologies. All rights reserved.
//

import UIKit

class MobilesViewController: UIViewController, UIScrollViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var mobileScroll : UIScrollView!
    @IBOutlet weak var pageScroll : UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var bestSellerCollection : UICollectionView!
    @IBOutlet weak var mobileTable : UITableView!
    @IBOutlet weak var dealsButton : UIButton!
    @IBOutlet weak var searchButton : UIButton!
    @IBOutlet weak var mycartButton : UIButton!
    @IBOutlet weak var myaccountButton : UIButton!
    
    var scrollWidth : CGFloat = UIScreen.main.bounds.size.width
    var scrollHeight : CGFloat = UIScreen.main.bounds.size.height
    var imageArray = [UIImage(named: "offer1.jpg"), UIImage(named: "offer2.png"), UIImage(named: "offer3.jpg")]
    
    var sellerimageArray = [UIImage(named: "seller1.png"), UIImage(named: "seller2.jpg"), UIImage(named: "seller3.jpeg"), UIImage(named: "seller4.jpg"), UIImage(named: "seller5.jpg"), UIImage(named: "seller6.jpg"), UIImage(named: "seller7.jpeg"), UIImage(named: "seller8.png")]
    
    var sellernameArray = ["iPhone X", "iPhone 8", "Samsung Galaxy","One Plus 5", "Xiomi Redmi Y", "Honor 8", "iPAD Pro", "Samsung Tablet"]
    
    var fearuredArray = ["Mobile phones","Tablets","Accessories","Headphones","Smartwatches","Power Banks","Memory Cards"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // FOR NAVIGATION BAR TITLE
        self.title = "MOBILES & TABLETS"
        
        // FOR CHANGING THE NAVIGATION BAR DEFAULT COLOR TO WHITE COLOR
        let nav = self.navigationController?.navigationBar
        nav?.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
        //print((pageScroll?.frame.size.width)!)
        pageScroll?.contentSize = CGSize(width: (scrollWidth * 3), height: scrollHeight)
        pageScroll?.delegate = self;
        pageScroll?.isPagingEnabled=true
        
        for i in 0...2 {
            let imgView = UIImageView.init()
            //imgView.frame = CGRect(x: scrollWidth * CGFloat (i), y: 0, width: scrollWidth,height: scrollHeight)
            imgView.frame = CGRect(x: scrollWidth * CGFloat (i), y: 0, width: scrollWidth,height: 150)
            //imgView.backgroundColor = UIColor.red
            if i == 0 {
                //imgView.backgroundColor = UIColor.green
                imgView.image = UIImage(named: "mobiles1.jpg")
            }
            
            if i == 1 {
                //imgView.backgroundColor = UIColor.blue
                imgView.image = UIImage(named: "mobiles2.jpg")
            }
            
            if i == 2 {
                //imgView.backgroundColor = UIColor.blue
                imgView.image = UIImage(named: "mobiles3.jpg")
            }
            
            pageScroll?.addSubview(imgView)
        }
        
        // FOR NOT SCROLLING BEYOND THE SCROLL VIEW
        pageScroll.contentSize = CGSize(width : pageScroll.contentSize.width,height : pageScroll.frame.size.height);
        
        // FOR SCROLL VIEW
        view.addSubview(mobileScroll)
        
        // FOR PROGRAMATICALLY SETTING BACK BUTTON IN LEFT SIDE OF NAVIGATION BAR
        let button = UIButton(type: UIButtonType.custom) as UIButton
        button.frame = CGRect(x: 0, y: 0, width: 20, height:30)
        button.setImage(UIImage(named: "backbutton"), for: UIControlState())
        button.addTarget(self, action: #selector(backAction), for: UIControlEvents.touchUpInside)
        let backButton = UIBarButtonItem(customView: button)
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    // FOR BANNERS
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        setIndiactorForCurrentPage()
    }
    // FOR BANNERS
    func setIndiactorForCurrentPage()  {
        let page = (pageScroll?.contentOffset.x)!/scrollWidth
        pageControl?.currentPage = Int(page)
    }
    
    // FOR SCROLL VIEW
    override func viewWillLayoutSubviews(){
        super.viewWillLayoutSubviews()
        mobileScroll.contentSize = CGSize(width: UIScreen.main.bounds.size.width, height: 1220)
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
    
    // COLLECTION VIEW DELEGATES AND DATASOURCES
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sellerimageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
            cell.bestSellerImage.image = sellerimageArray[indexPath.row]
            cell.bestSellerLabel.text =  sellernameArray[indexPath.row]
            return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let gotoDescription = self.storyboard!.instantiateViewController(withIdentifier:"DescriptionViewController")
        self.navigationController!.pushViewController(gotoDescription, animated: true)
    }
    
    // TABLE VIEW DELEGATES AND DATASOURCE
    private func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return fearuredArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "CustomCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CustomCell
        cell.mobileLabel.text = "\(fearuredArray[indexPath.row])"
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let gotoDescription = self.storyboard!.instantiateViewController(withIdentifier:"DescriptionViewController")
        self.navigationController!.pushViewController(gotoDescription, animated: true)
        
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
