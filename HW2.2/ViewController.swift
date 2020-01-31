//
//  ViewController.swift
//  HW2.2
//
//  Created by Алексей Маслобоев on 31.01.2020.
//  Copyright © 2020 Алексей Маслобоев. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    
    @IBOutlet weak var colorView: UIView!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupColorView()
        setupSliders()
        changeColor()
    }
    
    // MARK: - Private Methods
    
    private func setupColorView() {
        colorView.layer.cornerRadius = 20
    }
    
    private func setupSliders() {
        setupSlider(slider: redSlider, color: UIColor.red)
        setupSlider(slider: greenSlider, color: UIColor.green)
        setupSlider(slider: blueSlider, color: UIColor.blue)
    }
    
    private func setupSlider(slider: UISlider, color: UIColor) {
        slider.minimumTrackTintColor = color
        slider.setValue(Float.random(in: 0.0..<1.0), animated: false)
    }
    
    private func changeColor() {
        changeText()
        
        let red = CGFloat(redSlider.value)
        let green = CGFloat(greenSlider.value)
        let blue = CGFloat(blueSlider.value)
        
        colorView.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
    
    private func changeText() {
        let redText = floatString(redSlider.value)
        let greenText = floatString(greenSlider.value)
        let blueText = floatString(blueSlider.value)
        
        redLabel.text = redText
        greenLabel.text = greenText
        blueLabel.text = blueText
        
        redTextField.text = redText
        greenTextField.text = greenText
        blueTextField.text = blueText
    }
    
    private func floatString(_ value: Float) -> String {
        return String(format: "%.2f", value)
    }
    
    // MARK: - IBActions
    
    @IBAction func changeColorAction() {
        changeColor()
    }
    
}

