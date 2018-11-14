//
//  ViewController.swift
//  dome
//
//  Created by liyansong on 2018/10/9.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var name: String?
    var age: Int = 0
    var any: Any?
    var array: [String] = []
    var tab: UITableView?
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.label.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        self.label.frame.origin.x = 10
        let alamofire = AlamofireDome();
        alamofire.get();
      
          let group = DispatchGroup()
          group.enter()
          DispatchQueue.global().async {
             print("request 1 complete")
             group.leave()
          }
        
        group.enter()
        DispatchQueue.global().async {
            print("request 2 complete")
            group.leave()
        }
        
        
        group.notify(queue: DispatchQueue.main) {
            print("all requests come back")
        }
        

        
    }
    
    // 函数可以嵌套。内嵌函数可以访问其定义所在函数的变量。你可以使用内嵌函数来组织代码，避免过长和过于复杂。
    func returnFifteen() -> Int {
        var y = 10
        func add() {
            y += 5
        }
        add()
        return y
    }
    
    // 函数是第一类型的。这意味着函数可以返回另一个函数。
    func makeIncrementer() -> ((Int) -> Int) {
        func addOne(number: Int) -> Int {
            return 1 + number
        }
        return addOne
    }
    
    // 一个函数可以接受其他函数作为参数
    func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
        for item in list {
            if condition(item) {
                return true
            }
        }
        return false
    }
    func lessThanTen(number: Int) -> Bool {
        return number < 10
    }
    
    // 使用 func 声明一个函数。调用函数使用他的名字加上小括号中的参数列表。使用 -> 分隔参数的名字和返回值类型
    func greet(name: String, day: String) -> String {
        return "Hello \(name), today is \(day)."
    }
    // 使用元组(tuple)来返回多个值
    func getGasPrices() -> (Double, Double, Double) {
        return (3.59, 3.69, 3.79)
    }
    // 函数可以接受可变参数个数，收集到一个数组中。
    func sumOf(numbers: Int...) -> Int {
        var sum = 0
        for number in numbers {
            sum += number
        }
        return sum
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

