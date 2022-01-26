//
//  ViewController.swift
//  WeeklyFinder
//
//  Created by Евгения Аникина on 24.01.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dateTF: UITextField!
    @IBOutlet weak var monthTF: UITextField!
    @IBOutlet weak var yearTF: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func findDay(_ sender: UIButton) {
        
        guard let day = dateTF.text, let month = monthTF.text, let year = yearTF.text else {
           return
        }
        
        let calendar = Calendar.current // календарь
        var dateComponents = DateComponents() //компоненты
        dateComponents.day = Int(day) //dateTF.text!
        dateComponents.month = Int(month) //monthTF.text!
        dateComponents.year = Int(year) //yearTF.text!
        
        //создаем дату
        let dateFormatter = DateFormatter() // объект
        // чтоб поменять на русский язык вызываем свойство
        dateFormatter.locale = Locale(identifier: "ru_Ru")
        
        dateFormatter.dateFormat = "EEEE" // формат дней недели которые ищем
        
        guard let date = calendar.date(from: dateComponents) else { return } //тут находит дату а календаре
        
        let weekday = dateFormatter.string(from: date)
        let capitalizedWeekday = weekday.capitalized // сделает букву большой
        
        resultLabel.text = capitalizedWeekday // тут день недели находит
    }
     //для клавиатуры, чтоб могла сворачиваться
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

