//
//  LoginFormController.swift
//  Hometask 2
//
//  Created by Anton Lebedev on 31.10.2021.


import UIKit

class LoginFormController: UIViewController {

    @IBOutlet var loginInput: UITextField!
    @IBOutlet var passwordInput: UITextField!
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet weak var enterButton: UIButton!
    
    let snakeCircleView = SnakeCircleView()//Loading animation variable
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //Добавим жест нажатия к UISCrollView
            //Жест нажатия
            let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
         //Присваиваем его UIScrollView
           scrollView?.addGestureRecognizer(hideKeyboardGesture)
       
        //The below line adds custom transition
        //in NavigationController, via
        //TransitionAnimator and TransitionCoordinator
        navigationController?.addCustomTransitioning()
    }
    
//   //This func animates transition to Navigation Controller
    //Does not work
//    func animateTransition () {
//
//    let transition = CATransition()
//        transition.duration = 10.0;
//        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
//        transition.type = CATransitionType.moveIn
//        //kCATransitionMoveIn
//        //kCATransitionPush
//        //kCATransitionReveal
//        //transition.subtype = kCATransitionFromTop
//        //transition.subtype = kCATransitionFromLeft
//        //transition.subtype = kCATransitionFromRight
//        //transition.subtype = kCATransitionFromBottom
//    self.navigationController?.view.layer.add(transition, forKey : nil)
//    _ = self.navigationController?.popToRootViewController(animated: false)
//
//
//    }
        
    //This function animates transition between screens
//    func navigationController (_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, fromVC fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning {
//        if operation == .push {
//            return PushAnimator()
//        } else if operation == .pop {
//            return PopAnimator()
//        }
//        return
//
//    }
    
  
        
    

          //Эта функция подписывается на сообщения из центра уведомлений, которые рассылает клавиатура:
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        //Start animated circles
        configureSnakeCircleView()
        snakeCircleView.animate()
        
        
        //Подписываемся на два уведомления: первое приходит при появлении клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        //Второе - когда она пропадет
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    //В методичке написано, что от уведомлений надо отписываться, когда они не нужны.
    //Этот метод отписывается от уведомлений при исчезновении контроллера с экрана
    override func viewWillDisappear (_ animated: Bool) {
        super.viewWillDisappear(animated)

        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)

    }
    
    
    //Имеется стандартный метод shouldPerformSegue, который возвращает true или false
    //Если метод возвращает true, переход совершается, если  false - то нет
    //В наших целях (проверки пароля перед переходрм далее)
    //это метод переопределяется так, чтобы проверять пароль
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let login = loginInput.text!
        let password = passwordInput.text!
        
        if login == "Admin" && password == "1234" {
        return true
        } else {
            //UIAlertController - это класс, который показывает пользователю всякие сообщения
            //Создадим такой контроллер, чтобы если пользователь введет
            //неправильный пароль, то ему будет об этом сообщение,
            //в противном случае пользователь может решить,
            //что программа неисправна или зависла, а нам надо
            //думать об удовлетворенности пользователя
            let alert = UIAlertController(title: "ERROR", message: "Wrong login or password", preferredStyle: .alert)
            //создадим спецкнопку для UIAlertcontroller
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            //и добавим эту кнопку на UIAlertcontroller
            alert.addAction(action)
            //Покажем UIAlertController
            present(alert, animated: true, completion: nil)
    
        return false}
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        
        //Класс UIButton сам затеняет кнопку
       // Дополнительно менять цвет при нажатии не нужно
       enterButton.setImage(UIImage(named:"Enter2-img"), for: .normal)
        
        //Получаем текст логина
        let login = loginInput.text!
        //Получаем строку пароля
        let password = passwordInput.text!
        //Сверяем с сохранёнными логином и паролем
        print("Логин \(login)")
        print("Пароль \(password)")
        if login == "Admin" && password == "1234" {
            print("ACCESS GRANTED")
        } else {
            print("ACCESS DENIED!")
            enterButton.setImage(UIImage(named:"Button3-img"), for: .normal)
        }
    }
    
    //Когда клавиатура появляется
     @objc func keyboardWasShown(notification: Notification) {
         
         //Получаем размер клавиатуры
         let info = notification.userInfo! as NSDictionary
         let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        print(kbSize.height)
         
         //Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
         self.scrollView?.contentInset = contentInsets
         scrollView?.scrollIndicatorInsets = contentInsets
     }
    
    
     //Когда клавиатура исчезает
     @objc func keyboardWillBeHidden (notification: Notification) {
         //Устанавливаем отступ внизу UIScrollView, равный 0
         let contentInsets = UIEdgeInsets.zero
         scrollView?.contentInset = contentInsets
     }
    
    //Эта функция убирает клавиатуру с экрана при клике по пустому месту на экране
    @objc func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }
    
//Animated transition of circles
    private func configureSnakeCircleView() {
                view.addSubview(snakeCircleView)
    NSLayoutConstraint.activate([
                    snakeCircleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    
    //Vertical position of the running circles
    snakeCircleView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 90),
                    
                    
    snakeCircleView.heightAnchor.constraint(equalToConstant : 40),
                    snakeCircleView.widthAnchor.constraint(equalToConstant : 150)
                ])
            }
}
