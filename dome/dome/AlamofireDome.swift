//
//  AlamofireDome.swift
//  dome
//
//  Created by liyansong on 2018/10/17.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit
import Alamofire
import HandyJSON
class AlamofireDome: NSObject {
    
    func get()  {
        Alamofire.request("http://sc-sycx-mst.shushuedu.com/sc-sycx-mst/sc/homepage",method: .get).responseJSON { (response) in
            
            
            switch response.result {

                case .success: do {
                    
                    if let jsonString = response.result.value {
                        if let homepage = Homepage.deserialize(from: jsonString as? Dictionary) {
                            print(homepage.toJSON()!)
                            homepage.carouselImageDTOS?.forEach({ (carousel) in
                                print(carousel.url ?? "无值")
                            })
                        }
                    }

                }

                case .failure( _): do {

                }

            }
            
        };
    }
}

class Homepage: HandyJSON {
    var blockDTOS: [Any]?
    var carouselImageDTOS: [Carousel]?
    required init() {}
}

class Carousel: HandyJSON {
    var redirectUrl: String?
    var url: String?
    required init() {}
    
}

