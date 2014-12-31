//
//  ViewController.swift
//  99Balloons
//
//  Created by David Nachtigall on 30.12.14.
//  Copyright (c) 2014 David Nachtigall. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myTextLabel: UILabel!
    

    var balloonsArray:[Balloon] = []
    var currentIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        myImageView.image = UIImage(named: "BerlinTVTower.jpg")
        myTextLabel.textColor = UIColor(white: 0, alpha: 100)
        myTextLabel.text = "Welcome. Press Next to display balloon pictures."
        
        self.makeBalloons()
        
        println(balloonsArray)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextButtonPressed(sender: AnyObject) {
        // initalize random Index
        var randomIndex:Int
       
        // Creat random index until it's not equal to the current index
        
        do {
        randomIndex = Int(arc4random_uniform(UInt32(balloonsArray.count)))
        } while currentIndex == randomIndex
        
        //set current index to the now accepted random index
        
        currentIndex = randomIndex
        
        //get the new current balloon from the array
        
        let currentBallon = balloonsArray[currentIndex]
        
        // Update Image View and Label with the properties of the fetched Balloon
        
        UIView.transitionWithView(self.view, duration: 1, options: UIViewAnimationOptions.TransitionFlipFromLeft, animations: {
            
            self.myImageView.image = currentBallon.image
            self.myTextLabel.text = "Ballon No. \(currentBallon.number)"

            
            }, completion: {
            
                (finished:Bool) -> () in
                
            })
        
        
    }

    func makeBalloons() {
        
            // Generate 99 Balloons with one of the 4 images randomly assigned
        for var balloonCount = 1; balloonCount <= 99; ++balloonCount {
            var madeBalloon = Balloon()
            madeBalloon.number = balloonCount
            let randomNumber = Int(arc4random_uniform(UInt32(4)))
            madeBalloon.image = UIImage(named: "RedBalloon\(randomNumber + 1).jpg")
            balloonsArray.append(madeBalloon)
        
        }
        
    }
    
    
}

