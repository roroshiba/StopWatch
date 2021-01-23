//
//  ViewController.swift
//  StopWatch
//
//  Created by 安部瞳 on 2020/11/28.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    @IBOutlet var label2: UILabel!
    
    var count: Float = 0.0
    
    var timer: Timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @objc func up() {
        count = count + 0.01
        label.text = String(format: "%.2f", count)
    }
    
    @IBAction func start() {
        label2.text = String("")
        if !timer.isValid {
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self,selector: #selector(self.up), userInfo: nil, repeats: true)
        }
    }
    
    @IBAction func stop() {
        if timer.isValid {
            timer.invalidate()
            self.hantei()
        }
    }
    
    @IBAction func reset() {
        label2.text = String("")
        if timer.isValid {
            timer.invalidate()
        }
        count = 0.00
        label.text = String(format: "%.2f", count)
    }
    
    @objc func hantei() {
        if count >= 9.80 && count <= 10.20 {
            label2.text = String("PERFECT!")
        } else if count >= 9.70 && count <= 10.30 {
            label2.text = String("GREAT")
        } else if count >= 9.60 && count <= 10.40 {
            label2.text = String("GOOD")
        } else {
            label2.text = String("BAD")
        }
    }


}

