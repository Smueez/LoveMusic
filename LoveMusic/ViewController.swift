//
//  ViewController.swift
//  LoveMusic
//
//  Created by MD. Sheersho Mueez on 9/15/19.
//  Copyright © 2019 Cookie Tech. All rights reserved.
//

import UIKit
import SQLite3

class ViewController: UIViewController{

    var db: OpaquePointer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let fileurl_time = try!
            FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("time_sqp.sqlite")
        
        if sqlite3_open(fileurl_time.path, &db) != SQLITE_OK {
            print("something went wrong")
        }
        
        let createTableTime = "CREATE TABLE IF NOT EXISTS time(id INTEGER PRIMARY KEY, hour INTEGER, min INTEGER, sec INTEGER, bela TEXT, sat BOOLIAN, sun BOOLIAN, mon BOOLIAN, tues BOOLIAN,  )"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    
}

