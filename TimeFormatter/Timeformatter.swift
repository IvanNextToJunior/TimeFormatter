//
//  Timeformatter.swift
//  TimeFormatter
//
//  Created by Ivan on 09.02.2020.
//  Copyright © 2020 Ivan Maslov. All rights reserved.
//

import Foundation
class TimeFormatter{
    
    private var seconds = TimeInterval()
   
    //Метод, преобразующий время в нужный формат
    private func timeFormatter (_ : TimeInterval) -> DateComponentsFormatter{
       
        let formatter = DateComponentsFormatter()
       
        // Длительность будет отображаться как 1:00:00
        if seconds > 59.59{
            formatter.allowedUnits = [.hour, .minute, .second]
        }
            
        else {
            formatter.allowedUnits = [.minute, .second]
        }
        
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        
        
        return formatter
    }
    
    //Метод, передающий информацию о длительности записи в приложение
    func convertTimeToString(_ number: Int64?) -> String?{
        
        if let unwrappedNumber = number {
            
            seconds = TimeInterval(integerLiteral: unwrappedNumber)
            print(seconds)
        }
       
        //Здесь мы преобразуем время в нужный нам формат
        let formatter = timeFormatter(seconds)
        //А здесь мы преобразуем его в строку
        let timeString = formatter.string(from: seconds)
       
        return timeString
    
        
    }
    
    
    
    
    
    
    
}
