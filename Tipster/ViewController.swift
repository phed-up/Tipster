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
    var amazingServiceBtnPressed = false
    var neutralServiceBtnPressed = false
    var rudeServiceBtnPressed = false
    var foodDeliciousBtnPressed = false
    var foodNeutralBtnPressed = false
    var foodTerribleBtnPressed = false
    var fastSpeedBtnPressed = false
    var neutralSpeedBtnPressed = false
    var slowSpeedBtnPressed = false
    
    
    
    
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
        billAmountTxt.keyboardType = UIKeyboardType.decimalPad
    }

    @IBAction func resetBtn(_ sender: Any) {
        billAmountTxt.text = ""
        tipAmountLbl.text = ""
        result = 0.0
        resetBools()
    }
  
    
    @IBAction func amazingServiceBtn(sender: AnyObject) {
        if billAmountTxt.text != ""
        {
        if neutralServiceBtnPressed == false && rudeServiceBtnPressed == false && amazingServiceBtnPressed == false
        {
            processOperation(operate: .amazingService)
            amazingServiceBtnPressed = true
        }
        }
    }
    
    @IBAction func neutralServiceBtn(sender: AnyObject) {
        if billAmountTxt.text != ""
        {
        if amazingServiceBtnPressed == false && rudeServiceBtnPressed == false && neutralServiceBtnPressed == false
        {
        processOperation(operate: .neutralService)
        neutralServiceBtnPressed = true
        }
        }
    }
    
    @IBAction func rudeServiceBtn(sender: AnyObject) {
        if billAmountTxt.text != ""
        {
        if amazingServiceBtnPressed == false && neutralServiceBtnPressed == false && rudeServiceBtnPressed == false
        {
        processOperation(operate: .rudeService)
        rudeServiceBtnPressed = true
        }
        }
    }
   
    @IBAction func foodDeliciousBtn(sender: AnyObject) {
        if billAmountTxt.text != ""
        {
        if foodDeliciousBtnPressed == false && foodNeutralBtnPressed == false && foodTerribleBtnPressed == false
        {
        processOperation(operate: .foodDelicious)
        foodDeliciousBtnPressed = true
        }
        }
    }
    
    @IBAction func foodNeutralBtn(sender: AnyObject) {
        if billAmountTxt.text != ""
        {
         if foodDeliciousBtnPressed == false && foodNeutralBtnPressed == false && foodTerribleBtnPressed == false
         {
        processOperation(operate: .foodNeutral)
        foodNeutralBtnPressed = true
        }
        }
    }

    @IBAction func terribleFoodBen(sender: AnyObject) {
        if billAmountTxt.text != ""
        {
         if foodDeliciousBtnPressed == false && foodNeutralBtnPressed == false && foodTerribleBtnPressed == false
         {
        processOperation(operate: .terribleFood)
        foodTerribleBtnPressed = true
        }
        }
    }
    
    @IBAction func fastSpeedBtn(sender: AnyObject) {
        if billAmountTxt.text != ""
        {
        if fastSpeedBtnPressed == false && neutralSpeedBtnPressed == false && slowSpeedBtnPressed == false
        {
        processOperation(operate: .fastSpeed)
        fastSpeedBtnPressed = true
        }
        }
    }

    @IBAction func neutralSpeedBen(sender: AnyObject) {
        if billAmountTxt.text != ""
        {
        if fastSpeedBtnPressed == false && neutralSpeedBtnPressed == false && slowSpeedBtnPressed == false
        {
        processOperation(operate: .neutralSpeed)
        neutralSpeedBtnPressed = true
        }
        }
    }

    @IBAction func slowSpeedBtn(sender: AnyObject) {
        if billAmountTxt.text != ""
        {
        if fastSpeedBtnPressed == false && neutralSpeedBtnPressed == false && slowSpeedBtnPressed == false
        {
        processOperation(operate: .slowSpeed)
        slowSpeedBtnPressed = true
        }
        }
    }
    
    
    
    func resetBools()
    {
        amazingServiceBtnPressed = false
        neutralServiceBtnPressed = false
        rudeServiceBtnPressed = false
        foodDeliciousBtnPressed = false
        foodNeutralBtnPressed = false
        foodTerribleBtnPressed = false
        fastSpeedBtnPressed = false
        neutralSpeedBtnPressed = false
        slowSpeedBtnPressed = false
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
