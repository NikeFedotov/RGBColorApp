//
//  ViewController.swift
//  RGBColorApp
//
//  Created by Никита on 01.10.2023.
//

import UIKit

// MARK: - ViewController
class ViewController: UIViewController {
    
    // MARK: -  Outlets
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    // MARK: - Override funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 15
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        
        redSlider.value = 255
        greenSlider.value = 219
        blueSlider.value = 139
        
        setColor()
        setValue(for: redLabel, greenLabel, blueLabel)
    }
    
    // MARK: - IBActions
    // Change sliders color
    @IBAction func rgbSlider(_ sender: UISlider) {
        setColor()
                
        switch sender.tag {
        case 0: redLabel.text = remakeSliderToString(from: sender)
        case 1: greenLabel.text = remakeSliderToString(from: sender)
        case 2: blueLabel.text = remakeSliderToString(from: sender)
        default: break
        }
    }
    
    // MARK: - Private methods
    // View color
    private func setColor() {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value) / 255,
                                            green: CGFloat(greenSlider.value) / 255,
                                            blue: CGFloat(blueSlider.value) / 255,
                                            alpha: 1)
    }
    
    // RGB values for labes
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label.tag {
            case 0: redLabel.text = remakeSliderToString(from: redSlider)
            case 1: greenLabel.text = remakeSliderToString(from: greenSlider)
            case 2: blueLabel.text = remakeSliderToString(from: blueSlider)
            default: break
            }
        }
    }
    
    // RGB values
    private func remakeSliderToString(from slider: UISlider) -> String {
        String(Int(slider.value))
    }
}

