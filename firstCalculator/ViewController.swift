//
//  ViewController.swift
//  firstCalculator
//
//  Created by Shailee Patel on 2023-03-20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var calculatorWorkings: UILabel!
    @IBOutlet weak var calculatorResults: UILabel!
    
    // Declare Variable
    var workings:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        clearAll()
    }
    
    // Cleare funcation..
    func clearAll()
    {
        workings = ""
        calculatorResults.text = ""
        calculatorWorkings.text = ""
    }
    
    func addToWorkings(value:String)
    {

            workings = workings + value
            calculatorWorkings.text = workings
    }

    // Equal button clcik event
    @IBAction func equalsbtn(_ sender: Any)
    {
            if(validInput())
            {
                    let checkedWorkingsForPercent = workings.replacingOccurrences(of: "%", with: "*0.01")

                    let expression = NSExpression(format: checkedWorkingsForPercent)

                    let result = expression.expressionValue(with: nil, context: nil) as! Double

                    let resultString = formatResult(result: result)

                            calculatorResults.text = resultString
                    
            }

            else
            {

                    let alert = UIAlertController(
                    title: "Invalid Input",
                    message: "No result found!",
                    preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default))
                    self.present(alert, animated: true, completion: nil)
            }
    }
    
    // Valide input Validation..
    func validInput()->Bool
    {
            var count = 0
            var funcCharIndexes = [Int]()
            for char in workings
            {
                if(specialCharacter(char: char))
                {
                    funcCharIndexes.append(count)
                }
                    count += 1
                
            }
            var previous: Int = -1
            for index in funcCharIndexes
            {
                if(index == 0)
                {
                    return false
                }
                if(index == workings.count - 1)
                {
                    return false
                }
                if(previous != -1)
                {
                    if(index - previous == 1)
                    {
                        return false
                    }
                }

                    previous = index

            }
                return true
    }
    
    // SpecialCharacter Validation..
    func specialCharacter(char: Character)->Bool
    {

            if(char == "*"){

                return true

            }

            if(char == "/"){

                return true

            }

            if(char == "+"){

                return true

            }

            if(char == "-"){

                return true

            }

            return false
    }
    
    // Formate Result..
    func formatResult(result: Double) -> String
    {
        return String(format: "%.2f", result)
    }
    
    @IBAction func plusBtn(_ sender: Any) {
        addToWorkings(value: "+")
    }
    
    @IBAction func minusBtn(_ sender: Any) {
        addToWorkings(value: "-")
    }
    
    @IBAction func multiplyBtn(_ sender: Any) {
        addToWorkings(value: "*")
    }
    
    @IBAction func divideBtn(_ sender: Any) {
        addToWorkings(value: "/")
    }
    
    @IBAction func percentageBtn(_ sender: Any) {
        addToWorkings(value: "%")
    }
    
    @IBAction func clearBtn(_ sender: Any) {
        if(!workings.isEmpty)
        {
            workings.removeLast()
            calculatorWorkings.text = workings
        }
       
    }
    
    @IBAction func backBtn(_ sender: Any) {
        clearAll()
        
    }
    
    @IBAction func decimalBtn(_ sender: Any) {
        addToWorkings(value: ".")
    }
    
    @IBAction func zeroBtn(_ sender: Any) {
        addToWorkings(value: "0")
    }
    
    @IBAction func oneBtn(_ sender: Any) {
        addToWorkings(value: "1")
    }
    
    @IBAction func twoBtn(_ sender: Any) {
        addToWorkings(value: "2")
    }
    
    @IBAction func threeBtn(_ sender: Any) {
        addToWorkings(value: "3")
    }
    
    @IBAction func fourBtn(_ sender: Any) {
        addToWorkings(value: "4")
    }
    
    @IBAction func fiveBtn(_ sender: Any) {
        addToWorkings(value: "5")
    }
    
    @IBAction func sixBtn(_ sender: Any) {
        addToWorkings(value: "6")
    }
    
    @IBAction func sevenBtn(_ sender: Any) {
        addToWorkings(value: "7")
    }
    
    @IBAction func eightBtn(_ sender: Any) {
        addToWorkings(value: "8")
    }
    
    @IBAction func nineBtn(_ sender: Any) {
        addToWorkings(value: "9")
    }
    
    
}

