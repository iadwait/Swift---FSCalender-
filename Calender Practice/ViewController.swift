//
//  ViewController.swift
//  Calender Practice
//
//  Created by Adwait Barkale on 23/10/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit
import FSCalendar

class ViewController: UIViewController,FSCalendarDelegate,FSCalendarDataSource,FSCalendarDelegateAppearance {
    
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
    
    //After Deselecting
    func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let df = DateFormatter()
        df.dateFormat = "dd-MMM-YYYY"
        let deSelectedDate = df.string(from: date)
        print("DeSelected Date = \(deSelectedDate)")
    }
        
    //If we want a Date to be not Selected
    func calendar(_ calendar: FSCalendar, shouldSelect date: Date, at monthPosition: FSCalendarMonthPosition) -> Bool {
        let df = DateFormatter()
        df.dateFormat = "dd-MM-yyyy"
        guard let excludeedDate = df.date(from: "26-10-2020") else { return true }
        if date.compare(excludeedDate) == .orderedSame{
            return false
        }
        return true
    }
    
    //Data Source
    
    //Don't Allow user to select dates before current date
    func minimumDate(for calendar: FSCalendar) -> Date {
        return Date()
    }
    
    //Don't Allow user to Select dates after Specific Dates
    func maximumDate(for calendar: FSCalendar) -> Date {
        //return Date().addingTimeInterval((24*60*60)*7) //Just put number after *, to specify the days
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        let someDateTime = formatter.date(from: "2020/12/15 22:31") //Place Max Date Here
        return someDateTime!
    }
    
    //Add Dot's to Indicate Events
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        let df = DateFormatter()
        df.dateFormat = "dd-MM-yyyy"
        guard let eventDate = df.date(from: "26-10-2020") else { return 0 }
        if date.compare(eventDate) == .orderedSame{
            return 2
        }
        return 0
    }
    
    //FSCalendar Appearance Delegate
    
    //Seting color for date which cannot be selected so that user undestands
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
        let df = DateFormatter()
        df.dateFormat = "dd-MM-yyyy"
        guard let excludedDate = df.date(from: "26-10-2020") else { return nil }
        if date.compare(excludedDate) == .orderedSame{
            return .gray
        }
        return nil
    }
    
}

