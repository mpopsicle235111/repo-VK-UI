//
//  MyGradientView.swift
//  Hometask 2
//
//  Created by Anton Lebedev on 13.11.2021.
//

//Это класс добавлен для того, чтобы делать кастомные градиентные фоны экранов.

import UIKit

class MyGradientView: UIView {

  //Эти переменные пропишутся в Storyboard и там можно будет контролами визуально делать заливку градиентной
    //Первая переменная - это самый светлый цвет спектра
    @IBInspectable var startColor: UIColor = .white {
        didSet {
            self.updateColors()
    //didSet - это наблюдатель свойств
    //Он вызывается тогда, когда меняется значение переменной
    //Как только цвет поменяется на что-то другое
    //(в данном случае видимо будет указан новый цвет),
    //то блок didSet будет вызван
        }
    }
    //Это конечный цвет градиента
    @IBInspectable var endColor: UIColor = .black {
        didSet {
            self.updateColors()
        }
    }
    //Это начало градиента
    @IBInspectable var startLocation: CGFloat = 0 {
        didSet {
            self.updateLocations()
        }
    }
    //Это конец градиента
    @IBInspectable var endLocation: CGFloat = 1 {
        didSet {
            self.updateLocations()
        }
    }
    //Это точка начала градиента
    @IBInspectable var startPoint: CGPoint = .zero {
        didSet {
            self.updateStartPoint()
        }
    }
    //Это точка конца градиента
    @IBInspectable var endPoint: CGPoint = CGPoint (x: 0, y: 1){
        didSet {
            self.updateEndPoint()
        }
    }
    
    
    //Это новый класс для слоя
    override static var layerClass: AnyClass {
        return CAGradientLayer.self
    }
 //Это вычисляемая переменная якобы для удобства работы со слоем
    //Поскольку тут используется Force Unwrap, этот кусок кода пока использовать не будем, может и без него будет работать
    //Нет, без него не работает, эта переменная во всех функциях ниже
    var gradientLayer: CAGradientLayer {
    return self.layer as! CAGradientLayer
    }
    
    //Эти методы будут обновлять параметры слоя с градиентом:

    func updateLocations() {
        self.gradientLayer.locations = [self.startLocation as NSNumber, self.endLocation as NSNumber]    }
    
    func updateColors() {
        self.gradientLayer.colors = [self.startColor.cgColor, self.endColor.cgColor]    }
    
    func updateStartPoint() {
        self.gradientLayer.startPoint = startPoint     }
    
    func updateEndPoint() {
        self.gradientLayer.endPoint = endPoint     }
    
    
    
    
    

    
}
