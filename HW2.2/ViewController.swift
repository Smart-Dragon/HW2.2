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
    
    // MARK: - Private Properties
    
    private let defaultLabelSize: CGFloat = 14
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
        setupColorView()
        setupLabels()
        setupTextFields()
        setupSliders()
        changeColor()
    }
    
    // MARK: - Private Methods
    
    private func setupColorView() {
        colorView.layer.cornerRadius = 20
    }
    
    private func setupLabels() {
        redLabel.font = redLabel.font.withSize(defaultLabelSize)
        greenLabel.font = greenLabel.font.withSize(defaultLabelSize)
        blueLabel.font = blueLabel.font.withSize(defaultLabelSize)
    }
    
    private func setupTextFields() {
        setupTextField(redTextField)
        setupTextField(greenTextField)
        setupTextField(blueTextField)
    }
    
    private func setupTextField(_ textField: UITextField) {
        textField.keyboardType = .decimalPad
        textField.delegate = self
        textField.doneAccessory = true
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
    
    private func changeSliderValue() {
        guard let redField = redTextField.text else { return }
        guard let greenField = greenTextField.text else { return }
        guard let blueField = blueTextField.text else { return }
        
        if let red = Float(redField), let green = Float(greenField), let blue = Float(blueField)  {
            redSlider.setValue(red, animated: true)
            greenSlider.setValue(green, animated: true)
            blueSlider.setValue(blue, animated: true)
        }
        else{
            showError("Убедитесь, что вы вводите дробное число без ошибок")
        }
        
        changeColor()
    }
    
    private func showError(_ message: String) {
        let alert = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ок", style: .default)
        alert.addAction(okAction)
        
        present(alert, animated: true)
    }
    
    private func floatString(_ value: Float) -> String {
        return String(format: "%.2f", value)
    }
    
    // MARK: - IBActions
    
    @IBAction func changeColorAction() {
        changeColor()
    }
    
}

// MARK: - Text Field Delegate

extension ViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        changeSliderValue()
    }
    
}
