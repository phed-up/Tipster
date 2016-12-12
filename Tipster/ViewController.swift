//
//  ViewController.swift
//  Tipster
//
//  Created by skwong on 12/7/16.
//  Copyright © 2016 fedup. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipAmountLbl: UILabel!
    @IBOutlet weak var billAmountTxt: UITextField!
    
    
    
    var runningNumber = ""
    var currentOperation = Equation.Empty
    var leftValStr = ""
    var result: Double = 0.0
    var amazingResult = 0.0
    var deliciouseResult = 0.0
    var firstTimePressed: Bool = false
    var neutralResult = 0.0
    var rudeResult = 0.0
    var foodNeutralResult = 0.0
    var terribleFoodResult = 0.0
    var fastSpeedResult = 0.0
    var neutralSpeedResult = 0.0
    var slowSpeedResult = 0.0
    
    
    
    
    
    
    enum Equation: String
    {
        case amazingService = "amazingService"
        case neutralService = "neutralService%"
        case foodDelicious = "foodDelicious"
        case foodNeutral = "neutralService"
        case rudeService = "rudeService"
        case fastSpeed = "fastSpeed"
        case neutralSpeed = "NeutralSpeed"
        case slowSpeed = "slowSpeed"
        case terribleFood = "terribleFood"
        case Empty = "Empty"
    
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func resetBtn(_ sender: Any) {
        billAmountTxt.text = ""
        tipAmountLbl.text = ""
        result = 0.0
    }
  
    
    @IBAction func amazingServiceBtn(sender: AnyObject) {
        processOperation(operate: .amazingService)
    }
    
    @IBAction func neutralServiceBtn(sender: AnyObject) {
        processOperation(operate: .neutralService)
    }
    
    @IBAction func rudeServiceBtn(sender: AnyObject) {
        processOperation(operate: .rudeService)
    }
   
    @IBAction func foodDeliciousBtn(sender: AnyObject) {
        processOperation(operate: .foodDelicious)
    }
    
    @IBAction func foodNeutralBtn(sender: AnyObject) {
        processOperation(operate: .foodNeutral)
    }

    @IBAction func terribleFoodBen(sender: AnyObject) {
        processOperation(operate: .terribleFood)
    }
    
    @IBAction func fastSpeedBtn(sender: AnyObject) {
        processOperation(operate: .fastSpeed)
    }

    @IBAction func neutralSpeedBen(sender: AnyObject) {
        processOperation(operate: .neutralSpeed)
    }

    @IBAction func slowSpeedBtn(sender: AnyObject) {
        processOperation(operate: .slowSpeed)
    }
    
    
    func processOperation(operate: Equation)
        {
            
            currentOperation = operate
                
                
                if currentOperation == Equation.amazingService
                {
                    amazingResult = (Double(billAmountTxt.text!)! * 0.10)
                    result = result + amazingResult
                    tipAmountLbl.text = "$\(String(result))"
                }
            
                if currentOperation == Equation.neutralService
                {
                    neutralResult = (Double(billAmountTxt.text!)! * 0.05)
                    result = result + neutralResult
                    tipAmountLbl.text = "$\(String(result))"
                }
                if currentOperation == Equation.rudeService
                {
                    rudeResult = (Double(billAmountTxt.text!)! * 0.00)
                    result = result + rudeResult
                    tipAmountLbl.text = "$\(String(result))"
                }
            
                if currentOperation == Equation.foodDelicious
                {
                    deliciouseResult = (Double(billAmountTxt.text!)! * 0.07)
                    result = result + deliciouseResult
                    tipAmountLbl.text = "$\(String(result))"
                }

                if currentOperation == Equation.foodNeutral
                {
                    foodNeutralResult = (Double(billAmountTxt.text!)! * 0.05)
                    result = result + foodNeutralResult
                    tipAmountLbl.text = "$\(String(result))"
                }
            
                if currentOperation == Equation.terribleFood
                {
                    terribleFoodResult = (Double(billAmountTxt.text!)! * 0.00)
                    result = result + terribleFoodResult
                    tipAmountLbl.text = "$\(String(result))"
                }
            
                if currentOperation == Equation.fastSpeed
                {
                    fastSpeedResult = (Double(billAmountTxt.text!)! * 0.07)
                    result = result + fastSpeedResult
                    tipAmountLbl.text = "$\(String(result))"
                }
            
                if currentOperation == Equation.neutralSpeed
                {
                    neutralResult = (Double(billAmountTxt.text!)! * 0.05)
                    result = result + neutralResult
                    tipAmountLbl.text = "$\(String(result))"
                }
            
                if currentOperation == Equation.slowSpeed
                {
                    slowSpeedResult = (Double(billAmountTxt.text!)! * 0.0)
                    result = result + slowSpeedResult
                    tipAmountLbl.text = "$\(String(result))"
            }
        
            
            currentOperation = operate
            
        }
    
}
