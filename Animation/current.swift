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
    
    init(weatherDictionary: NSDictionary){
        
        let currentWeather = weatherDictionary["currently"] as NSDictionary;
        let currentTimeIntValue = currentWeather["time"] as Int;
        
        temperature = currentWeather["temperature"] as Int;
        humidity = currentWeather["humidity"] as Double;
        precipProbability = currentWeather["precipProbability"] as Double;
        summary = currentWeather["summary"] as String;
        
        currentTime = dataStringFromUnixTime(currentTimeIntValue);
        let iconString = currentWeather["icon"] as String;
        icon = weatherIconFromString(iconString);
        
    }
    
    func dataStringFromUnixTime(unixTime: Int) -> String {
        
        let timeInSeconds = NSTimeInterval(unixTime);
        let weatherDate = NSDate(timeIntervalSince1970: timeInSeconds);
        
        let dateFormatter = NSDateFormatter();
        dateFormatter.timeStyle = .ShortStyle;
        
        return dateFormatter.stringFromDate(weatherDate);
        
    }
    
    func weatherIconFromString(stringIcon: String) -> String {
        
        var imageName: String;
        println("Icone: \(stringIcon)");
        
        switch stringIcon {
            
        case "clear-day":
            imageName = "\u{f00d}"
        case "clear-night":
            imageName = "clear-night"
        case "rain":
            imageName = "\u{f017}"
        case "snow":
            imageName = "snow"
        case "sleet":
            imageName = "sleet"
        case "wind":
            imageName = "wind"
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