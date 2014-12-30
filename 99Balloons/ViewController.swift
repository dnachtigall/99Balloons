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
    var ballonpicturenamesArray:[String] = []
    var currentIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myImageView.image = UIImage(named: "BerlinTVTower.jpg")
        myTextLabel.textColor = UIColor(white: 0, alpha: 100)
        myTextLabel.text = "Welcome. Press Next to display balloon pictures."
        
        // Make an Array with the names of the 4 BallonPicture Names for easier randomly picking them.
        for var balloons = 1; balloons <= 4; balloons++ {
            ballonpicturenamesArray.append("RedBalloon\(balloons).jpg")
        }
        
        
        // Call make Balloon 99 times and append each returned Balloon to the Balloons Array
        for var i=1; i <= 99; i++ {
            var balloon = makeBalloon()
            balloon.number = i
            balloonsArray.append(balloon)
        }
        
        
        
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
        
        self.myImageView.image = currentBallon.image
        self.myTextLabel.text = "Ballon No. \(currentBallon.number)"
        
    }

    func makeBalloon() -> Balloon {
        
            // Generate Random Number to assign random Image
            let randomNumber = Int(arc4random_uniform(UInt32(4)))
        
            //make the balloon from the struct, give it its random image and then return the Balloon
            var madeBalloon = Balloon()
            madeBalloon.image = UIImage(named: self.ballonpicturenamesArray[randomNumber])
            return madeBalloon
        
        
        
        
    }
    
    
}

