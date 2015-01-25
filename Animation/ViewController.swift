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
    
    // Create and add the gesture
    let tapMorning = UITapGestureRecognizer();
    let tapAfter = UITapGestureRecognizer();
    let tapEve = UITapGestureRecognizer();
    let tapNight = UITapGestureRecognizer();
    
    let options = UIViewAnimationOptions.TransitionNone;
    
    var animatedMorning: Bool = false;
    var animatedAfternoon: Bool = false;
    var animatedEvening: Bool = false;
    var animatedNight: Bool = false;
    var animatedView: String = "morning";

    override func viewDidLoad() {
        super.viewDidLoad()
        morningSquare.backgroundColor = UIColor(red: 227/255, green: 187/255, blue: 136/255, alpha: 1)
        morningSquare.frame = CGRect(x: self.view.bounds.origin.x, y: self.view.bounds.origin.y + 20, width: self.view.bounds.width, height: self.view.bounds.height/6-20);
        
        afternoonSquare.backgroundColor = UIColor(red: 216/255, green: 152/255, blue: 100/255, alpha: 1);
        afternoonSquare.frame = CGRect(x: self.view.bounds.origin.x, y: self.view.bounds.origin.y + self.view.bounds.height/6*3, width: self.view.bounds.width, height: self.view.bounds.height/6);
        
        eveningSquare.backgroundColor = UIColor(red: 177/255, green: 105/255, blue: 90/255, alpha: 1);
        eveningSquare.frame = CGRect(x: self.view.bounds.origin.x, y: self.view.bounds.origin.y + self.view.bounds.height/6*4, width: self.view.bounds.width, height: self.view.bounds.height/6);
        self.view.addSubview(eveningSquare);
        
        nightSquare.backgroundColor = UIColor(red: 100/255, green: 71/255, blue: 73/255, alpha: 1);
        nightSquare.frame = CGRect(x: self.view.bounds.origin.x, y: self.view.bounds.origin.y + self.view.bounds.height/6*5, width: self.view.bounds.width, height: self.view.bounds.height/6);
        self.view.addSubview(nightSquare);
        
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

}

