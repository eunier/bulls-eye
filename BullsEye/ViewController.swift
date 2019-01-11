//
//  ViewController.swift
//  BullsEye
//
//  Created by Yunier Alvarez on 10/19/18.
//  Copyright © 2018 Yunier Alvarez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let roundMaxPoints: Int = 100
    let onTargetBonus: Int = 100
    let oneOffBunos: Int = 50
    
    var currenctSliderValue: Int = 0
    var targetValue: Int = 0
    var difference: Int = 0
    var points: Int = 0
    var score: Int = 0
    var round: Int = 0
    var average: Int = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var averageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formatSlider()
        reset()
    }
    
    @IBAction func showAlert() {
        difference = abs(currenctSliderValue - targetValue)
        checkPoints()
        score += points
        average = (score / round)
        let title: String
        
        if difference == 0 {
            title = "Perfect!"
        }
        else if difference < 5 {
            title = "You almost had it!"
        }
        else if difference < 10 {
            title = "Pretty good!"
        }
        else {
            title = "Not even close..."
        }
        
        let message = "You score \(points) points."
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome", style: .default, handler: {
            action in
            self.startNewRound()
        })
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        updateCurrentSliderValue()
        print(currenctSliderValue)
    }
    
    func startNewRound() {
        round += 1
        targetValue = Int.random(in: 1...100)
        updateLabels()
        updateCurrentSliderValue()
    }
    
    func updateCurrentSliderValue() {
        currenctSliderValue = Int(slider.value.rounded())
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
        averageLabel.text = String(average)
    }
    
    func checkPoints() {
        points = roundMaxPoints - difference
        
        if points == 100 {
            points += onTargetBonus
        }
        else if points == 99 {
            points += oneOffBunos
        }
    }
    
    @IBAction func startOverPressed(_: UIButton) {
        reset()
    }
    
    func reset() {
        currenctSliderValue = 0
        targetValue = 0
        difference = 0
        points = 0
        score = 0
        round = 0
        average = 0
        startNewRound()
    }
    
    func formatSlider() {
        //let thumbImageNormal = UIImage(cgImage: "SliderThumb-Normal")
        // same as:
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackLeftImageResizeable = trackLeftImage.resizableImage(withCapInsets: insets)
        let trackRightImageResizeable = trackRightImage.resizableImage(withCapInsets: insets)
        
        slider.setThumbImage(thumbImageNormal, for: .normal)
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        slider.setMinimumTrackImage(trackLeftImageResizeable, for: .normal)
        slider.setMaximumTrackImage(trackRightImageResizeable, for: .normal)
    }
}
