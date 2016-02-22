//
//  ViewController.swift
//  Calculator
//
//  Created by Taylor Mott on 10/29/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var textLabel = UILabel()
    var textValue: Float {
        get {
            let text = textLabel.text ?? 0
            return (text as String).floatValue
        }
        set {
            textLabel.text = "\(newValue)"
            isTyping = false
        }
    }
    
    var isTyping = false
    var stack = Stack()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = .blackColor()
        
        textLabel.textAlignment = .Right
        textLabel.font = .systemFontOfSize(50.0)
        textLabel.text = "0"
        textLabel.textColor = .grayColor()
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textLabel)
        
        NSLayoutConstraint.activateConstraints([
            textLabel.widthAnchor.constraintEqualToAnchor(view.widthAnchor),
            textLabel.leadingAnchor.constraintEqualToAnchor(view.leadingAnchor),
            textLabel.topAnchor.constraintEqualToAnchor(view.topAnchor),
            textLabel.bottomAnchor.constraintEqualToAnchor(view.topAnchor, constant: 100)
            ])
        var numbersArray = [UIButton]()
        
        for index in 0...9 {
            let button = UIButton()
            button.layer.borderWidth = 0.5
            button.layer.borderColor = UIColor.blackColor().CGColor
            button.backgroundColor = .lightGrayColor()
            button.setTitle("\(index)", forState: .Normal)
            button.setTitleColor(.blackColor(), forState: .Normal)
            button.titleLabel?.font = .systemFontOfSize(25.0)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: "appendDigit", forControlEvents: .TouchUpInside)
            view.addSubview(button)
            numbersArray.append(button)
        }
        
        let divisionButton = UIButton()
        divisionButton.layer.borderWidth = 0.5
        divisionButton.layer.borderColor = UIColor.blackColor().CGColor
        divisionButton.backgroundColor = .orangeColor()
        divisionButton.setTitle("/", forState: .Normal)
        divisionButton.setTitleColor(.whiteColor(), forState: .Normal)
        divisionButton.titleLabel?.font = .systemFontOfSize(25.0)
        divisionButton.translatesAutoresizingMaskIntoConstraints = false
        divisionButton.addTarget(self, action: "operate:", forControlEvents: .TouchUpInside)
        view.addSubview(divisionButton)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}