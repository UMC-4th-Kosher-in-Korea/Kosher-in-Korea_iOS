//
//  ResVC.swift
//  test
//
//  Created by 최영우 on 8/6/23.
//

import UIKit

var cnt : Int = 0
var year: Int = 0
var month : Int = 0
var day : Int = 0
var openTime : Int = 10
var closeTime : Int = 17
var strDate : String = ""
var ReservatedTime : String = ""

class ReservationVC: UIViewController {
    var strMinutes : String = ""
    /*
    let errorLabel : UILabel = {
        let label = UILabel()
        label.text = "Please set minutes to 00. If you want to visit after 00 minutes, please check the after time you checked."
        if Int(strMinutes)! > 0 && Int(strMinutes)! <= 59 {
            label.textColor = .systemRed
        } else {
            label.textColor = .white
        }
        
        return label
    }()
    */
    
    private var errorLabel : UILabel = {
        let label = UILabel()
        label.text = "Please set minutes to 00."
        label.textColor = .systemRed
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    let scrollView: UIScrollView = {
      let scrollView = UIScrollView()
      scrollView.translatesAutoresizingMaskIntoConstraints = false
      return scrollView
    }()
    
    let HScrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var dateView : UICalendarView = {
        var calendar = UICalendarView()
        calendar.wantsDateDecorations = true
        calendar.translatesAutoresizingMaskIntoConstraints = false
        
        return calendar
    }()
    
    var selectedDate : DateComponents? = nil
    
    

    
    private var people : UILabel = {
        var label = UILabel()
        label.text = "People"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var Minus : UIButton = {
        var button = UIButton()
        button.setTitle("-", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.backgroundColor = .systemGray4
        button.addTarget(self, action: #selector(whenMinus), for: .touchUpInside)
        
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemGray4.cgColor
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        
        return button
    }()
    
    private var Plus : UIButton = {
        var button = UIButton()
        button.setTitle("+", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.backgroundColor = .systemGray4
        button.addTarget(self, action: #selector(whenPlus), for: .touchUpInside)
        
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemGray4.cgColor
        button.backgroundColor = .systemBlue
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private var HowMuch : UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var TimeLabel : UILabel = {
        var label = UILabel()
        label.text = "Time"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var NextButton : UIButton = {
        var button = UIButton()
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.backgroundColor = .systemGray4
       // button.addTarget(self, action: #selector(DelegateTime), for: .touchUpInside)
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemGray4.cgColor
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    lazy var datePicker : UIDatePicker = {
        var datePicker = UIDatePicker()
        let dateFormatter = DateFormatter()
        datePicker.timeZone = NSTimeZone.local
        datePicker.datePickerMode = .time
        datePicker.addTarget(self, action: #selector(changeDateTime), for: .valueChanged)
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.countDownDuration = TimeInterval(openTime * 3600)
        return datePicker
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let safeArea = view.safeAreaLayoutGuide
        
        HowMuch.text = String(cnt)
        
        view.addSubview(scrollView)
        // Enable Auto Layout
        //scrollView.translatesAutoresizingMaskIntoConstraints = false

        // Set up scrollView and contentView constraints
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        
        view.addSubview(HScrollView)
        //HScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        setCalendar()
        reloadDateView(date: Date())
        
        scrollView.addSubview(dateView)
        scrollView.addSubview(people)
        scrollView.addSubview(Minus)
        scrollView.addSubview(Plus)
        scrollView.addSubview(HowMuch)
        scrollView.addSubview(TimeLabel)
        scrollView.addSubview(NextButton)
        scrollView.addSubview(datePicker)
        scrollView.addSubview(errorLabel)

        
        
        view.backgroundColor = .white
        
        
        NSLayoutConstraint.activate([
            dateView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            dateView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 50)
        ])
        
        NSLayoutConstraint.activate([
            people.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            people.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 450)
        ])
        
        NSLayoutConstraint.activate([
            Minus.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 250),
            Minus.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 450)
        ])
        
        NSLayoutConstraint.activate([
            HowMuch.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 300),
            HowMuch.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 455)
        ])
        
        NSLayoutConstraint.activate([
            Plus.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 330),
            Plus.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 450)
        ])
        
        NSLayoutConstraint.activate([
            TimeLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            TimeLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 530)
        ])
        
        NSLayoutConstraint.activate([
            NextButton.widthAnchor.constraint(equalToConstant: 360),
            NextButton.heightAnchor.constraint(equalToConstant: 50),
            NextButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            NextButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 690),
            NextButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -30)
        ])
        
