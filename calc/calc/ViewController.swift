//
//  ViewController.swift
//  calc
//
//  Created by Гость on 15.04.2022.
//

import UIKit

class ViewController: UIViewController {
    
     @IBOutlet weak var clear: UIButton!
    
     @IBOutlet weak var rez: UIButton!
     @IBOutlet weak var n0: UIButton!
    
     @IBOutlet weak var label: UILabel!
    
     @IBOutlet weak var dd: UIStepper!
     
     @IBOutlet weak var s: UIButton!
     
     @IBOutlet weak var e: UIButton!
     @IBOutlet weak var n: UIButton!
     @IBOutlet weak var f: UIButton!
     @IBOutlet weak var fi: UIButton!
     @IBOutlet weak var si: UIButton!
     @IBOutlet weak var o: UIButton!
     @IBOutlet weak var t: UIButton!
     @IBOutlet weak var three: UIButton!
     @IBOutlet weak var zero: UIButton!
     @IBOutlet weak var slash: UIButton!
     @IBOutlet weak var umn: UIButton!
     @IBOutlet weak var minus: UIButton!
     @IBOutlet weak var plus: UIButton!
     @IBOutlet weak var ravn: UIButton!
     var numOne = ""
     var numTwo = ""
     var oper = ""
    
     override func viewDidLoad() {
        super.viewDidLoad()
          
          s.layer.cornerRadius = 36
          e.layer.cornerRadius = 36
          n.layer.cornerRadius = 36
          f.layer.cornerRadius = 36
          fi.layer.cornerRadius = 36
          si.layer.cornerRadius = 36
          o.layer.cornerRadius = 36
          t.layer.cornerRadius = 36
          three.layer.cornerRadius = 36
          zero.layer.cornerRadius = 36
          slash.layer.cornerRadius = 36
          umn.layer.cornerRadius = 36
          minus.layer.cornerRadius = 36
          plus.layer.cornerRadius = 36
          ravn.layer.cornerRadius = 36
    }

     @IBAction func numButtons(_ sender: UIButton) {
          if oper.isEmpty {
               numOne = numOne + (sender.titleLabel?.text)!
               label.text = numOne
          }
          else
          {
               numTwo = numTwo + (sender.titleLabel?.text)!
               label.text = numTwo
          }
     }
     @IBAction func inputOper(_ sender: UIButton) {
          oper = sender.titleLabel?.text as!
          String
     }
     
     @IBAction func clearAction(_ sender: Any) {
          numTwo = ""
          numOne = ""
          oper = ""
          label.text = "0"
     }
     
     @IBAction func resultAction(_ sender: UIButton) {
          var result = 0.0
          
          switch oper {
          case "/":
               result = Double (numOne)! /
               Double(numTwo)!
          case "+":
               result = Double (numOne)! +
               Double(numTwo)!
          case "-":
               result = Double (numOne)! -
               Double(numTwo)!
          case "=":
               result = Double (numOne)! *
               Double(numTwo)!
          case "*":
               result = Double (numOne)! *
               Double(numTwo)!
          default:
               break
               
          }
          
          if result.truncatingRemainder(dividingBy: 1.0)
               == 0.0 {
               label.text = String(Int(result))
          }
          else
          {
               label.text = String(result)
          }
               
          }
     }


   




