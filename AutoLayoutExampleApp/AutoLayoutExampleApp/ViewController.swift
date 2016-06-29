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
    let selectedItemThumbImg = UIImageView(image: UIImage(named: "burger"))
    let topViewHolder = UIView()
    let mainThumbViewHolder = UIView()
    let buttonViewHolder = UIView()
    let bottomViewHolder = UIView()
    let btnHolderLeft = UIView()
    let btnHolderRight = UIView()
    let btnOrder = UIButton()
    let topThumbBtn = UIButton()
    let topTitleLbl = UILabel()

    var views = Dictionary<String, AnyObject>()
    var constraints = [NSLayoutConstraint]()
    var metrics = Dictionary<String,AnyObject>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.greenColor()
        
        //get device scrrensize, will use it as metrics in addConstrains
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        
        //define some metrics
        metrics = ["screenWidth":  screenSize.width, "screenHeight": screenSize.height, "screenWidthHalf": screenSize.width/2, "screenHeightHalf": screenSize.height/2]

        
        //define ugly colors
        self.topViewHolder.backgroundColor = UIColor.whiteColor()
        self.mainThumbViewHolder.backgroundColor = UIColor.blueColor()
        self.buttonViewHolder.backgroundColor = UIColor.whiteColor()
        self.bottomViewHolder.backgroundColor = UIColor.blackColor()
        self.btnHolderRight.backgroundColor = UIColor.cyanColor()
        self.btnHolderLeft.backgroundColor = UIColor.yellowColor()
        
        self.topThumbBtn.setImage(UIImage(named: "icon_burger"), forState: .Normal)
        self.topTitleLbl.text = "Foodshack"
        self.topTitleLbl.textColor = UIColor.blueColor()
        self.burgerBtn.setImage(UIImage(named: "icon_burger"), forState: .Normal)
        self.pizzaBtn.setImage(UIImage(named: "icon_pizza"), forState: .Normal)
        self.sandwichBtn.setImage(UIImage(named: "icon_sandwich"), forState: .Normal)
        self.tacoBtn.setImage(UIImage(named: "icon_buritto"), forState: .Normal)
        self.btnOrder.setImage(UIImage(named: "order_now"), forState: .Normal)
        
        self.topViewHolder.translatesAutoresizingMaskIntoConstraints = false
        self.mainThumbViewHolder.translatesAutoresizingMaskIntoConstraints  = false
        self.buttonViewHolder.translatesAutoresizingMaskIntoConstraints = false
        self.bottomViewHolder.translatesAutoresizingMaskIntoConstraints = false
        self.topThumbBtn.translatesAutoresizingMaskIntoConstraints = false
        self.topTitleLbl.translatesAutoresizingMaskIntoConstraints = false
        self.selectedItemThumbImg.translatesAutoresizingMaskIntoConstraints = false
        self.burgerBtn.translatesAutoresizingMaskIntoConstraints = false
        self.pizzaBtn.translatesAutoresizingMaskIntoConstraints = false
        self.sandwichBtn.translatesAutoresizingMaskIntoConstraints = false
        self.tacoBtn.translatesAutoresizingMaskIntoConstraints = false
        self.btnHolderLeft.translatesAutoresizingMaskIntoConstraints = false
        self.btnHolderRight.translatesAutoresizingMaskIntoConstraints = false
        self.btnOrder.translatesAutoresizingMaskIntoConstraints = false
        

        //add subviews
        self.view.addSubview(topViewHolder)
        self.view.addSubview(mainThumbViewHolder)
        self.view.addSubview(buttonViewHolder)
        self.view.addSubview(bottomViewHolder)
        
        self.topViewHolder.addSubview(self.topThumbBtn)
        self.topViewHolder.addSubview(self.topTitleLbl)

        self.mainThumbViewHolder.addSubview(self.selectedItemThumbImg)
        self.buttonViewHolder.addSubview(self.btnHolderLeft)
        self.buttonViewHolder.addSubview(self.btnHolderRight)
        
        self.btnHolderLeft.addSubview(self.burgerBtn)
        self.btnHolderLeft.addSubview(self.pizzaBtn)
        self.btnHolderRight.addSubview(self.sandwichBtn)
        self.btnHolderRight.addSubview(self.tacoBtn)
        self.bottomViewHolder.addSubview(btnOrder)

        
        //center the big image
        NSLayoutConstraint(item: selectedItemThumbImg, attribute: .CenterX, relatedBy: .Equal, toItem: mainThumbViewHolder, attribute: .CenterX, multiplier: 1, constant: 0).active = true
        NSLayoutConstraint(item: selectedItemThumbImg, attribute: .CenterY, relatedBy: .Equal, toItem: mainThumbViewHolder, attribute: .CenterY, multiplier: 1, constant: 0).active = true
        
        
        self.views["topViewHolder"] = topViewHolder
        self.views["mainThumbViewHolder"] = mainThumbViewHolder
        self.views["buttonViewHolder"] = buttonViewHolder
        self.views["bottomViewHolder"] = bottomViewHolder
        self.views["topThumbBtn"] = topThumbBtn
        self.views["topTitleLbl"] = topTitleLbl
        self.views["selectedItemThumbImg"] = selectedItemThumbImg
        self.views["burgerBtn"] = burgerBtn
        self.views["pizzaBtn"] = pizzaBtn
        self.views["sandwichBtn"] = sandwichBtn
        self.views["tacoBtn"] = tacoBtn
        self.views["btnHolderLeft"] = btnHolderLeft
        self.views["btnHolderRight"] = btnHolderRight
        self.views["btnOrder"] = btnOrder
        
        setConstraints()
        
    }

    
    func setConstraints(){
        

        /** Top View Holder **/
        addConstraint("V:|-[topViewHolder(50)]-0-[mainThumbViewHolder]", options: [], metrics: self.metrics)
        addConstraint("H:|-0-[topViewHolder]-0-|", options: [], metrics: self.metrics)

        /** Main Button Holder **/
        addConstraint("V:[mainThumbViewHolder(<=250,>=180)]-0-[buttonViewHolder(<=210,>=50)]-0-[bottomViewHolder(50@250)]-0-|", options: [], metrics: self.metrics)
        addConstraint("H:|-0-[mainThumbViewHolder(==topViewHolder)]-0-|", options: [], metrics: self.metrics)
        addConstraint("H:|-0-[buttonViewHolder]-0-|", options: [], metrics: self.metrics)

        /** Button View Holder **/
        //addConstraint("V:[bottomViewHolder]-|", options: [], metrics: self.metrics)
        addConstraint("H:|-0-[bottomViewHolder]-0-|", options: [], metrics: self.metrics)

        /** Main Thumb Image **/
        addConstraint("V:|-(>=5)-[selectedItemThumbImg(<=150)]-(>=5)-|", options: [], metrics: self.metrics)
        addConstraint("H:|-(>=5)-[selectedItemThumbImg(<=150)]-(>=5)-|", options: [], metrics: self.metrics)

        /** Top Thumb Button**/
        addConstraint("V:|-(>=5)-[topThumbBtn(40)]", options: [], metrics: self.metrics)
        addConstraint("H:|-(>=5)-[topThumbBtn(40)]-10-[topTitleLbl]", options: [], metrics: self.metrics)
        
        /** Top Title Lable **/
        addConstraint("V:|-8-[topTitleLbl(40)]", options: [], metrics: self.metrics)
        addConstraint("H:[topTitleLbl(>=50)]", options: [], metrics: self.metrics)

        /** Button Holder **/
        addConstraint("V:|-0-[btnHolderRight]-0-|", options: [], metrics: self.metrics)
        addConstraint("V:|-0-[btnHolderLeft]-0-|", options: [], metrics: self.metrics)
        addConstraint("H:|-0-[btnHolderLeft(>=screenWidthHalf,<=screenWidth)]-0-[btnHolderRight(>=screenWidthHalf,<=screenWidth)]-0-|", options: [], metrics: self.metrics)

        /** Buttons Left **/
        addConstraint("V:|-0-[burgerBtn(50)]", options: [], metrics: self.metrics)
        addConstraint("V:[pizzaBtn(50)]-0-|", options: [], metrics: self.metrics)
        addConstraint("H:|-(50)-[burgerBtn(50)]", options: [], metrics: self.metrics)
        addConstraint("H:[pizzaBtn(50)]-(50)-|", options: [], metrics: self.metrics)
        
        /** Buttons Right **/
        addConstraint("V:|-0-[tacoBtn(50)]", options: [], metrics: self.metrics)
        addConstraint("V:[sandwichBtn(50)]-0-|", options: [], metrics: self.metrics)
        addConstraint("H:|-(50)-[tacoBtn(50)]", options: [], metrics: self.metrics)
        addConstraint("H:[sandwichBtn(50)]-(50)-|", options: [], metrics: self.metrics)
        
        /** Order Button **/
        addConstraint("V:[btnOrder(25)]-(>=10,<=20)-|", options: [], metrics: metrics)
        addConstraint("H:[btnOrder(120)]-(>=10,<=20)-|", options: [], metrics: metrics)
        
        
        NSLayoutConstraint.activateConstraints(self.constraints)
        
        print("setConstraint")
    }
    
    
    func addConstraint(format: String, options: NSLayoutFormatOptions, metrics: Dictionary<String,AnyObject>) {
    
         let newConstraints = NSLayoutConstraint.constraintsWithVisualFormat(format, options: options, metrics: metrics, views: self.views)
         self.constraints += newConstraints
    
    }
    
    

}

