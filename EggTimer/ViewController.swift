//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    
    @IBOutlet weak var titleLabel: UILabel!
    

    @IBOutlet weak var progressBar: UIProgressView!

    
    let eggTimes = ["Soft": 3, "Medium":4, "Hard":7];
    
    var timer = Timer();
    
    
    var totalTime = 0;
    
    var secondsPassed = 0;
    
    
    @IBAction func hardnessSelected(_ sender: UIButton)
    {
        print("****");
   
        timer.invalidate();
        let hardness = sender.currentTitle!;
        
        totalTime = eggTimes[hardness]!;
        
        progressBar.progress = 0.0;
        secondsPassed = 0;
        titleLabel.text = hardness;
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        
    }
    
   @objc func updateTimer() {
       if secondsPassed < totalTime {
           
           secondsPassed += 1;
           
           let percentagePassed = Float(secondsPassed) / Float(totalTime);
           
           progressBar.progress = percentagePassed;
           

           
       }
       
       else {
           timer.invalidate();
           titleLabel.text = "DONE!";
       }
       
       
    }
    

}
