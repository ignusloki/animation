//
//  ViewController.swift
//  Animation
//
//  Created by Felipe on 21/01/2015.
//  Copyright (c) 2015 fastman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Create and add a colored square
    let morningSquare = UIView();
    let afternoonSquare = UIView();
    let eveningSquare = UIView();
    let nightSquare = UIView();
    
    //Labels
    let labelMorning = UILabel();
    let labelMorningTemp = UILabel();
    let labelMorningSumm = UILabel();
    let labelMorningHum = UILabel();
    let labelMorningHumVal = UILabel();
    
    let labelDay = UILabel();
    let labelDayTemp = UILabel();
    let labelDaySumm = UILabel();
    let labelDayHum = UILabel();
    let labelDayHumVal = UILabel();
    
    let labelEvening = UILabel();
    let labelEveningTemp = UILabel();
    let labelEveningSumm = UILabel();
    let labelEveningHum = UILabel();
    let labelEveningHumVal = UILabel();
    
    let labelNight = UILabel();
    let labelNightTemp = UILabel();
    let labelNightSumm = UILabel();
    let labelNightHum = UILabel();
    let labelNightHumVal = UILabel();
    
    // Create and add the gesture
    let tapMorning = UITapGestureRecognizer();
    let tapAfter = UITapGestureRecognizer();
    let tapEve = UITapGestureRecognizer();
    let tapNight = UITapGestureRecognizer();
    
    let options = UIViewAnimationOptions.TransitionNone;
    
    
    // Var for animation information and control
    var animatedMorning: Bool = false;
    var animatedAfternoon: Bool = false;
    var animatedEvening: Bool = false;
    var animatedNight: Bool = false;
    var animatedView: String = "morning";
    
    var tempFontSize:CGFloat = 50;
    
    // API key to access
    private let apiKey = "7cabaf0493ec4339be738cc061d42c0b";

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set views and targets
        setContainersView();
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setContainersView(){
        
        
        morningSquare.backgroundColor = UIColor(red: 227/255, green: 187/255, blue: 136/255, alpha: 1)
        morningSquare.frame = CGRect(x: self.view.bounds.origin.x, y: self.view.bounds.origin.y + 20, width: self.view.bounds.width, height: self.view.bounds.height/6-20);
        
        labelMorning.text = "MORNING";
        labelMorning.textColor = UIColor.whiteColor();
        labelMorning.font = UIFont(name: "Lato-Regular", size: 20);
        labelMorning.sizeToFit();
        labelMorning.center = CGPointMake(morningSquare.bounds.width*3/5, morningSquare.frame.height*3/12);
        labelMorning.textAlignment = NSTextAlignment.Center;
        morningSquare.addSubview(labelMorning);
        
        labelMorningTemp.text = "-1º";
        labelMorningTemp.textColor = UIColor.whiteColor();
        labelMorningTemp.font = UIFont(name: "Lato-Regular", size: tempFontSize);
        labelMorningTemp.sizeToFit();
        labelMorningTemp.center = CGPointMake(morningSquare.bounds.width*3/5, morningSquare.frame.height*9/12);
        labelMorningTemp.textAlignment = NSTextAlignment.Center;
        morningSquare.addSubview(labelMorningTemp);
        
        afternoonSquare.backgroundColor = UIColor(red: 216/255, green: 152/255, blue: 100/255, alpha: 1);
        afternoonSquare.frame = CGRect(x: self.view.bounds.origin.x, y: self.view.bounds.origin.y + self.view.bounds.height/6*3, width: self.view.bounds.width, height: self.view.bounds.height/6);
        
        labelDay.text = "DAY";
        labelDay.textColor = UIColor.whiteColor();
        labelDay.font = UIFont(name: "Lato-Regular", size: 20);
        labelDay.sizeToFit();
        labelDay.center = CGPointMake(afternoonSquare.bounds.width*3/5, afternoonSquare.frame.height*3/12);
        labelDay.textAlignment = NSTextAlignment.Center;
        afternoonSquare.addSubview(labelDay);
        
        labelDayTemp.text = "+3º";
        labelDayTemp.textColor = UIColor.whiteColor();
        labelDayTemp.font = UIFont(name: "Lato-Regular", size: tempFontSize);
        labelDayTemp.sizeToFit();
        labelDayTemp.center = CGPointMake(afternoonSquare.bounds.width*3/5, afternoonSquare.frame.height*8/12);
        labelDayTemp.textAlignment = NSTextAlignment.Center;
        afternoonSquare.addSubview(labelDayTemp);
        
        eveningSquare.backgroundColor = UIColor(red: 177/255, green: 105/255, blue: 90/255, alpha: 1);
        eveningSquare.frame = CGRect(x: self.view.bounds.origin.x, y: self.view.bounds.origin.y + self.view.bounds.height/6*4, width: self.view.bounds.width, height: self.view.bounds.height/6);
        self.view.addSubview(eveningSquare);
        
        labelEvening.text = "EVENING";
        labelEvening.textColor = UIColor.whiteColor();
        labelEvening.font = UIFont(name: "Lato-Regular", size: 20);
        labelEvening.sizeToFit();
        labelEvening.center = CGPointMake(eveningSquare.bounds.width*3/5, eveningSquare.frame.height*3/12);
        labelEvening.textAlignment = NSTextAlignment.Center;
        eveningSquare.addSubview(labelEvening);
        
        labelEveningTemp.text = "0º";
        labelEveningTemp.textColor = UIColor.whiteColor();
        labelEveningTemp.font = UIFont(name: "Lato-Regular", size: tempFontSize);
        labelEveningTemp.sizeToFit();
        labelEveningTemp.center = CGPointMake(eveningSquare.bounds.width*3/5, eveningSquare.frame.height*8/12);
        labelEveningTemp.textAlignment = NSTextAlignment.Center;
        eveningSquare.addSubview(labelEveningTemp);
        
        nightSquare.backgroundColor = UIColor(red: 100/255, green: 71/255, blue: 73/255, alpha: 1);
        nightSquare.frame = CGRect(x: self.view.bounds.origin.x, y: self.view.bounds.origin.y + self.view.bounds.height/6*5, width: self.view.bounds.width, height: self.view.bounds.height/6);
        self.view.addSubview(nightSquare);
        
        labelNight.text = "NIGHT";
        labelNight.textColor = UIColor.whiteColor();
        labelNight.font = UIFont(name: "Lato-Regular", size: 20);
        labelNight.sizeToFit();
        labelNight.center = CGPointMake(nightSquare.bounds.width*3/5, nightSquare.frame.height*3/12);
        labelNight.textAlignment = NSTextAlignment.Center;
        nightSquare.addSubview(labelNight);
        
        labelNightTemp.text = "-2º";
        labelNightTemp.textColor = UIColor.whiteColor();
        labelNightTemp.font = UIFont(name: "Lato-Regular", size: tempFontSize);
        labelNightTemp.sizeToFit();
        labelNightTemp.center = CGPointMake(nightSquare.bounds.width*3/5, nightSquare.frame.height*8/12);
        labelNightTemp.textAlignment = NSTextAlignment.Center;
        nightSquare.addSubview(labelNightTemp);
        
        UIView.animateWithDuration(1.0, delay: 0.0, options: options, animations: {
            self.morningSquare.frame = CGRect(x: self.view.bounds.origin.x, y: self.view.bounds.origin.y + 20, width: self.view.bounds.width, height: self.view.bounds.height/6*3-20)
            }, completion: nil);
        
        tapMorning.addTarget(self, action: "tappedMorningView");
        morningSquare.addGestureRecognizer(tapMorning);
        self.view.addSubview(morningSquare);
        
        tapAfter.addTarget(self, action: "tappedAfternoonView");
        afternoonSquare.addGestureRecognizer(tapAfter);
        self.view.addSubview(afternoonSquare);
        
        tapEve.addTarget(self, action: "tappedEveningView");
        eveningSquare.addGestureRecognizer(tapEve);
        self.view.addSubview(eveningSquare);
        
        tapNight.addTarget(self, action: "tappedNightView");
        nightSquare.addGestureRecognizer(tapNight);
        self.view.addSubview(nightSquare);
        
    }
    
    func tappedMorningView(){
       
        animatedMorning = true;
        animatedAfternoon = false;
        animatedEvening = false;
        animatedNight = false;
        animatedView = "morning";
        
        animateView();
        
    }
    
    func tappedAfternoonView() {
        
        animatedMorning = false;
        animatedAfternoon = true;
        animatedEvening = false;
        animatedNight = false;
        animatedView = "afternoon";
        
        animateView();
        
    }
    
    func tappedEveningView() {
        
        animatedMorning = false;
        animatedAfternoon = false;
        animatedEvening = true;
        animatedNight = false;
        animatedView = "evening";
        
        animateView();
        
    }
    
    func tappedNightView() {
        
        animatedMorning = false;
        animatedAfternoon = false;
        animatedEvening = false;
        animatedNight = true;
        animatedView = "night";
        
        animateView();
        
    }
    
    func animateView() {
        
        switch animatedView {
            
        case "morning":
            
            UIView.animateWithDuration(1.0, delay: 0.0, options: options, animations: {
                self.morningSquare.frame = CGRect(x: self.view.bounds.origin.x, y: self.view.bounds.origin.y + 20, width: self.view.bounds.width, height: self.view.bounds.height/6*3-20)
                }, completion: nil);
            
            
            
            UIView.animateWithDuration(1.0, delay: 0.0, options: options, animations: {
                self.afternoonSquare.frame = CGRect(x: self.view.bounds.origin.x, y: self.view.bounds.origin.y + self.view.bounds.height/6*3, width: self.view.bounds.width, height: self.view.bounds.height/6)
                }, completion: nil);
            
            UIView.animateWithDuration(1.0, delay: 0.0, options: options, animations: {
                self.eveningSquare.frame = CGRect(x: self.view.bounds.origin.x, y: self.view.bounds.origin.y + self.view.bounds.height/6*4, width: self.view.bounds.width, height: self.view.bounds.height/6)
                }, completion: nil);
            
            UIView.animateWithDuration(1.0, delay: 0.0, options: options, animations: {
                self.nightSquare.frame = CGRect(x: self.view.bounds.origin.x, y: self.view.bounds.origin.y + self.view.bounds.height/6*5, width: self.view.bounds.width, height: self.view.bounds.height/6)
                }, completion: nil);
            
        case "afternoon":
            
            UIView.animateWithDuration(1.0, delay: 0.0, options: options, animations: {
                self.morningSquare.frame = CGRect(x: self.view.bounds.origin.x, y: self.view.bounds.origin.y + 20, width: self.view.bounds.width, height: self.view.bounds.height/6)
                }, completion: nil);
            
            UIView.animateWithDuration(1.0, delay: 0.0, options: options, animations: {
                self.afternoonSquare.frame = CGRect(x: self.view.bounds.origin.x, y: self.view.bounds.origin.y + self.view.bounds.height/6 + 20, width: self.view.bounds.width, height: self.view.bounds.height/6*3-20)
                }, completion: nil);
            
            UIView.animateWithDuration(1.0, delay: 0.0, options: options, animations: {
                self.eveningSquare.frame = CGRect(x: self.view.bounds.origin.x, y: self.view.bounds.origin.y + self.view.bounds.height/6*4, width: self.view.bounds.width, height: self.view.bounds.height/6)
                }, completion: nil);
            
            UIView.animateWithDuration(1.0, delay: 0.0, options: options, animations: {
                self.nightSquare.frame = CGRect(x: self.view.bounds.origin.x, y: self.view.bounds.origin.y + self.view.bounds.height/6*5, width: self.view.bounds.width, height: self.view.bounds.height/6)
                }, completion: nil);
            
        case "evening":
            
            UIView.animateWithDuration(1.0, delay: 0.0, options: options, animations: {
                self.morningSquare.frame = CGRect(x: self.view.bounds.origin.x, y: self.view.bounds.origin.y + 20, width: self.view.bounds.width, height: self.view.bounds.height/6)
                }, completion: nil);
            
            UIView.animateWithDuration(1.0, delay: 0.0, options: options, animations: {
                self.afternoonSquare.frame = CGRect(x: self.view.bounds.origin.x, y: self.view.bounds.origin.y + self.view.bounds.height/6 + 20, width: self.view.bounds.width, height: self.view.bounds.height/6)
                }, completion: nil);
            
            UIView.animateWithDuration(1.0, delay: 0.0, options: options, animations: {
                self.eveningSquare.frame = CGRect(x: self.view.bounds.origin.x, y: self.view.bounds.origin.y + self.view.bounds.height/6*2 + 20, width: self.view.bounds.width, height: self.view.bounds.height/6*3-20)
                }, completion: nil);
            
            UIView.animateWithDuration(1.0, delay: 0.0, options: options, animations: {
                self.nightSquare.frame = CGRect(x: self.view.bounds.origin.x, y: self.view.bounds.origin.y + self.view.bounds.height/6*5, width: self.view.bounds.width, height: self.view.bounds.height/6)
                }, completion: nil);
            
        case "night":
            
            UIView.animateWithDuration(1.0, delay: 0.0, options: options, animations: {
                self.morningSquare.frame = CGRect(x: self.view.bounds.origin.x, y: self.view.bounds.origin.y + 20, width: self.view.bounds.width, height: self.view.bounds.height/6)
                }, completion: nil);
            
            UIView.animateWithDuration(1.0, delay: 0.0, options: options, animations: {
                self.afternoonSquare.frame = CGRect(x: self.view.bounds.origin.x, y: self.view.bounds.origin.y + self.view.bounds.height/6 + 20, width: self.view.bounds.width, height: self.view.bounds.height/6)
                }, completion: nil);
            
            UIView.animateWithDuration(1.0, delay: 0.0, options: options, animations: {
                self.eveningSquare.frame = CGRect(x: self.view.bounds.origin.x, y: self.view.bounds.origin.y + self.view.bounds.height/6*2 + 20, width: self.view.bounds.width, height: self.view.bounds.height/6)
                }, completion: nil);
            
            UIView.animateWithDuration(1.0, delay: 0.0, options: options, animations: {
                self.nightSquare.frame = CGRect(x: self.view.bounds.origin.x, y: self.view.bounds.origin.y + self.view.bounds.height/6*3 + 20, width: self.view.bounds.width, height: self.view.bounds.height/6*3-20)
                }, completion: nil);
            
        default:
            
            UIView.animateWithDuration(1.0, delay: 0.0, options: options, animations: {
                self.morningSquare.frame = CGRect(x: self.view.bounds.origin.x, y: self.view.bounds.origin.y + 20, width: self.view.bounds.width, height: self.view.bounds.height/6*3-20)
                }, completion: nil);
            
            UIView.animateWithDuration(1.0, delay: 0.0, options: options, animations: {
                self.afternoonSquare.frame = CGRect(x: self.view.bounds.origin.x, y: self.view.bounds.origin.y + self.view.bounds.height/6*3, width: self.view.bounds.width, height: self.view.bounds.height/6)
                }, completion: nil);
            
            UIView.animateWithDuration(1.0, delay: 0.0, options: options, animations: {
                self.eveningSquare.frame = CGRect(x: self.view.bounds.origin.x, y: self.view.bounds.origin.y + self.view.bounds.height/6*4, width: self.view.bounds.width, height: self.view.bounds.height/6)
                }, completion: nil);
            
            UIView.animateWithDuration(1.0, delay: 0.0, options: options, animations: {
                self.nightSquare.frame = CGRect(x: self.view.bounds.origin.x, y: self.view.bounds.origin.y + self.view.bounds.height/6*5, width: self.view.bounds.width, height: self.view.bounds.height/6)
                }, completion: nil);
            
        }
    }
    /*
    func getCurrentWeatherData() -> Void {
        
        let baseURL = NSURL(string: "https://api.forecast.io/forecast/\(apiKey)/");
        
        let forecastURL = NSURL(string: "-22.915493,-43.229674", relativeToURL: baseURL);
        
        let sharedSession = NSURLSession.sharedSession();
        
        let downloadTask: NSURLSessionDownloadTask = sharedSession.downloadTaskWithURL(forecastURL, completionHandler: { (location: NSURL!, response: NSURLResponse!, error: NSError!) -> Void in
            
            if (error == nil){
                let dataObject = NSData(contentsOfURL: location);
                let weatherDictionary: NSDictionary = NSJSONSerialization.JSONObjectWithData(dataObject, options: nil, error: nil) as NSDictionary;
                
                let currentWeather = current(weatherDictionary: weatherDictionary);
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.temperatureLabel.text = "\(currentWeather.temperature)";
                    self.iconView.image = currentWeather.icon!;
                    self.currentTimeLabel.text = "At \(currentWeather.currentTime!) it is";
                    self.humidityLabel.text = "\(currentWeather.humidity)"
                    self.precipitationLabel.text = "\(currentWeather.precipProbability)"
                    self.summaryLabel.text = "\(currentWeather.summary)"
                    
                    self.refreshActivityIndicator.stopAnimating();
                    self.refreshActivityIndicator.hidden = true;
                    self.refreshButton.hidden = false;
                    
                })
                
            } else {
                
                let networkIssueController = UIAlertController(title: "Error", message: "Unable to load data. Connectivity error!", preferredStyle: .Alert);
                
                let okButton = UIAlertAction(title: "Ok", style: .Default, handler: nil)
                networkIssueController.addAction(okButton);
                
                let cancelButton = UIAlertAction(title: "Cancel", style: .Default, handler: nil)
                networkIssueController.addAction(cancelButton);
                
                self.presentViewController(networkIssueController, animated: true, completion: nil);
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.refreshActivityIndicator.stopAnimating();
                    self.refreshActivityIndicator.hidden = true;
                    self.refreshButton.hidden = false;
                })
                
            }
            
        })
        downloadTask.resume();
        
    }*/

}

