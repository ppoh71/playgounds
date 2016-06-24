//
//  ViewController.swift
//  AutoLayoutExampleApp
//
//  Created by Peter Pohlmann on 21.06.16.
//  Copyright © 2016 Peter Pohlmann. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let burgerBtn = UIButton()
    let pizzaBtn = UIButton()
    let sandwichBtn = UIButton()
    let tacoBtn = UIButton()
    let orderNowBtn = UIButton()
    let selectetItemThumbImg = UIImageView(image: UIImage(named: "burger"))
    let topViewHolder = UIView()
    let mainThumbViewHolder = UIView()
    let buttonViewHolder = UIView()
    let bottomViewHolder = UIView()
    let topThumbBtn = UIButton()
    let topTitleLbl = UILabel()

    
    var views = Dictionary<String, AnyObject>()
    var constraints = [NSLayoutConstraint]()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.darkGrayColor()
        
        //define colors
        self.topViewHolder.backgroundColor = UIColor.whiteColor()
        self.mainThumbViewHolder.backgroundColor = UIColor.blueColor()
        self.buttonViewHolder.backgroundColor = UIColor.brownColor()
        self.bottomViewHolder.backgroundColor = UIColor.blackColor()
        
        self.topThumbBtn.setImage(UIImage(named: "icon_burger"), forState: .Normal)
        self.topTitleLbl.text = "Foodshack"
        self.topTitleLbl.textColor = UIColor.blueColor()
     

        
        self.topViewHolder.translatesAutoresizingMaskIntoConstraints = false
        self.mainThumbViewHolder.translatesAutoresizingMaskIntoConstraints  = false
        self.buttonViewHolder.translatesAutoresizingMaskIntoConstraints = false
        self.bottomViewHolder.translatesAutoresizingMaskIntoConstraints = false
        self.topThumbBtn.translatesAutoresizingMaskIntoConstraints = false
        self.topTitleLbl.translatesAutoresizingMaskIntoConstraints = false
        self.selectetItemThumbImg.translatesAutoresizingMaskIntoConstraints = false

        
        
        //add subviews
        self.view.addSubview(topViewHolder)
        self.view.addSubview(mainThumbViewHolder)
        self.view.addSubview(buttonViewHolder)
        self.view.addSubview(bottomViewHolder)
        self.topViewHolder.addSubview(topThumbBtn)
        self.topViewHolder.addSubview(topTitleLbl)

        self.mainThumbViewHolder.addSubview(selectetItemThumbImg)
        
        
        self.views["topViewHolder"] = topViewHolder
        self.views["mainThumbViewHolder"] = mainThumbViewHolder
        self.views["buttonViewHolder"] = buttonViewHolder
        self.views["bottomViewHolder"] = bottomViewHolder
        self.views["topThumbBtn"] = topThumbBtn
        self.views["topTitleLbl"] = topTitleLbl
        
        self.views["selectetItemThumbImg"] = selectetItemThumbImg
        
        setConstraints()
        
    }

    
    func setConstraints(){
        
        /** Top View Holder **/
        addConstraint("V:|-[topViewHolder(50)]-0-[mainThumbViewHolder]", option: [])
        addConstraint("H:|-0-[topViewHolder]-0-|", option: [])
        
        /** Main View Holder**/
        addConstraint("V:[mainThumbViewHolder(<=250)]", option: [])
        addConstraint("V:[mainThumbViewHolder(>=180)]", option: [])
        addConstraint("H:|-0-[mainThumbViewHolder(==topViewHolder)]-0-|", option: [])
        
        /** Main Button Holder **/
        addConstraint("V:[mainThumbViewHolder]-0-[buttonViewHolder(<=200)]-0-[bottomViewHolder]", option: [])
        addConstraint("V:[buttonViewHolder(>=50)]", option: [])
        addConstraint("H:|-0-[buttonViewHolder]-0-|", option: [.AlignAllCenterY])
        
        /** Button View Holder **/
        addConstraint("V:[bottomViewHolder(50@250)]-|", option: [])
        addConstraint("H:|-0-[bottomViewHolder]-0-|", option: [])
        
        /** Top Thumb Button**/
        addConstraint("V:|-5-[topThumbBtn(40)]", option: [])
        addConstraint("H:|-5-[topThumbBtn(40)]-10-[topTitleLbl]", option: [])
        
        /** Top Title Lable **/
        addConstraint("V:|-8-[topTitleLbl(40)]", option: [])
        addConstraint("H:[topTitleLbl(>=50)]", option: [])
        
        /** Main Thumb Image **/
        addConstraint("V:|-10-[selectetItemThumbImg(150)]", option: [])
        addConstraint("H:|-(>=50)-[selectetItemThumbImg(100)]", option: [.AlignAllCenterX, .AlignAllCenterY])



       
        
        
        NSLayoutConstraint.activateConstraints(self.constraints)
        
        print("setConstraint")
    }
    
    
    func addConstraint(format: String, option: NSLayoutFormatOptions){
    
         let newConstraints = NSLayoutConstraint.constraintsWithVisualFormat(format, options: option, metrics: nil, views: self.views)
         self.constraints += newConstraints
    
    }
    
    

}

