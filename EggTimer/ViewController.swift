//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    var player: AVAudioPlayer!
    
    let eggTimes = ["Soft":3, "Medium":5, "Hard":7]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    
    @IBAction func hardnessPressed(_ sender: UIButton) {
        
        timer.invalidate()          //Disabling any previous timers.
        progressBar.progress = 0.0  //Reset progress bar
        secondsPassed = 0           //Reset Seconds passed
        
        let hardness = sender.currentTitle! //Soft, Medium, hard
        totalTime = eggTimes[hardness]!
        
        titleLabel.text = hardness
    

        //let result = eggTimes[hardness]!
        //print(result)
        
        //Initialization of the Timer with interval every 1 second with the function call
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        
            }
    
    @objc func updateTimer() {
        //example functionality
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed)/Float(totalTime)
            //print(Float(secondsPassed)/Float(totalTime))
            
        }
        else {
            // Timer stopping
            playSound(soundName:"alarm_sound")
            timer.invalidate()
            titleLabel.text = "DONE!"
            
            
                 }

        }
    
    func playSound(soundName: String) {
        

        let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
    }
    

