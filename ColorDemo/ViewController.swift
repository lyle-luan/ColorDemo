//
//  ViewController.swift
//  ColorDemo
//
//  Created by Aaron on 3/26/15.
//  Copyright (c) 2015 Aaron. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    var isOpened = false
    var animateConstracts = [AnyObject]()
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view5: UIView!
    
    
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    @IBAction func tap(sender: UITapGestureRecognizer)
    {
        if (isOpened)
        {
            UIView.animateWithDuration(0.3){
                self.view.removeConstraints(self.animateConstracts)
                let formate = "V:[view5(60)]-0-[view4(60)]-0-[view3(60)]-0-[view2(60)]-0-[view1(60)]-0-|"
                let dic = NSDictionary(objectsAndKeys: self.view5, "view5",
                    self.view4, "view4",
                    self.view3, "view3",
                    self.view2, "view2",
                    self.view1, "view1")
                self.animateConstracts = NSLayoutConstraint.constraintsWithVisualFormat(formate, options: NSLayoutFormatOptions.allZeros, metrics: nil, views: dic)
                self.view.addConstraints(self.animateConstracts)
                self.view.layoutIfNeeded()
            }
            isOpened = false
        }
        else
        {
            UIView.animateWithDuration(0.8){
                self.view.removeConstraints(self.animateConstracts)
                var formate = ""
                if let tag = sender.view?.tag
                {
                    switch tag
                    {
                    case 5:
                        formate = "V:|-0-[view5(\(CGRectGetHeight(self.view.bounds)))]-0-[view4(0)]-0-[view3(0)]-0-[view2(0)]-0-[view1(0)]"
                    case 4:
                        formate = "V:|-(0)-[view5(0)]-0-[view4(\(CGRectGetHeight(self.view.bounds)))]-0-[view3(0)]-0-[view2(0)]-0-[view1(0)]"
                    case 3:
                        formate = "V:|-(0)-[view5(0)]-0-[view4(0)]-0-[view3(\(CGRectGetHeight(self.view.bounds)))]-0-[view2(0)]-0-[view1(0)]"
                    case 2:
                        formate = "V:|-(0)-[view5(0)]-0-[view4(0)]-0-[view3(0)]-0-[view2(\(CGRectGetHeight(self.view.bounds)))]-0-[view1(0)]"
                    case 1:
                        formate = "V:|-(0)-[view5(0)]-0-[view4(0)]-0-[view3(0)]-0-[view2(0)]-0-[view1(\(CGRectGetHeight(self.view.bounds)))]"
                    default:
                        formate = "V:|-(0)-[view5(0)]-0-[view4(0)]-0-[view3(0)]-0-[view2(0)]-0-[view1(0)]"
                    }
                    println("tag: \(tag)")
                    println("formate: \(formate)")
                }
                
                let dic = NSDictionary(objectsAndKeys: self.view5, "view5",
                    self.view4, "view4",
                    self.view3, "view3",
                    self.view2, "view2",
                    self.view1, "view1")
                self.animateConstracts = NSLayoutConstraint.constraintsWithVisualFormat(formate, options: NSLayoutFormatOptions.allZeros, metrics: nil, views: dic)
                self.view.addConstraints(self.animateConstracts)
                self.view.layoutIfNeeded()
            }
            isOpened = true
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        view1.backgroundColor = UIColor(red: 233/255.0, green: (35 + 30*0)/255.0, blue: 29/255.0, alpha: 1)
        view2.backgroundColor = UIColor(red: 233/255.0, green: (35 + 30*1)/255.0, blue: 29/255.0, alpha: 1)
        view3.backgroundColor = UIColor(red: 233/255.0, green: (35 + 30*2)/255.0, blue: 29/255.0, alpha: 1)
        view4.backgroundColor = UIColor(red: 233/255.0, green: (35 + 30*3)/255.0, blue: 29/255.0, alpha: 1)
        view5.backgroundColor = UIColor(red: 233/255.0, green: (35 + 30*4)/255.0, blue: 29/255.0, alpha: 1)
    }
}

