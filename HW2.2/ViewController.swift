//
//  ViewController.swift
//  HW2.2
//
//  Created by Алексей Маслобоев on 31.01.2020.
//  Copyright © 2020 Алексей Маслобоев. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
    }
    
    // MARK: - IBActions
    
    @IBAction func changeRedColorAction() {
        redLabel.text = String(redSlider.value)
    }
    
    @IBAction func changeGreenColorAction() {
        greenLabel.text = String(greenSlider.value)
    }
    
    @IBAction func changeBlueColorAction() {
        blueLabel.text = String(blueSlider.value)
    }
    
}

