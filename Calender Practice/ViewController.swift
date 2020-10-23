//
//  ViewController.swift
//  Calender Practice
//
//  Created by Adwait Barkale on 23/10/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit
import FSCalendar

class ViewController: UIViewController,FSCalendarDelegate,FSCalendarDataSource {

    @IBOutlet weak var calender: FSCalendar!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupCalender()
    }
    
    func setupCalender()
    {
        calender.delegate = self
        calender.dataSource = self
        
        calender.scrollDirection = .vertical
        calender.scope = .month
        
        //Changing Fonts
        calender.appearance.titleFont = UIFont.systemFont(ofSize: 17.0)
        calender.appearance.headerTitleFont = UIFont.boldSystemFont(ofSize: 25.0)
        calender.appearance.weekdayFont = UIFont.systemFont(ofSize: 17.0)
        
        //Changing Colors
        calender.appearance.titleTodayColor = .black
        calender.appearance.todayColor = .green
        calender.appearance.titleDefaultColor = .black
        calender.appearance.headerTitleColor = .red
        calender.appearance.weekdayTextColor = .blue
        
        calender.allowsMultipleSelection = true //For Multiple Selections
        
    }

    //Delegate
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let df = DateFormatter()
        df.dateFormat = "dd-MMM-YYYY"
        let stringDate = df.string(from: date)
        print("Selected Date = \(stringDate)")
    }
    
    //Data Source
    func minimumDate(for calendar: FSCalendar) -> Date {
        return Date()
    }
    
    func maximumDate(for calendar: FSCalendar) -> Date {
        //return Date().addingTimeInterval((24*60*60)*7) //Just put number after *, to specify the days
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        let someDateTime = formatter.date(from: "2020/12/15 22:31") //Place Max Date Here
        return someDateTime!
    }

}

