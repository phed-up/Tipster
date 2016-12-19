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
    @IBOutlet weak var totalAmountLbl: UILabel!
    @IBOutlet weak var splitAmount: UITextField!
    @IBOutlet weak var eachAmount: UILabel!
    
    
    @IBOutlet weak var errorLbl: UILabel!
    
    @IBOutlet weak var amazingServiceBtn: UIButton!
    @IBOutlet weak var neutralServiceBtn: UIButton!
    @IBOutlet weak var rudeServiceBtn: UIButton!
    @IBOutlet weak var delliciousTasteBtn: UIButton!
    @IBOutlet weak var neutralTasteBtn: UIButton!
    @IBOutlet weak var terribleTasteBtn: UIButton!
    @IBOutlet weak var fastSpeedBtn: UIButton!
    @IBOutlet weak var neutralSpeedBtn: UIButton!
    @IBOutlet weak var slowSpeedBtn: UIButton!
    
    
    @IBOutlet weak var amazingEmoji: UIImageView!
    @IBOutlet weak var neutralServiceEmoji: UIImageView!
    @IBOutlet weak var rudeEmoji: UIImageView!
    @IBOutlet weak var deliciousEmoji: UIImageView!
    @IBOutlet weak var neutralTasteEmoji: UIImageView!
    @IBOutlet weak var terribleEmoji: UIImageView!
    @IBOutlet weak var fastEmoji: UIImageView!
    @IBOutlet weak var neutralSpeedEmoji: UIImageView!
    @IBOutlet weak var slowSpeedEmoji: UIImageView!
    
    
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
    var total: Double = 0.0
    var split: Double = 0.0
    
    
    
    
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
        totalAmountLbl.text = ""
        splitAmount.text = "1"
        eachAmount.text = ""
        result = 0.0
        resetBools()
        amazingEmoji.isHidden = true
        neutralServiceEmoji.isHidden = true
        rudeEmoji.isHidden = true
        deliciousEmoji.isHidden = true
        neutralTasteEmoji.isHidden = true
        terribleEmoji.isHidden = true
        fastEmoji.isHidden = true
        neutralSpeedEmoji.isHidden = true
        slowSpeedEmoji.isHidden = true
        amazingServiceBtn.backgroundColor = UIColor.lightGray
        neutralServiceBtn.backgroundColor = UIColor.lightGray
        rudeServiceBtn.backgroundColor = UIColor.lightGray
        delliciousTasteBtn.backgroundColor = UIColor.lightGray
        neutralTasteBtn.backgroundColor = UIColor.lightGray
        terribleTasteBtn.backgroundColor = UIColor.lightGray
        fastSpeedBtn.backgroundColor = UIColor.lightGray
        neutralSpeedBtn.backgroundColor = UIColor.lightGray
        slowSpeedBtn.backgroundColor = UIColor.lightGray
        errorLbl.text = ""
        
        
    }
    
    
    
  
    
    @IBAction func amazingServiceBtn(sender: AnyObject) {
        if billAmountTxt.text != ""
        {
            if neutralServiceBtnPressed == false && rudeServiceBtnPressed == false && amazingServiceBtnPressed == false
            {
            processOperation(operate: .amazingService)
            amazingEmoji.isHidden = false
            amazingServiceBtnPressed = true
            amazingServiceBtn.backgroundColor = UIColor.magenta
            errorLbl.text = ""
            
            }
            else
            {
                errorReset()
            }
        }
        else
        {
            errorEnterBill()
        }
        
        
    }
    
    @IBAction func neutralServiceBtn(sender: AnyObject) {
        if billAmountTxt.text != ""
        {
        if amazingServiceBtnPressed == false && rudeServiceBtnPressed == false && neutralServiceBtnPressed == false
        {
        processOperation(operate: .neutralService)
        neutralServiceEmoji.isHidden = false
        neutralServiceBtnPressed = true
        neutralServiceBtn.backgroundColor = UIColor.magenta
        errorLbl.text = ""
        
        }
        else
        {
            errorReset()
            }
        }
        else
        {
            errorEnterBill()
        }
    }
    
    @IBAction func rudeServiceBtn(sender: AnyObject) {
        if billAmountTxt.text != ""
        {
        if amazingServiceBtnPressed == false && neutralServiceBtnPressed == false && rudeServiceBtnPressed == false
        {
        processOperation(operate: .rudeService)
        rudeEmoji.isHidden = false
        rudeServiceBtnPressed = true
        rudeServiceBtn.backgroundColor = UIColor.magenta
        errorLbl.text = ""
        
        }
        else
        {
            errorReset()
            }
        }
        else
        {
            errorEnterBill()
        }
    }
   
    @IBAction func foodDeliciousBtn(sender: AnyObject) {
        if billAmountTxt.text != ""
        {
        if foodDeliciousBtnPressed == false && foodNeutralBtnPressed == false && foodTerribleBtnPressed == false
        {
        processOperation(operate: .foodDelicious)
        deliciousEmoji.isHidden = false
        foodDeliciousBtnPressed = true
        delliciousTasteBtn.backgroundColor = UIColor.magenta
        errorLbl.text = ""
        
        }
        else
        {
            errorReset()
            }
        }
        else
        {
            errorEnterBill()
        }
    }
    
    @IBAction func foodNeutralBtn(sender: AnyObject) {
        if billAmountTxt.text != ""
        {
         if foodDeliciousBtnPressed == false && foodNeutralBtnPressed == false && foodTerribleBtnPressed == false
         {
        processOperation(operate: .foodNeutral)
        neutralTasteEmoji.isHidden = false
        foodNeutralBtnPressed = true
        neutralTasteBtn.backgroundColor = UIColor.magenta
        errorLbl.text = ""
        
        }
         else
            {
            errorReset()
            }
        }
        else
        {
            errorEnterBill()
        }
    }

    @IBAction func terribleFoodBen(sender: AnyObject) {
        if billAmountTxt.text != ""
        {
         if foodDeliciousBtnPressed == false && foodNeutralBtnPressed == false && foodTerribleBtnPressed == false
         {
        processOperation(operate: .terribleFood)
        terribleEmoji.isHidden = false
        foodTerribleBtnPressed = true
        terribleTasteBtn.backgroundColor = UIColor.magenta
        errorLbl.text = ""
        
        }
         else
         {
            errorReset()
            }
        }
        else
        {
            errorEnterBill()
        }
    }
    
    @IBAction func fastSpeedBtn(sender: AnyObject) {
        if billAmountTxt.text != ""
        {
        if fastSpeedBtnPressed == false && neutralSpeedBtnPressed == false && slowSpeedBtnPressed == false
        {
        processOperation(operate: .fastSpeed)
        fastEmoji.isHidden = false
        fastSpeedBtnPressed = true
        fastSpeedBtn.backgroundColor = UIColor.magenta
        errorLbl.text = ""
        
        }
        else
        {
            errorReset()
            }
        }
        else
        {
            errorEnterBill()
        }
    }

    @IBAction func neutralSpeedBen(sender: AnyObject) {
        if billAmountTxt.text != ""
        {
        if fastSpeedBtnPressed == false && neutralSpeedBtnPressed == false && slowSpeedBtnPressed == false
        {
        processOperation(operate: .neutralSpeed)
        neutralSpeedEmoji.isHidden = false
        neutralSpeedBtnPressed = true
        neutralSpeedBtn.backgroundColor = UIColor.magenta
        errorLbl.text = ""
        
        }
        else
        {
            errorReset()
            }
        }
        else
        {
            errorEnterBill()
        }
    }

    @IBAction func slowSpeedBtn(sender: AnyObject) {
        if billAmountTxt.text != ""
        {
        if fastSpeedBtnPressed == false && neutralSpeedBtnPressed == false && slowSpeedBtnPressed == false
        {
        processOperation(operate: .slowSpeed)
        slowSpeedEmoji.isHidden = false
        slowSpeedBtnPressed = true
        slowSpeedBtn.backgroundColor = UIColor.magenta
        errorLbl.text = ""
        
        }
        else
        {
            errorReset()
            }
        }
        else
        {
            errorEnterBill()
        }
    }
    
    
    func errorReset()
        {
        errorLbl.text = "You must reset to make new selections"
        }
    
    func errorEnterBill()
        {
        errorLbl.text = "Please enter a bill amount"
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
    
    func totalAmt()
    {
        
        
        total = (Double(billAmountTxt.text!)!) + (Double(tipAmountLbl.text!)!)
        totalAmountLbl.text = "\(String(total))"
        eachAmount.text = "\(String(total / (Double(splitAmount.text!)!)))"
        
       
    }
    
    

    
    func processOperation(operate: Equation)
        {
            
            currentOperation = operate
            
                
                if currentOperation == Equation.amazingService
                {
                    amazingResult = (Double(billAmountTxt.text!)! * 0.10)
                    result = result + amazingResult
                    tipAmountLbl.text = "\(String(result))"
                    totalAmt()
                    
                    
                }
            
                if currentOperation == Equation.neutralService
                {
                    neutralResult = (Double(billAmountTxt.text!)! * 0.05)
                    result = result + neutralResult
                    tipAmountLbl.text = "\(String(result))"
                    totalAmt()
                    
                    
                    
                }
                if currentOperation == Equation.rudeService
                {
                    rudeResult = (Double(billAmountTxt.text!)! * 0.00)
                    result = result + rudeResult
                    tipAmountLbl.text = "\(String(result))"
                    totalAmt()
                    
                }
            
                if currentOperation == Equation.foodDelicious
                {
                    deliciouseResult = (Double(billAmountTxt.text!)! * 0.07)
                    result = result + deliciouseResult
                    tipAmountLbl.text = "\(String(result))"
                    totalAmt()
                    
                }

                if currentOperation == Equation.foodNeutral
                {
                    foodNeutralResult = (Double(billAmountTxt.text!)! * 0.05)
                    result = result + foodNeutralResult
                    tipAmountLbl.text = "\(String(result))"
                    totalAmt()
                    
                }
            
                if currentOperation == Equation.terribleFood
                {
                    terribleFoodResult = (Double(billAmountTxt.text!)! * 0.00)
                    result = result + terribleFoodResult
                    tipAmountLbl.text = "\(String(result))"
                    totalAmt()
                    
                }
            
                if currentOperation == Equation.fastSpeed
                {
                    fastSpeedResult = (Double(billAmountTxt.text!)! * 0.07)
                    result = result + fastSpeedResult
                    tipAmountLbl.text = "\(String(result))"
                    totalAmt()
                    
                }
            
                if currentOperation == Equation.neutralSpeed
                {
                    neutralResult = (Double(billAmountTxt.text!)! * 0.05)
                    result = result + neutralResult
                    tipAmountLbl.text = "\(String(result))"
                    totalAmt()
                    
                }
            
                if currentOperation == Equation.slowSpeed
                {
                    slowSpeedResult = (Double(billAmountTxt.text!)! * 0.0)
                    result = result + slowSpeedResult
                    tipAmountLbl.text = "\(String(result))"
                    totalAmt()
                    
            }
        
            
            currentOperation = operate
            
        }
    
}
