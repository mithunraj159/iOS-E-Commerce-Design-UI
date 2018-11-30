//
//  HomeViewController.swift
//  ECommerce
//
//  Created by Mithun on 27/11/17.
//  Copyright © 2017 2basetechnologies. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UIScrollViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource,UITextFieldDelegate {
    @IBOutlet weak var menuButton : UIBarButtonItem!
    @IBOutlet weak var homeScroll : UIScrollView!
    @IBOutlet weak var searchView : UIView!
    @IBOutlet weak var searchImage : UIImageView!
    @IBOutlet weak var searchText : UITextField!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var pageScroll : UIScrollView!
    @IBOutlet weak var dealsCollection : UICollectionView!
    @IBOutlet weak var categoryCollection : UICollectionView!
    @IBOutlet weak var brandCollection : UICollectionView!
    @IBOutlet weak var perfumeCollection : UICollectionView!
    @IBOutlet weak var supermarketCollection : UICollectionView!
    @IBOutlet weak var clothingCollection : UICollectionView!
    @IBOutlet weak var dealsButton : UIButton!
    @IBOutlet weak var searchButton : UIButton!
    @IBOutlet weak var mycartButton : UIButton!
    @IBOutlet weak var myaccountButton : UIButton!
    
    var scrollWidth : CGFloat = UIScreen.main.bounds.size.width
    var scrollHeight : CGFloat = UIScreen.main.bounds.size.height
    var imageArray = [UIImage(named: "offer1.jpg"), UIImage(named: "offer2.png"), UIImage(named: "offer3.jpg")]
    
    var dealimageArray = [UIImage(named: "deal1.jpg"), UIImage(named: "deal2.png"), UIImage(named: "deal3.jpg"), UIImage(named: "deal4.png"), UIImage(named: "deal5.jpg"), UIImage(named: "deal6.png"), UIImage(named: "deal7.jpg"), UIImage(named: "deal8.jpg")]
    
    var firstcategoryimageArray = [UIImage(named: "category1.jpg"), UIImage(named: "category2.jpg"), UIImage(named: "category5.jpg"), UIImage(named: "category3.jpg"), UIImage(named: "category4.png"), UIImage(named: "category6.png")]
    
    var secondcategoryimageArray = [UIImage(named: "category7.jpg"), UIImage(named: "category8.png"), UIImage(named: "category9.jpg"), UIImage(named: "category10.jpg"), UIImage(named: "category11.jpg"), UIImage(named: "category12.png")]
    
    var brandimageArray = [UIImage(named: "amazon.png"), UIImage(named: "loreal.jpg"), UIImage(named: "Dettol.jpg"), UIImage(named: "motorola.jpeg"), UIImage(named: "pepsi.jpg"), UIImage(named: "dell.jpg"), UIImage(named: "ariel.jpeg"), UIImage(named: "unilever.jpg")]
    
    var perfumeimageArray = [UIImage(named: "creed.jpg"), UIImage(named: "rose.jpg"), UIImage(named: "black.jpg"), UIImage(named: "monparis.JPG"), UIImage(named: "burberry.jpg"), UIImage(named: "intenso.jpg"), UIImage(named: "lacoste.jpg"), UIImage(named: "jaguar.JPG")]
    
    var perfumenameArray = ["Aventus by Creed", "Roses Musk by Montale", "Black Aoud by Montale","Mon Paris by Yves", "Burberry London", "Intenso by Dolce & Gabbana", "Lacoste L.12.12 Yellow Jaune", "Classic Black by Jaguar"]
    
    var supermarketimageArray = [UIImage(named: "corn.jpg"), UIImage(named: "biscuit.jpg"), UIImage(named: "bislerri.jpg"), UIImage(named: "shampoo.jpg"), UIImage(named: "dishwash.jpg"), UIImage(named: "washingpowder.jpg"), UIImage(named: "chocolate.jpg"), UIImage(named: "horlicks.jpg")]
    
    var supermarketnameArray = ["Kellogg's Corn Flakes Cereal, 500 gm", "Milk Bikis, 200 gm", "Bislerri Mineral Water - Pack of 12 Pieces (12 x 1.5L)","Loreal Anti-Hairfall Anti-Dandruff Shampoo 400ml", "Pril All in 1 Gel Grease Cutting Dishwasher Detergent - 670 ml", "Ariel Automatic Laundry Powder Detergent Original Scent 6 kg", "Mars Chocolate, 51 gm - Pack of 12", "Horlicks, 500 gm"]
    
    var clothingimageArray = [UIImage(named: "coat.jpg"), UIImage(named: "shirts.jpeg"), UIImage(named: "tshirts.jpg"), UIImage(named: "tshirtss.jpg"), UIImage(named: "kurtas.jpg"), UIImage(named: "formal.jpg"), UIImage(named: "sarees.jpeg"), UIImage(named: "jeans.jpg")]
    
    var clothingnameArray = ["Supreme Puffer Coat For Men", "IZOD Purple/Blue Cotton Shirt Neck Shirts For Men", "Tommy Hilfiger T-Shirt for Men","Tommy Hilfiger Full Sleeve T-Shirt for Men", "Divya Darshan Casual Kurta & Kurtis For Women", "Pierre Cardin Formal Shirt for Men", "Sarees for Women", "Pepe Jeans Straight Jeans Pant For Men"]

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
        
        // FOR NAVIGATION BAR TITLE
        self.title = "HOME"
        
        // FOR CHANGING THE NAVIGATION BAR DEFAULT COLOR TO WHITE COLOR
        let nav = self.navigationController?.navigationBar
        nav?.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
        // FOR TEXTFIELD RESIGN
       /* let scrollgesture: UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(handleTap))
        scrollgesture.delegate = self as? UIGestureRecognizerDelegate
        perfumeCollection.addGestureRecognizer(scrollgesture)*/
        
        // FOR ROUNDED TEXTFIELD
        searchImage.layer.cornerRadius = 5.0
        searchText.delegate = self
        
        print((pageScroll?.frame.size.width)!)
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
                imgView.image = UIImage(named: "offer1.jpg")
            }
            
            if i == 1 {
                //imgView.backgroundColor = UIColor.blue
                imgView.image = UIImage(named: "offer2.png")
            }
            
            if i == 2 {
                //imgView.backgroundColor = UIColor.blue
                imgView.image = UIImage(named: "offer3.jpg")
            }
            
            pageScroll?.addSubview(imgView)
        }
        // FOR NOT SCROLLING BEYOND THE SCROLL VIEW
        pageScroll.contentSize = CGSize(width : pageScroll.contentSize.width,height : pageScroll.frame.size.height);
        
        // FOR SCROLL VIEW
       view.addSubview(homeScroll)
        
        // FOR SHOWING SIDE BAR MENU
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    // FOR SCROLL VIEW
    override func viewWillLayoutSubviews(){
        super.viewWillLayoutSubviews()
        homeScroll.contentSize = CGSize(width: UIScreen.main.bounds.size.width, height: 1730)
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
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        // Resign keypads
        searchText.resignFirstResponder()
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
        if collectionView == dealsCollection {
        return dealimageArray.count
        }
        else if collectionView == categoryCollection {
            return firstcategoryimageArray.count
        }
        else if collectionView == brandCollection {
            return brandimageArray.count
        }
        else if collectionView == perfumeCollection {
            return perfumeimageArray.count
        }
        else if collectionView == supermarketCollection {
            return supermarketimageArray.count
        }
        else {
        return clothingimageArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == dealsCollection {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
        cell.dealsImage.image = dealimageArray[indexPath.row]
        return cell
        }
        else if collectionView == categoryCollection {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
            cell.categoryfirstImage.image = firstcategoryimageArray[indexPath.row]
            cell.categorysecondImage.image = secondcategoryimageArray[indexPath.row]
            return cell
        }
        else if collectionView == brandCollection {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
            cell.brandImage.image = brandimageArray[indexPath.row]
            return cell
        }
        else if collectionView == perfumeCollection {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
            cell.perfumeImage.image = perfumeimageArray[indexPath.row]
            cell.perfumenameLabel.text = "\(perfumenameArray[indexPath.row])"
            return cell
        }
        else if collectionView == supermarketCollection {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
            cell.supermarketImage.image = supermarketimageArray[indexPath.row]
            cell.supermarketLabel.text = "\(supermarketnameArray[indexPath.row])"
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
            cell.clothingImage.image = clothingimageArray[indexPath.row]
            cell.clothingLabel.text = "\(clothingnameArray[indexPath.row])"
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("working")
        let gotoDescription = self.storyboard!.instantiateViewController(withIdentifier:"DescriptionViewController")
        self.navigationController!.pushViewController(gotoDescription, animated: true)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchText.resignFirstResponder()
        return true
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
//    {
//        return CGSize(width: 100.0, height: 150.0)
//    }
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
