//
//  myTableViewController.swift
//  Hometask 2
//
//  Created by Anton Lebedev on 05.11.2021.
//

import UIKit
import CoreGraphics
 

        

class myTableViewController: UITableViewController {

    
    @IBOutlet weak var myTableView: UITableView!
   
   
    
    //var myFriends = ["Oleg", "Katya", "Petya", "Roxy", "Catherine", "Nick", "Gus", "Johnny", "Beth"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.backgroundColor = .lightGray
            
            myTableView.dataSource = self
            //DataSource - это объект, из которого таблица будет брать информацию
            //В данном случае источником информации будет сам класс ViewController
            myTableView.delegate = self
            //Delegate определяет, кто будет обрабатывать не информацию, а события
            //В данном случае на эту обработку мы поставили также ViewController
        
    }
}



    extension myTableViewController {
        //Эти два метода для реализации обязательны, иначе ничего работать не будет
        //Остальные методы ViewdataSource являются опциональными
        
        //Первый метод задает количество рядов в таблице
        //Когда таблица уже загрузится и соберётся отобразиться, она спросит у этого метода, сколько показывать строк
//        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//            return myFriends.count
//        }
//        
//        
//        //Второй метод просит вернуть сам ряд(ячейку)
//        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//            //А образ того, как будет выглядеть ячейка, надо взять из контроллера с идентификатором
//            //myFirstTableViewCell
//            
//            
//            //Когда дойдем до ячейки с индексом 5, вывести просто обычную пуcтую ячейку и выйти из функции
//            //        if indexPath.row == 5 {
//            //            return UITableViewCell()
//            //        }
//            
//            //Для первой секции будем выводить ячейки образца myFirstTableViewCell,
//            //Для второй секции - mySecondTableViewCell
//            
//           // if indexPath.section == 0 {
//                let cell = myTableView.dequeueReusableCell(withIdentifier: "myFirstTableViewCell", for: indexPath)
//            //Возьмем и покажем номера ячеек
//            //cell.textLabel?.text = indexPath.row.description
//            //Подгрузим имя друга из базы и покажем его
//           
//             let friend = myFriends[indexPath.row]
//            cell.textLabel?.text = friend
//            
//            return cell
//            
            
            
            
            
            
            
            
     //       }
//            else if indexPath.section == 1 {
//
//                let cell = myTableView.dequeueReusableCell(withIdentifier: "mySecondTableViewCell", for: indexPath)
//                return cell        }
//            else {
//                //А это наша кастомная третья секция
//                let cell = myTableView.dequeueReusableCell(withIdentifier: "myThirdTableViewCells", for: indexPath)
//
//                return cell
//            }
//        }
        //indexPath - это не просто число, это целый тип, который содержит номер секции и номер ячейки
        //и еще много всякой всячины, типа кортежа
        //у первой ячейки номер будет ноль
        //indexPath = 0; 5
        //Подсчет по секциям ведется с нуля в каждой секции
       
        }
        
        //    func numberOfSections(in tableView: UITableView) -> Int {
        //        return 0
        //    }  -  если вписать такой метод, таблица будет пустая (отбразится ноль секций)
        
        //А мы закажем одну секцию
        func numberOfSections(in tableView: UITableView) -> Int {
            return 2
        }

        
        
        //высоту секции можно задать также напрямую из кода, а не из Storyboard
        //    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //        return 400
        //    }
    




    extension myTableViewController {
        //У UITableViewDelegate все методы являются опциональными
        //Например, этот метод добавлен для разнообразия
        //и выводит в консоль адрес ячейки при нажатии на нее
        // вида [1,0], где 1 - номер секции, 0 - номер ячейки
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print(indexPath)
        }
        
        //Этот метод служит для того, чтобы удалять ячейки
        //Правда надо логику удаления ещё прописать, а так он пока только красный значок покажет
        override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
            true
        }
        
        //This method adds headers to addressbook letter sections
//        override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//            let label = UILabel()
//            label.text = "Header"
//            label.backgroundColor = UIColor.clear
//            return label
       // }
 
     
    }

