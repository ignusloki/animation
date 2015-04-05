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
    
    let morningIcon = UIView();
    let dayIcon = UIView();
    let eveningIcon = UIView();
    let nightIcon = UIView();
    
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
    
    //Labels Icon
    let labelMorningIcon = UILabel();
    let labelDayIcon = UILabel();
    let labelEveningIcon = UILabel();
    let labelNightIcon = UILabel();
    
    //Images
    let morningImage = UIImageView();
    let dayImage = UIImageView();
    let eveningImage = UIImageView();
    let nightImage = UIImageView();
    
    // Create and add the gesture
    let tapMorning = UITapGestureRecognizer();
    let tapAfter = UITapGestureRecognizer();
    let tapEve = UITapGestureRecognizer();
    let tapNight = UITapGestureRecognizer();
    
    // Options for animation between the views
    let options = UIViewAnimationOptions.TransitionNone;
    
    // Font size for weather icons
    let iconWeatherSize: CGFloat = 80;
    
    // Var for animation information and control
    var animatedMorning: Bool = false;
    var animatedAfternoon: Bool = false;
    var animatedEvening: Bool = false;
    var animatedNight: Bool = false;
    var animatedView: String = "morning";
    
    var tempFontSize:CGFloat = 50;
    
    //var for values
    var morningHumVal: String = "91%";
    
    // Var for margin of the labels
    var labelMarginX:CGFloat = 3.5/5;
    
    var iconMarginLeft: CGFloat = 0;
    var iconMarginTop: CGFloat = 0;
    
    //var for date
    var day: String = "";
    
    // API key to access
    private let apiKey = "7cabaf0493ec4339be738cc061d42c0b";

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let date = NSDate();
        let calendar = NSCalendar.currentCalendar();
        let components = calendar.components(.CalendarUnitDay | .CalendarUnitHour, fromDate: date);
        let hour = components.hour;
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd"
        day = dateFormatter.stringFromDate(NSDate());
        
        //Set views and targets
        setContainersView();
        
        //Set labels in each view
        setLabelsViews();
        
        //Update info and labels
        getCurrentWeatherData();
        
        //Set view according to hour
        //setStartView(hour);
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setContainersView(){        
        
        var screenSize = UIScreen.mainScreen().bounds;
        iconMarginLeft = screenSize.size.width * 0.05;
        iconMarginTop = screenSize.size.height * 0.15;
        
        //NIGHT
        
        nightSquare.backgroundColor = UIColor(red: 100/255, green: 71/255, blue: 73/255, alpha: 1);
        nightSquare.frame = CGRect(x: self.view.bounds.origin.x, y: self.view.bounds.origin.y + self.view.bounds.height/6*5, width: self.view.bounds.width, height: self.view.bounds.height/6);
        nightIcon.frame = CGRect(x: nightSquare.bounds.width * 1/16, y: nightSquare.bounds.origin.y + nightSquare.bounds.height * 1/30, width: nightSquare.bounds.width * 1.5/5, height: nightSquare.bounds.height);
        self.view.addSubview(nightSquare);
        
        //MORNING
        
        morningSquare.backgroundColor = UIColor(red: 227/255, green: 187/255, blue: 136/255, alpha: 1)
        morningSquare.frame = CGRect(x: self.view.bounds.origin.x, y: self.view.bounds.origin.y + 20, width: self.view.bounds.width, height: self.view.bounds.height/6);
        morningIcon.frame = CGRect(x: morningSquare.bounds.width * 1/16, y: morningSquare.bounds.origin.y + morningSquare.bounds.height * 1/30, width:morningSquare.bounds.width * 1.5/5, height: morningSquare.bounds.height);
        
        //DAY
        
        afternoonSquare.backgroundColor = UIColor(red: 216/255, green: 152/255, blue: 100/255, alpha: 1);
        afternoonSquare.frame = CGRect(x: self.view.bounds.origin.x, y: self.view.bounds.origin.y + self.view.bounds.height/6*3, width: self.view.bounds.width, height: self.view.bounds.height/6);
        dayIcon.frame = CGRect(x: afternoonSquare.bounds.width * 1/16, y: afternoonSquare.bounds.origin.y + afternoonSquare.bounds.height * 1/30, width: afternoonSquare.bounds.width * 1.5/5, height: afternoonSquare.bounds.height);
        
        //EVENING
        
        eveningSquare.backgroundColor = UIColor(red: 177/255, green: 105/255, blue: 90/255, alpha: 1);
        eveningSquare.frame = CGRect(x: self.view.bounds.origin.x, y: self.view.bounds.origin.y + self.view.bounds.height/6*4, width: self.view.bounds.width, height: self.view.bounds.height/6);
        eveningIcon.frame = CGRect(x: eveningSquare.bounds.width * 1/16, y: eveningSquare.bounds.origin.y + eveningSquare.bounds.height * 1/30, width: eveningSquare.bounds.width * 1.5/5, height: eveningSquare.bounds.height);
        self.view.addSubview(eveningSquare);
        
        

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
            showMorningIcon();
            
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
            
            showDayIcon();
            
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
            
            showEveningIcon()
            
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
            
            showNightIcon();
            
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
    
    func getCurrentWeatherData() -> Void {
        
        let baseURL = NSURL(string: "https://api.forecast.io/forecast/\(apiKey)/");
        let sharedSession = NSURLSession.sharedSession();
        var forecastURL: NSURL;
        
        for index in 1...4 {
            
            switch index {
                
            case 1:
                forecastURL = NSURL(string: "-22.915493,-43.229674,2015-04-\(day)T07:00:00", relativeToURL: baseURL);
            case 2:
                forecastURL = NSURL(string: "-22.915493,-43.229674,2015-04-\(day)T13:00:00", relativeToURL: baseURL);
            case 3:
                forecastURL = NSURL(string: "-22.915493,-43.229674,2015-04-\(day)T19:00:00", relativeToURL: baseURL);
            case 4:
                forecastURL = NSURL(string: "-22.915493,-43.229674,2015-04-\(day)T01:00:00", relativeToURL: baseURL);
                
            default: forecastURL = NSURL(string: "-22.915493,-43.229674,2015-04-\(day)T07:00:00", relativeToURL: baseURL);
            };
            
            let downloadTask: NSURLSessionDownloadTask = sharedSession.downloadTaskWithURL(forecastURL, completionHandler: { (location: NSURL!, response: NSURLResponse!, error: NSError!) -> Void in
                
                if (error == nil){
                    let dataObject = NSData(contentsOfURL: location);
                    let weatherDictionary: NSDictionary = NSJSONSerialization.JSONObjectWithData(dataObject, options: nil, error: nil) as NSDictionary;
                    let currentWeather = current(weatherDictionary: weatherDictionary);
                    
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        
                        let celsius = (currentWeather.temperature - 32) * 5/9 as Int;
                        println("\(index) - \(celsius)");
                        println("\(index) - \(currentWeather.humidity)");
                        println("\(index) - \(currentWeather.precipProbability)");
                        println("\(index) - \(currentWeather.summary)");
                        
                        /*
                        self.labelMorningTemp.text = String(celsius);
                        self.labelMorningHumVal.text = "\(currentWeather.humidity)";
                        self.labelMorningSumm.text = "\(currentWeather.summary)";
                        self.labelMorningSumm.sizeToFit();
                        self.labelMorningIcon.text = currentWeather.icon;
                        */
                        
                        self.updateWeatherInfo(currentWeather,timeWeather: index);
                    })
                    
                } /*else {
                    
                    let networkIssueController = UIAlertController(title: "Error", message: "Unable to load data. Connectivity error!", preferredStyle: .Alert);
                    
                    let okButton = UIAlertAction(title: "Ok", style: .Default, handler: nil)
                    networkIssueController.addAction(okButton);
                    
                    let cancelButton = UIAlertAction(title: "Cancel", style: .Default, handler: nil)
                    networkIssueController.addAction(cancelButton);
                    
                    self.presentViewController(networkIssueController, animated: true, completion: nil);
                  */
                
                })
            downloadTask.resume();
        }
        
    }
    
    func setStartView(hour: Int) {
        
        switch hour {
            
        case 0...5:
            tappedNightView();
        case 6...11:
            tappedMorningView();
        case 12...17:
            tappedAfternoonView();
        case 18...23:
            tappedEveningView();
            
        default: tappedMorningView();
        };
        
    }
    
    func setLabelsViews(){
        
        //Morning labels
        labelMorning.text = "MORNING";
        labelMorning.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.4);
        labelMorning.font = UIFont(name: "Lato-Regular", size: 20);
        labelMorning.sizeToFit();
        labelMorning.center = CGPointMake(morningSquare.bounds.width * labelMarginX, morningSquare.frame.height*3/12);
        labelMorning.textAlignment = NSTextAlignment.Left;
        morningSquare.addSubview(labelMorning);
        
        labelMorningHum.text = "Humidity:";
        labelMorningHum.textColor = UIColor.whiteColor();
        labelMorningHum.font = UIFont(name: "Lato-Regular", size: tempFontSize * 0.3);
        labelMorningHum.sizeToFit();
        labelMorningHum.center = CGPointMake(morningSquare.bounds.width * labelMarginX, morningSquare.frame.height*21/12);
        labelMorningHum.textAlignment = NSTextAlignment.Left;
        morningSquare.addSubview(labelMorningHum);
        
        //Day labels
        labelDay.text = "DAY";
        labelDay.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.4);
        labelDay.font = UIFont(name: "Lato-Regular", size: 20);
        labelDay.sizeToFit();
        labelDay.center = CGPointMake(afternoonSquare.bounds.width * labelMarginX, afternoonSquare.frame.height*3/12);
        labelDay.textAlignment = NSTextAlignment.Left;
        afternoonSquare.addSubview(labelDay);
        
        labelDayHum.text = "Humidity:";
        labelDayHum.textColor = UIColor.whiteColor();
        labelDayHum.font = UIFont(name: "Lato-Regular", size: tempFontSize * 0.3);
        labelDayHum.sizeToFit();
        labelDayHum.center = CGPointMake(afternoonSquare.bounds.width * labelMarginX, afternoonSquare.frame.height*21/12);
        labelDayHum.textAlignment = NSTextAlignment.Left;
        afternoonSquare.addSubview(labelDayHum);
        
        labelDayTemp.center = CGPointMake(afternoonSquare.bounds.width * labelMarginX, afternoonSquare.frame.height*8/12);
        
        //Evening labels
        labelEvening.text = "EVENING";
        labelEvening.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.4);
        labelEvening.font = UIFont(name: "Lato-Regular", size: 20);
        labelEvening.sizeToFit();
        labelEvening.center = CGPointMake(eveningSquare.bounds.width * labelMarginX, eveningSquare.frame.height*3/12);
        labelEvening.textAlignment = NSTextAlignment.Left;
        eveningSquare.addSubview(labelEvening);
        
        labelEveningHum.text = "Humidity";
        labelEveningHum.textColor = UIColor.whiteColor();
        labelEveningHum.font = UIFont(name: "Lato-Regular", size: tempFontSize * 0.3);
        labelEveningHum.sizeToFit();
        labelEveningHum.center = CGPointMake(eveningSquare.bounds.width * labelMarginX, eveningSquare.frame.height*21/12);
        labelEveningHum.textAlignment = NSTextAlignment.Left;
        eveningSquare.addSubview(labelEveningHum);
        
        //Night labels
        labelNight.text = "NIGHT";
        labelNight.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.4);
        labelNight.font = UIFont(name: "Lato-Regular", size: 20);
        labelNight.sizeToFit();
        labelNight.center = CGPointMake(nightSquare.bounds.width * labelMarginX, nightSquare.frame.height*3/12);
        labelNight.textAlignment = NSTextAlignment.Left;
        nightSquare.addSubview(labelNight);
        
        labelNightHum.text = "Humidity";
        labelNightHum.textColor = UIColor.whiteColor();
        labelNightHum.font = UIFont(name: "Lato-Regular", size: tempFontSize * 0.3);
        labelNightHum.sizeToFit();
        labelNightHum.center = CGPointMake(nightSquare.bounds.width * labelMarginX, nightSquare.frame.height*21/12);
        labelNightHum.textAlignment = NSTextAlignment.Left;
        nightSquare.addSubview(labelNightHum);
        
    }
    
    func updateWeatherInfo(currentWeather: current, timeWeather: Int){
        
        let celsius = (currentWeather.temperature - 32) * 5/9 as Int;
        
        switch timeWeather {
        
            case 1:
        
                labelMorningTemp.text = String(celsius) + "º";
                labelMorningTemp.textColor = UIColor.whiteColor();
                labelMorningTemp.font = UIFont(name: "Lato-Regular", size: tempFontSize);
                labelMorningTemp.sizeToFit();
                labelMorningTemp.center = CGPointMake(morningSquare.bounds.width * labelMarginX, morningSquare.frame.height*8/12);
                labelMorningTemp.textAlignment = NSTextAlignment.Left;
                morningSquare.addSubview(labelMorningTemp);
                
                labelMorningSumm.text = "\(currentWeather.summary)";
                labelMorningSumm.textColor = UIColor.whiteColor();
                labelMorningSumm.font = UIFont(name: "Lato-Regular", size: tempFontSize * 0.5);
                labelMorningSumm.sizeToFit();
                labelMorningSumm.center = CGPointMake(morningSquare.bounds.width * labelMarginX, morningSquare.frame.height*15/12);
                labelMorningSumm.textAlignment = NSTextAlignment.Left;
                morningSquare.addSubview(labelMorningSumm);
                
                labelMorningHumVal.text = "\(currentWeather.humidity)";
                labelMorningHumVal.textColor = UIColor.whiteColor();
                labelMorningHumVal.font = UIFont(name: "Lato-Regular", size: tempFontSize * 0.3);
                labelMorningHumVal.sizeToFit();
                labelMorningHumVal.center = CGPointMake(morningSquare.bounds.width * labelMarginX, morningSquare.frame.height*24/12);
                labelMorningHumVal.textAlignment = NSTextAlignment.Left;
                morningSquare.addSubview(labelMorningHumVal);
                
                labelMorningIcon.text = currentWeather.icon;
                labelMorningIcon.textColor = UIColor(red: 216/255, green: 152/255, blue: 100/255, alpha: 1);
                labelMorningIcon.font = UIFont(name: "WeatherIcons-Regular", size: iconWeatherSize);
                labelMorningIcon.adjustsFontSizeToFitWidth = true;
                labelMorningIcon.sizeToFit();
                labelMorningIcon.center = CGPointMake(labelDayIcon.bounds.width/2 + iconMarginLeft, labelDayIcon.bounds.height/2 + iconMarginTop);
                labelMorningIcon.textAlignment = NSTextAlignment.Center;
                morningIcon.addSubview(labelMorningIcon);
            
            case 2:
                
                labelDayTemp.text = String(celsius) + "º";
                labelDayTemp.textColor = UIColor.whiteColor();
                labelDayTemp.font = UIFont(name: "Lato-Regular", size: tempFontSize);
                labelDayTemp.sizeToFit();
                labelDayTemp.center = CGPointMake(afternoonSquare.bounds.width * labelMarginX, afternoonSquare.frame.height*8/12);
                labelDayTemp.textAlignment = NSTextAlignment.Left;
                afternoonSquare.addSubview(labelDayTemp);
            
                labelDaySumm.text = "\(currentWeather.summary)";
                labelDaySumm.textColor = UIColor.whiteColor();
                labelDaySumm.font = UIFont(name: "Lato-Regular", size: tempFontSize * 0.5);
                labelDaySumm.sizeToFit();
                labelDaySumm.center = CGPointMake(afternoonSquare.bounds.width * labelMarginX, afternoonSquare.frame.height*15/12);
                labelDaySumm.textAlignment = NSTextAlignment.Left;
                afternoonSquare.addSubview(labelDaySumm);
                
                labelDayHumVal.text = "\(currentWeather.humidity)";
                labelDayHumVal.textColor = UIColor.whiteColor();
                labelDayHumVal.font = UIFont(name: "Lato-Regular", size: tempFontSize * 0.3);
                labelDayHumVal.sizeToFit();
                labelDayHumVal.center = CGPointMake(afternoonSquare.bounds.width * labelMarginX, afternoonSquare.frame.height*24/12);
                labelDayHumVal.textAlignment = NSTextAlignment.Left;
                afternoonSquare.addSubview(labelDayHumVal);
                
                labelDayIcon.text = currentWeather.icon;
                labelDayIcon.textColor = UIColor(red: 100/255, green: 71/255, blue: 73/255, alpha: 1);
                labelDayIcon.font = UIFont(name: "WeatherIcons-Regular", size: iconWeatherSize);
                labelDayIcon.adjustsFontSizeToFitWidth = true;
                labelDayIcon.sizeToFit();
                labelDayIcon.center = CGPointMake(labelDayIcon.bounds.width/2 + iconMarginLeft, labelDayIcon.bounds.height/2 + iconMarginTop);
                labelDayIcon.textAlignment = NSTextAlignment.Center;
                dayIcon.addSubview(labelDayIcon);
            
            case 3:
            
                labelEveningTemp.text = String(celsius) + "º";
                labelEveningTemp.textColor = UIColor.whiteColor();
                labelEveningTemp.font = UIFont(name: "Lato-Regular", size: tempFontSize);
                labelEveningTemp.sizeToFit();
                labelEveningTemp.center = CGPointMake(eveningSquare.bounds.width * labelMarginX, eveningSquare.frame.height*8/12);
                labelEveningTemp.textAlignment = NSTextAlignment.Left;
                eveningSquare.addSubview(labelEveningTemp);
                
                labelEveningSumm.text = "\(currentWeather.summary)";
                labelEveningSumm.textColor = UIColor.whiteColor();
                labelEveningSumm.font = UIFont(name: "Lato-Regular", size: tempFontSize * 0.5);
                labelEveningSumm.sizeToFit();
                labelEveningSumm.center = CGPointMake(eveningSquare.bounds.width * labelMarginX, eveningSquare.frame.height*15/12);
                labelEveningSumm.textAlignment = NSTextAlignment.Left;
                eveningSquare.addSubview(labelEveningSumm);
                
                labelEveningHumVal.text = "\(currentWeather.humidity)";
                labelEveningHumVal.textColor = UIColor.whiteColor();
                labelEveningHumVal.font = UIFont(name: "Lato-Regular", size: tempFontSize * 0.3);
                labelEveningHumVal.sizeToFit();
                labelEveningHumVal.center = CGPointMake(eveningSquare.bounds.width * labelMarginX, eveningSquare.frame.height*24/12);
                labelEveningHumVal.textAlignment = NSTextAlignment.Left;
                eveningSquare.addSubview(labelEveningHumVal);
            
                labelEveningIcon.text = currentWeather.icon;
                labelEveningIcon.textColor = UIColor(red: 227/255, green: 187/255, blue: 136/255, alpha: 1);
                labelEveningIcon.font = UIFont(name: "WeatherIcons-Regular", size: iconWeatherSize);
                labelEveningIcon.adjustsFontSizeToFitWidth = true;
                labelEveningIcon.sizeToFit();
                labelEveningIcon.center = CGPointMake(labelEveningIcon.bounds.width/2 + iconMarginLeft, labelEveningIcon.bounds.height/2 + iconMarginTop);
                labelEveningIcon.textAlignment = NSTextAlignment.Center;
                eveningIcon.addSubview(labelEveningIcon);
            
            case 4:
            
                labelNightTemp.text = String(celsius) + "º";
                labelNightTemp.textColor = UIColor.whiteColor();
                labelNightTemp.font = UIFont(name: "Lato-Regular", size: tempFontSize);
                labelNightTemp.sizeToFit();
                labelNightTemp.center = CGPointMake(nightSquare.bounds.width * labelMarginX, nightSquare.frame.height*8/12);
                labelNightTemp.textAlignment = NSTextAlignment.Left;
                nightSquare.addSubview(labelNightTemp);
            
                labelNightSumm.text = "\(currentWeather.summary)";
                labelNightSumm.textColor = UIColor.whiteColor();
                labelNightSumm.font = UIFont(name: "Lato-Regular", size: tempFontSize * 0.5);
                labelNightSumm.sizeToFit();
                labelNightSumm.center = CGPointMake(nightSquare.bounds.width * labelMarginX, nightSquare.frame.height*15/12);
                labelNightSumm.textAlignment = NSTextAlignment.Left;
                nightSquare.addSubview(labelNightSumm);
                
                labelNightHumVal.text = "\(currentWeather.humidity)";
                labelNightHumVal.textColor = UIColor.whiteColor();
                labelNightHumVal.font = UIFont(name: "Lato-Regular", size: tempFontSize * 0.3);
                labelNightHumVal.sizeToFit();
                labelNightHumVal.center = CGPointMake(nightSquare.bounds.width * labelMarginX, nightSquare.frame.height*24/12);
                labelNightHumVal.textAlignment = NSTextAlignment.Left;
                nightSquare.addSubview(labelNightHumVal);
            
                labelNightIcon.text = currentWeather.icon;
                labelNightIcon.textColor = UIColor(red: 216/255, green: 152/255, blue: 136/255, alpha: 1);
                labelNightIcon.font = UIFont(name: "WeatherIcons-Regular", size: iconWeatherSize);
                labelNightIcon.adjustsFontSizeToFitWidth = true;
                labelNightIcon.sizeToFit();
                labelNightIcon.center = CGPointMake(labelNightIcon.bounds.width/2 + iconMarginLeft, labelNightIcon.bounds.height/2 + iconMarginTop);
                labelNightIcon.textAlignment = NSTextAlignment.Center;
                nightIcon.addSubview(labelNightIcon);
            
            default:
            
                labelMorningTemp.text = "-1º";
                labelMorningTemp.textColor = UIColor.whiteColor();
                labelMorningTemp.font = UIFont(name: "Lato-Regular", size: tempFontSize);
                labelMorningTemp.sizeToFit();
                labelMorningTemp.center = CGPointMake(morningSquare.bounds.width * labelMarginX, morningSquare.frame.height*8/12);
                labelMorningTemp.textAlignment = NSTextAlignment.Left;
                morningSquare.addSubview(labelMorningTemp);
                
                labelMorningSumm.text = "Sunny";
                labelMorningSumm.textColor = UIColor.whiteColor();
                labelMorningSumm.font = UIFont(name: "Lato-Regular", size: tempFontSize * 0.5);
                labelMorningSumm.sizeToFit();
                labelMorningSumm.center = CGPointMake(morningSquare.bounds.width * labelMarginX, morningSquare.frame.height*15/12);
                labelMorningSumm.textAlignment = NSTextAlignment.Left;
                morningSquare.addSubview(labelMorningSumm);
                
                labelMorningHumVal.text = "\(morningHumVal)";
                labelMorningHumVal.textColor = UIColor.whiteColor();
                labelMorningHumVal.font = UIFont(name: "Lato-Regular", size: tempFontSize * 0.3);
                labelMorningHumVal.sizeToFit();
                labelMorningHumVal.center = CGPointMake(morningSquare.bounds.width * labelMarginX * 1.06, morningSquare.frame.height*24/12);
                labelMorningHumVal.textAlignment = NSTextAlignment.Left;
                morningSquare.addSubview(labelMorningHumVal);
            
                labelMorningIcon.text = "\u{f00d}";
                labelMorningIcon.textColor = UIColor(red: 216/255, green: 152/255, blue: 100/255, alpha: 1);
                labelMorningIcon.font = UIFont(name: "WeatherIcons-Regular", size: iconWeatherSize);
                labelMorningIcon.adjustsFontSizeToFitWidth = true;
                labelMorningIcon.sizeToFit();
                labelMorningIcon.center = CGPointMake(labelMorningIcon.bounds.width/2 + iconMarginLeft, labelMorningIcon.bounds.height/2 + iconMarginTop);
                labelMorningIcon.textAlignment = NSTextAlignment.Left;
                morningIcon.addSubview(labelMorningIcon);
            
                labelDayTemp.text = "+3º";
                labelDayTemp.textColor = UIColor.whiteColor();
                labelDayTemp.font = UIFont(name: "Lato-Regular", size: tempFontSize);
                labelDayTemp.sizeToFit();
                labelDayTemp.center = CGPointMake(afternoonSquare.bounds.width * labelMarginX, afternoonSquare.frame.height*8/12);
                labelDayTemp.textAlignment = NSTextAlignment.Left;
                afternoonSquare.addSubview(labelDayTemp);
                
                labelEveningTemp.text = "0º";
                labelEveningTemp.textColor = UIColor.whiteColor();
                labelEveningTemp.font = UIFont(name: "Lato-Regular", size: tempFontSize);
                labelEveningTemp.sizeToFit();
                labelEveningTemp.center = CGPointMake(eveningSquare.bounds.width * labelMarginX, eveningSquare.frame.height*8/12);
                labelEveningTemp.textAlignment = NSTextAlignment.Left;
                eveningSquare.addSubview(labelEveningTemp);
                
                labelNightTemp.text = "-2º";
                labelNightTemp.textColor = UIColor.whiteColor();
                labelNightTemp.font = UIFont(name: "Lato-Regular", size: tempFontSize);
                labelNightTemp.sizeToFit();
                labelNightTemp.center = CGPointMake(nightSquare.bounds.width * labelMarginX, nightSquare.frame.height*8/12);
                labelNightTemp.textAlignment = NSTextAlignment.Left;
                nightSquare.addSubview(labelNightTemp);
        }
        
        
        
    }
    
    func setWeatherIcon() {
        
        //Icons Animated
        
        labelDayIcon.text = "\u{f002}";
        labelDayIcon.textColor = UIColor(red: 100/255, green: 71/255, blue: 73/255, alpha: 1);
        labelDayIcon.font = UIFont(name: "WeatherIcons-Regular", size: iconWeatherSize);
        labelDayIcon.adjustsFontSizeToFitWidth = true;
        labelDayIcon.sizeToFit();
        labelDayIcon.center = CGPointMake(labelDayIcon.bounds.width/2 + iconMarginLeft, labelDayIcon.bounds.height/2 + iconMarginTop);
        labelDayIcon.textAlignment = NSTextAlignment.Left;
        dayIcon.addSubview(labelDayIcon);
        
        labelEveningIcon.text = "\u{f009}";
        labelEveningIcon.textColor = UIColor(red: 227/255, green: 187/255, blue: 136/255, alpha: 1);
        labelEveningIcon.font = UIFont(name: "WeatherIcons-Regular", size: iconWeatherSize);
        labelEveningIcon.adjustsFontSizeToFitWidth = true;
        labelEveningIcon.sizeToFit();
        labelEveningIcon.center = CGPointMake(labelEveningIcon.bounds.width/2 + iconMarginLeft, labelEveningIcon.bounds.height/2 + iconMarginTop);
        labelEveningIcon.textAlignment = NSTextAlignment.Left;
        eveningIcon.addSubview(labelEveningIcon);
        
        labelNightIcon.text = "\u{f02a}";
        labelNightIcon.textColor = UIColor(red: 227/255, green: 187/255, blue: 136/255, alpha: 1);
        labelNightIcon.font = UIFont(name: "WeatherIcons-Regular", size: iconWeatherSize);
        labelNightIcon.adjustsFontSizeToFitWidth = true;
        labelNightIcon.sizeToFit();
        labelNightIcon.center = CGPointMake(labelNightIcon.bounds.width/2 + iconMarginLeft, labelNightIcon.bounds.height/2 + iconMarginTop);
        labelNightIcon.textAlignment = NSTextAlignment.Left;
        nightIcon.addSubview(labelNightIcon);
        
    }
    
    func showMorningIcon(){
        morningSquare.addSubview(morningIcon);
        UIView.animateWithDuration(0.75, animations: {
            self.labelMorningIcon.center = CGPoint(x: self.labelMorningIcon.bounds.width/2 + UIScreen.mainScreen().bounds.size.width * 0.05, y: self.labelMorningIcon.bounds.height/2 + UIScreen.mainScreen().bounds.size.height * 0.05)});
        
        UIView.animateWithDuration(0.75, animations: {
            self.labelDayIcon.center = CGPoint(x: self.labelDayIcon.bounds.width/2 + UIScreen.mainScreen().bounds.size.width * 0.05, y: self.labelDayIcon.bounds.height/2 + UIScreen.mainScreen().bounds.size.height * 0.25)});
        
        UIView.animateWithDuration(0.75, animations: {
            self.labelEveningIcon.center = CGPoint(x: self.labelEveningIcon.bounds.width/2 + UIScreen.mainScreen().bounds.size.width * 0.05, y: self.labelEveningIcon.bounds.height/2 + UIScreen.mainScreen().bounds.size.height * 0.25)});
        
        UIView.animateWithDuration(0.75, animations: {
            self.labelNightIcon.center = CGPoint(x: self.labelNightIcon.bounds.width/2 + UIScreen.mainScreen().bounds.size.width * 0.05, y: self.labelNightIcon.bounds.height/2 + UIScreen.mainScreen().bounds.size.height * 0.25)});
        
        /* Rotation animation disable for now */
        /*
        UIView.animateWithDuration(1, delay: 0.0, options: .CurveLinear | .Repeat, animations: {
        self.labelMorningIcon.transform = CGAffineTransformMakeRotation(CGFloat(M_PI));
        }, completion: {finished in self.labelMorningIcon.transform = CGAffineTransformMakeRotation(CGFloat(2.0 * M_PI))});
        */
        
    }

    func showDayIcon(){
        
        afternoonSquare.addSubview(dayIcon);
        
        UIView.animateWithDuration(0.75, animations: {
            self.labelMorningIcon.center = CGPoint(x: self.labelMorningIcon.bounds.width/2 + UIScreen.mainScreen().bounds.size.width * 0.05, y: self.labelMorningIcon.bounds.height/2 + UIScreen.mainScreen().bounds.size.height * 0.25)});
        
        UIView.animateWithDuration(0.75, animations: {
            self.labelDayIcon.center = CGPoint(x: self.labelDayIcon.bounds.width/2 + UIScreen.mainScreen().bounds.size.width * 0.05, y: self.labelDayIcon.bounds.height/2 + UIScreen.mainScreen().bounds.size.height * 0.05)});
        
        UIView.animateWithDuration(0.75, animations: {
            self.labelEveningIcon.center = CGPoint(x: self.labelEveningIcon.bounds.width/2 + UIScreen.mainScreen().bounds.size.width * 0.05, y: self.labelEveningIcon.bounds.height/2 + UIScreen.mainScreen().bounds.size.height * 0.25)});
        
        UIView.animateWithDuration(0.75, animations: {
            self.labelNightIcon.center = CGPoint(x: self.labelNightIcon.bounds.width/2 + UIScreen.mainScreen().bounds.size.width * 0.05, y: self.labelNightIcon.bounds.height/2 + UIScreen.mainScreen().bounds.size.height * 0.25)});
        
    }
    
    func showEveningIcon(){
        
        UIView.animateWithDuration(0.75, animations: {
            self.labelMorningIcon.center = CGPoint(x: self.labelMorningIcon.bounds.width/2 + UIScreen.mainScreen().bounds.size.width * 0.05, y: self.labelMorningIcon.bounds.height/2 + UIScreen.mainScreen().bounds.size.height * 0.25)});
        
        UIView.animateWithDuration(0.75, animations: {
            self.labelDayIcon.center = CGPoint(x: self.labelDayIcon.bounds.width/2 + UIScreen.mainScreen().bounds.size.width * 0.05, y: self.labelDayIcon.bounds.height/2 + UIScreen.mainScreen().bounds.size.height * 0.25)});
        
        eveningSquare.addSubview(eveningIcon);
        
        UIView.animateWithDuration(0.75, animations: {
            self.labelEveningIcon.center = CGPoint(x: self.labelEveningIcon.bounds.width/2 + UIScreen.mainScreen().bounds.size.width * 0.05, y: self.labelEveningIcon.bounds.height/2 + UIScreen.mainScreen().bounds.size.height * 0.05)});
        
        UIView.animateWithDuration(0.75, animations: {
            self.labelNightIcon.center = CGPoint(x: self.labelNightIcon.bounds.width/2 + UIScreen.mainScreen().bounds.size.width * 0.05, y: self.labelNightIcon.bounds.height/2 + UIScreen.mainScreen().bounds.size.height * 0.25)});
        
    }
    
    func showNightIcon(){
        
        nightSquare.addSubview(nightIcon);
        
        UIView.animateWithDuration(0.75, animations: {
            self.labelMorningIcon.center = CGPoint(x: self.labelMorningIcon.bounds.width/2 + UIScreen.mainScreen().bounds.size.width * 0.05, y: self.labelMorningIcon.bounds.height/2 + UIScreen.mainScreen().bounds.size.height * 0.25)});
        
        UIView.animateWithDuration(0.75, animations: {
            self.labelDayIcon.center = CGPoint(x: self.labelDayIcon.bounds.width/2 + UIScreen.mainScreen().bounds.size.width * 0.05, y: self.labelDayIcon.bounds.height/2 + UIScreen.mainScreen().bounds.size.height * 0.25)});
        
        UIView.animateWithDuration(0.75, animations: {
            self.labelEveningIcon.center = CGPoint(x: self.labelEveningIcon.bounds.width/2 + UIScreen.mainScreen().bounds.size.width * 0.05, y: self.labelEveningIcon.bounds.height/2 + UIScreen.mainScreen().bounds.size.height * 0.25)});
        
        UIView.animateWithDuration(0.75, animations: {
            self.labelNightIcon.center = CGPoint(x: self.labelNightIcon.bounds.width/2 + UIScreen.mainScreen().bounds.size.width * 0.05, y: self.labelNightIcon.bounds.height/2 + UIScreen.mainScreen().bounds.size.height * 0.05)});
        
    }

}

