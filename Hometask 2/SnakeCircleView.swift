//
//  SnakeCircleView.swift
//  Hometask 2
//
//  Created by Anton Lebedev on 22.11.2021.
// based on: Custom Activity Indicator by Ryan Schefske
//https://youtu.be/NK9mieRAxWI

import UIKit

class SnakeCircleView: UIView {
    
    let circle1 = UIView()
    let circle2 = UIView()
    let circle3 = UIView()
    //We also need and array to iterate our circles
    var circleArray: [UIView] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        //Now we fill our circleArray with our 3 circles
        circleArray = [circle1, circle2, circle3]
        //Now we create our circles from left to right
        for circle in circleArray {
            circle.frame = CGRect(x: -20, y: 5, width: 20, height: 20)
            //In order to make circles out of squares, we set cornerRadius = 1/2 of circle's height, to 15
            circle.layer.cornerRadius = 10
            circle.backgroundColor = .systemTeal
            circle.alpha = 0
            
            addSubview(circle)
        }
    }
    //This is the animation function
    func animate() {
        //Every circle is drawn with a delay,so they do not overlap
        var delay: Double = 0
        for circle in circleArray {
            animateCircle(circle, delay: delay)
            delay += 0.95
        }
    }
    
    func animateCircle(_ circle: UIView, delay: Double){
        UIView.animate(
            withDuration: 0.8,
            delay: delay,
            options: .curveLinear,
            animations: {
                circle.alpha = 1 //Fade in
                circle.frame = CGRect(x: 35, y: 5, width: 20, height: 20)
            }) { (completed) in //Move across the screen
            UIView.animate(
                withDuration: 1.3,
                delay: 0,
                options: .curveLinear,
                animations: {
                    circle.frame = CGRect(x: 85, y: 5, width: 20, height: 20)
                }) { (completed) in //Fade out
                UIView.animate(
                    withDuration: 0.8,
                    delay: 0,
                    options: .curveLinear,
                    animations: {
                        circle.alpha = 0
                        circle.frame = CGRect(x: 140, y: 5, width: 20, height: 20)
                    }) { (completed) in //Reset to original values
                    circle.frame = CGRect(x: -20, y: 5, width: 20, height: 20)
                    self.animateCircle(circle, delay: 0)
                }
                }
            }
    }
    
    
}