        NSLayoutConstraint.activate([
            datePicker.widthAnchor.constraint(equalToConstant: 100),
            datePicker.heightAnchor.constraint(equalToConstant: 50),
            datePicker.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            datePicker.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 590)
        ])
        
        NSLayoutConstraint.activate([
            errorLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            errorLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 640)
       ])
        

        

        
        
        
    }
    
    fileprivate func setCalendar() {
        dateView.delegate = self
        let dateSelection = UICalendarSelectionSingleDate(delegate: self)
        dateView.selectionBehavior = dateSelection
    }
    
    func reloadDateView(date: Date?) {
        if date == nil {return}
        let calendar = Calendar.current
        dateView.reloadDecorations(forDateComponents: [calendar.dateComponents([.day, .month, .year], from: date!)], animated: true)
        let components = calendar.dateComponents([.year, .month, .day], from: date!)

        year = components.year!
        month = components.month!
        day = components.day!
        
    }
    
    
    @objc func whenMinus() {
        if cnt > 0 {
            cnt -= 1
            HowMuch.text = String(cnt)
        }
        if cnt > 0 {
            /*
            NextButton.backgroundColor = .systemOrange
            NextButton.setTitleColor(.white, for: .normal)
            NextButton.setTitleColor(.systemGray4, for: .highlighted)
             */
            Plus.backgroundColor = .systemBlue
            Minus.backgroundColor = .systemBlue
            Plus.setTitleColor(.systemGray4, for: .highlighted)
            Minus.setTitleColor(.systemGray4, for: .highlighted)
        }
        if cnt == 0 {
            /*
            NextButton.setTitleColor(.gray, for: .normal)
            NextButton.backgroundColor = .systemGray4
             */
            Plus.backgroundColor = .systemBlue
            Minus.backgroundColor = .systemGray4
            Plus.setTitleColor(.systemGray4, for: .highlighted)
        }
        NextButtonTrue()
    }
    
    @objc func whenPlus() {
        cnt += 1
        HowMuch.text = String(cnt)
        if cnt > 0 {
            /*
            NextButton.backgroundColor = .systemOrange
            NextButton.setTitleColor(.white, for: .normal)
            NextButton.setTitleColor(.systemGray4, for: .highlighted)
             */
            Plus.backgroundColor = .systemBlue
            Minus.backgroundColor = .systemBlue
            Plus.setTitleColor(.systemGray4, for: .highlighted)
            Minus.setTitleColor(.systemGray4, for: .highlighted)
        }
        if cnt == 0 {
            /*
            NextButton.setTitleColor(.gray, for: .normal)
            NextButton.backgroundColor = .systemGray4
             */
            Plus.backgroundColor = .systemBlue
            Minus.backgroundColor = .systemGray4
            Plus.setTitleColor(.systemGray4, for: .highlighted)
        }
        NextButtonTrue()
    }
    
    @objc func goNext() {
        let FinalRes = FinalReservation()
        self.present(FinalRes, animated: true, completion: nil)

    }
    
    
    @objc func changeDateTime(sender : UIDatePicker) {
        let calendar = Calendar.current
        let selectedComponents = calendar.dateComponents([.year, .month, .day], from: datePicker.date)
        
        // 최소 시간을 openTime으로 설정
        let minimumTime = calendar.date(bySettingHour: openTime, minute: 0, second: 0, of: datePicker.date)
        
        // 최대 시간을 closeTime로시로 설정
        let maximumTime = calendar.date(bySettingHour: closeTime, minute: 0, second: 0, of: datePicker.date)
        
        datePicker.minimumDate = minimumTime
        datePicker.maximumDate = maximumTime
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH"
        strDate = dateFormatter.string(from: (datePicker.date))
        
        // 분 단위를 체크하면 체크하지 말라고 알림 띄우기
        let dateMinutes = DateFormatter()
        dateMinutes.dateFormat = "mm"
        strMinutes = dateMinutes.string(from: (datePicker.date))
        
        if strMinutes == "00"  {
            errorLabel.isHidden = true
        } else {
            errorLabel.isHidden = false
        }
        NextButtonTrue()
        print(strMinutes)
        
    }
    

    
    func NextButtonTrue() {
        if strMinutes == "00" && cnt > 0  {
            NextButton.backgroundColor = .systemOrange
            NextButton.setTitleColor(.white, for: .normal)
            NextButton.setTitleColor(.systemGray4, for: .highlighted)
            NextButton.addTarget(self, action: #selector(goNext), for: .touchUpInside)
        } else {
            NextButton.setTitleColor(.white, for: .normal)
            NextButton.setTitleColor(.gray, for: .highlighted)
            NextButton.backgroundColor = .systemGray4
            NextButton.removeTarget(self, action: #selector(goNext), for: .touchUpInside)
        }
    }
    
    
    
    
}

extension ReservationVC: UICalendarViewDelegate, UICalendarSelectionSingleDateDelegate {
    
    func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
        selection.setSelected(dateComponents, animated: true)
        selectedDate = dateComponents
        reloadDateView(date: Calendar.current.date(from: dateComponents!))
    }

    
}

