//
//  current.swift
//  Stormy
//
//  Created by Felipe on 03/02/2015.
//  Copyright (c) 2015 fastman. All rights reserved.
//

import Foundation
import UIKit

struct current {
    
    var currentTime: String?;
    var temperature: Int;
    var humidity: Double;
    var precipProbability: Double;
    var summary: String;
    var icon: String?;
    
    init(){
        
        temperature = 0
        humidity = 0
        precipProbability = 0.00
        summary = ""
        currentTime = ""
        icon = ""
        
    }
    
    init(weatherDictionary: NSDictionary){
        
        let currentWeather = weatherDictionary["currently"] as! NSDictionary;
        let currentTimeIntValue = currentWeather["time"] as! Int;
        
        temperature = currentWeather["temperature"] as! Int;
        humidity = currentWeather["humidity"] as! Double;
        precipProbability = currentWeather["dewPoint"] as! Double;
        summary = currentWeather["summary"] as! String;
        
        currentTime = dataStringFromUnixTime(currentTimeIntValue);
        let iconString = currentWeather["icon"] as! String;
        icon = weatherIconFromString(iconString);
        
    }
    
    func dataStringFromUnixTime(_ unixTime: Int) -> String {
        
        let timeInSeconds = TimeInterval(unixTime);
        let weatherDate = Date(timeIntervalSince1970: timeInSeconds);
        
        let dateFormatter = DateFormatter();
        dateFormatter.timeStyle = .short;
        
        return dateFormatter.string(from: weatherDate);
        
    }
    
    func weatherIconFromString(_ stringIcon: String) -> String {
        
        var imageName: String;
        print("Icone: \(stringIcon)");
        
        switch stringIcon {
            
        case "clear-day":
            imageName = "\u{f00d}"
        case "clear-night":
            imageName = "\u{f02e}"
        case "rain":
            imageName = "\u{f017}"
        case "snow":
            imageName = "\u{f01b}"
        case "sleet":
            imageName = "sleet"
        case "wind":
            imageName = "\u{f021}"
        case "fog":
            imageName = "fog"
        case "cloudy":
            imageName = "\u{f002}"
        case "partly-cloudy-day":
            imageName = "\u{f002}"
        case "partly-cloudy-night":
            imageName = "\u{f013}"
        default:
            imageName = "default"
            
        }
        
        return imageName;
        
    }
    
    
    
    
    
}
