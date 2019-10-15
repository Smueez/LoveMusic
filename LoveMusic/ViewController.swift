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
    
    @IBOutlet var time1: UILabel!
    @IBOutlet var days1: UILabel!
    @IBOutlet var songs1: UILabel!
    @IBOutlet var switch1: UISwitch!
    @IBOutlet var sl1: UILabel!
    
    @IBOutlet var time2: UILabel!
    @IBOutlet var days2: UILabel!
    @IBOutlet var songs2: UILabel!
    @IBOutlet var switch2: UISwitch!
    
    @IBOutlet var time3: UILabel!
    @IBOutlet var days3: UILabel!
    @IBOutlet var songs3: UILabel!
    @IBOutlet var switch3: UISwitch!
    
    @IBOutlet var time4: UILabel!
    @IBOutlet var days4: UILabel!
    @IBOutlet var songs4: UILabel!
    @IBOutlet var switch4: UISwitch!
    
    @IBOutlet var view1: UIView!
    @IBOutlet var view2: UIView!
    @IBOutlet var view3: UIView!
    @IBOutlet var view4: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view1.layer.cornerRadius = 20.0
        view1.layer.shadowColor = UIColor.gray.cgColor
        view1.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        view1.layer.shadowRadius = 12.0
        view1.layer.shadowOpacity = 0.7
        
        view2.layer.cornerRadius = 20.0
        view2.layer.shadowColor = UIColor.gray.cgColor
        view2.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        view2.layer.shadowRadius = 12.0
        view2.layer.shadowOpacity = 0.7
        
        view3.layer.cornerRadius = 20.0
        view3.layer.shadowColor = UIColor.gray.cgColor
        view3.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        view3.layer.shadowRadius = 12.0
        view3.layer.shadowOpacity = 0.7
        
        view4.layer.cornerRadius = 20.0
        view4.layer.shadowColor = UIColor.gray.cgColor
        view4.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        view4.layer.shadowRadius = 12.0
        view4.layer.shadowOpacity = 0.7
        
        let fileurl_time = try!
            FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("time_sqp.sqlite")
        
        if sqlite3_open(fileurl_time.path, &db) != SQLITE_OK {
            print("something went wrong")
            return
        }
        
        let createTableTime = "CREATE TABLE IF NOT EXISTS time_table(id INTEGER PRIMARY KEY, time TEXT,hour INT, min INT, sec INT,days INT, sat INT, sun INT, mon INT, tues INT, wed INT, thu INT, fri INT, formate TEXT, status INT,songs INT)"
        
        if sqlite3_exec(db, createTableTime, nil, nil, nil) != SQLITE_OK {
            print("Somethins went wrong")
            return
        }
        
        print("Time Table created!")
        var queryStatement: OpaquePointer? = nil
        
        let time_query1 = "SELECT * FROM time_table WHERE id = 0"
        
        if sqlite3_prepare_v2(db, time_query1, -1, &queryStatement, nil) != SQLITE_OK {
            if sqlite3_step(queryStatement) == SQLITE_ROW {
                print("id no 0 is retrieving...")
                let time1_text = sqlite3_column_text(queryStatement, 1)
                let time_string1 = String(cString: time1_text!)
                let days1_int = sqlite3_column_int(queryStatement, 5)
                let songs1_int = sqlite3_column_int(queryStatement, 15)
                let status1_bool = sqlite3_column_int(queryStatement, 14)
                
                if(!time_string1.isEmpty){
                    self.time1.text = time_string1
                    self.days1.text = String(days1_int)
                    self.songs1.text = String(songs1_int)
                    if status1_bool == 1 {
                        self.switch1.isOn = true
                    }
                    else {
                        self.switch1.isOn = false
                    }
                    
                }
            }
        }
        else{
            self.switch1.isOn = false
            print("1st cell not ok")
        }
       
        let time_query2 = "SELECT * FROM time_table WHERE id = 1"
        
        if sqlite3_prepare_v2(db, time_query2, -1, &queryStatement, nil) == SQLITE_OK {
            if sqlite3_step(queryStatement) == SQLITE_ROW {
                let time2_text = sqlite3_column_text(queryStatement, 1)
                let time_string2 = String(cString: time2_text!)
                let days2_int = sqlite3_column_int(queryStatement, 5)
                let songs2_int = sqlite3_column_int(queryStatement, 15)
                let status2_bool = sqlite3_column_int(queryStatement, 14)
                
                if(!time_string2.isEmpty){
                    self.time2.text = time_string2
                    self.days2.text = String(days2_int)
                    self.songs2.text = String(songs2_int)
                    if status2_bool == 1 {
                        self.switch2.isOn = true
                    }
                    else {
                        self.switch2.isOn = false
                    }
                    
                }
            }
        }
        else {
            self.switch2.isOn = false
        }
        let time_query3 = "SELECT * FROM time_table WHERE id = 2"
        
        if sqlite3_prepare_v2(db, time_query3, -1, &queryStatement, nil) == SQLITE_OK {
            if sqlite3_step(queryStatement) == SQLITE_ROW {
                let time3_text = sqlite3_column_text(queryStatement, 1)
                let time_string3 = String(cString: time3_text!)
                let days3_int = sqlite3_column_int(queryStatement, 5)
                let songs3_int = sqlite3_column_int(queryStatement, 15)
                let status3_bool = sqlite3_column_int(queryStatement, 14)
                
                if(!time_string3.isEmpty){
                    self.time2.text = time_string3
                    self.days2.text = String(days3_int)
                    self.songs3.text = String(songs3_int)
                    if status3_bool == 1 {
                        self.switch3.isOn = true
                    }
                    else {
                        self.switch3.isOn = false
                    }
                    
                }
            }
        }
        else {
            self.switch3.isOn = false
        }
        let time_query4 = "SELECT * FROM time_table WHERE id = 3"
        
        if sqlite3_prepare_v2(db, time_query4, -1, &queryStatement, nil) == SQLITE_OK {
            if sqlite3_step(queryStatement) == SQLITE_ROW {
                let time4_text = sqlite3_column_text(queryStatement, 1)
                let time_string4 = String(cString: time4_text!)
                let days4_int = sqlite3_column_int(queryStatement, 5)
                let songs4_int = sqlite3_column_int(queryStatement, 15)
                let status4_bool = sqlite3_column_int(queryStatement, 14)
                
                if(!time_string4.isEmpty){
                    self.time4.text = time_string4
                    self.days4.text = String(days4_int)
                    self.songs4.text = String(songs4_int)
                    if status4_bool == 1 {
                        self.switch4.isOn = true
                    }
                    else {
                        self.switch4.isOn = false
                    }
                    
                }
            }
        }
        else {
            self.switch4.isOn = false
        }
        
    }
    
    @IBAction func stcell(_ sender: UIButton) {
        //1st cell
    }
    
    @IBAction func scndcell(_ sender: UIButton) {
        //2nd cell
    }
    
    @IBAction func thrdcell(_ sender: UIButton) {
        //3rd cell
    }
    
    @IBAction func frthcell(_ sender: UIButton) {
        //4th cell
    }
    
    @IBAction func pickSongs(_ sender: UIButton) {
        
    }
    
    
    
    @IBAction func datePicker(_ sender: UIDatePicker) {
        
    }
    
}
