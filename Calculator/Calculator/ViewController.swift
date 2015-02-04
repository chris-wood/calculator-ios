//
//  ViewController.swift
//  Calculator
//
//  Created by Christopher Wood on 2/4/15.
//  Copyright (c) 2015 Christopher Wood. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var display: UILabel! // this is automatically a pointer, since *all* objects live in the heap
    
    var operand1:Int = 0;
    var operand2:Int = 0;
    var op:String = "add";
    var enteringNumber:Bool = false; // ALL PROPERTIES MUST BE INITIALIZED
    var hasFirstOperand:Bool = false;
    
    @IBAction func appendDigit(sender: UIButton) // -> Double, to specify the return type
    {
        let digit = sender.currentTitle!; // ! unwrap the optional (crashes if nil)
        println("Pressed \(digit)");
        if (!enteringNumber) {
            self.display.text = digit;
            self.enteringNumber = true;
        } else {
            self.display.text = display.text! + digit;
        }
    }
    
    func initializeComputeChain(sender: UIButton)
    {
        if (!hasFirstOperand) {
            self.operand1 = sender.currentTitle!.toInt()!;
            hasFirstOperand = true;
        } else {
            self.operand2 = self.operand1;
            self.operand1 = sender.currentTitle!.toInt()!;
        }
    }
    
    @IBAction func pressEquals(sender: UIButton) {
        if (hasFirstOperand) {
            switch (op) {
                case "add":
                    display.text = String(operand1 + operand2);
                    break;
                case "sub":
                    display.text = String(operand1 - operand2);
                    break;
                case "div":
                    display.text = String(operand1 / operand2);
                    break;
                case "mul":
                    display.text = String(operand1 * operand2);
                    break;
                default:
                    break;
            }
        }
    }
    
    @IBAction func pressAdd(sender: UIButton)
    {
        initializeComputeChain(sender);
        op = "add";
        display.text = String(operand1 + operand2);
    }
    
    @IBAction func pressSubtract(sender: UIButton)
    {
        initializeComputeChain(sender);
        op = "sub";
        display.text = String(operand1 - operand2);
    }
    
    @IBAction func pressDivide(sender: UIButton)
    {
        initializeComputeChain(sender);
        op = "div";
        display.text = String(operand1 / operand2);
    }
    
    @IBAction func pressMultiply(sender: UIButton)
    {
        initializeComputeChain(sender);
        op = "mul";
        display.text = String(operand1 * operand2);
    }
    
    @IBAction func pressCLR(sender: UIButton) {
        display.text = "0";
        op = "add";
        operand1 = 0;
        operand2 = 0;
        hasFirstOperand = false;
    }
    
    func updateDisplay(text: String)
    {
        self.display.text = text;
    }
}

