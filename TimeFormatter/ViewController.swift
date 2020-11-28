//
//  ViewController.swift
//  TimeFormatter
//
//  Created by Ivan on 09.02.2020.
//  Copyright © 2020 Ivan Maslov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var durationLabel: UILabel!
    
    //Число, которое мы будем преобразовывать в секунды
    let x: Int64? = 55
    
    //Эта переменная отсчитывает количество секунд, отыгранных от начала записи
    var beginning = TimeInterval()
    
    //Это длительность нашей записи и подсчет времени, оставшегося до ее окончания
    private var end = TimeInterval()
    
    //Это длительность в формате Int64, для преобразования в текст с помощью TimeFormatter
    var end64 = Int64()
    
    //MARK: time setup
    //Мне известно, что возвращаемый DateFormatter String опциональный, поэтому я и создал переменную, в которую мы будем передавать результат форматирования
    var time: String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let unwrappedValue = x {
            
            end = TimeInterval(integerLiteral: unwrappedValue)
            end64 = Int64(end)
        }
        
        //MARK: Label initialization
        durationLabel.text = time
        
        beginning = 0.0
        setTimer()
    }
    
    func setTimer (){
        
        //Вот кто отвечает за смену секунд на экране
        let timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timeCounter(_:)), userInfo: nil, repeats: true)
        
        if end == 0.0{
            timer.invalidate()
        }
    }
    
    //Метод подсчета времени
    @objc func timeCounter ( _ : TimeInterval) -> TimeInterval{
       
        if end > 0.0{
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
                //Здесь мы отображаем секунду в Int64
                self.end64 = Int64(self.end)
                //И преобразуем новое время в String
                self.time = TimeFormatter().convertTimeToString(self.end64)
                
                self.durationLabel.text = self.time
                
                //Затем мы вновь считаем, сколько секунд записи нам осталось прослушать, и все начинается по новой
                self.end -= 1.0
                
                self.beginning += 1.0
            }
        }
     
        return end
    }
}




