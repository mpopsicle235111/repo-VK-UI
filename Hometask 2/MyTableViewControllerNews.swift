//
//  MyTableViewControllerNews.swift
//  Hometask 2
//
//  Created by Anton Lebedev on 19.11.2021.
//

import UIKit

class MyTableViewControllerNews: UIViewController {

    

    @IBOutlet weak var newsTableView: UITableView!
    
  
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            config()
            
            //The below line adds custom transition
            //in NavigationController, via
            //TransitionAnimator and TransitionCoordinator
            navigationController?.addCustomTransitioning()
            
        }
        
        private func config() {
           //newsTableView.delegate = self
            newsTableView.dataSource = self
            
            
            
            
            //Даем указание таблице зарегистрировать нашу кастомную ячейку
            newsTableView.register(UINib(nibName: "NewsCustomTableViewCell", bundle: nil), forCellReuseIdentifier: "newsCell")
            //UINib - это класс, который репрезентирует наш кастомный дизайн
            //Этот класс возьмет файл из проекта, всё подгрузит и запишет
            //и уже из файла  UINib таблица узнает, как должна выглядеть
            //ячейка по такому имени customCell
            
            
            
           
        }

}



    extension MyTableViewControllerNews: UITableViewDataSource {
        
        //This code refers to the custom footer (our table will be of two sections)
        func numberOfSections(in tableView: UITableView) -> Int {
            return 2 //However this is the usual footer, not the custom one
        }
        
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 5
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            //Вариант 2: просто отобразить саму ячейку
            //let customCell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath)
            
            //Вариант 3 - отобразить с номером, чтобы виден был реюз
            guard let customCell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as? NewsCustomTableViewCell else {
                return UITableViewCell() }
           // customCell.infoLabel.text = indexPath.row.description
            
            //Ниже строки для борьбы с реюзом
           // customCell.turnOffSwitch.isOn = array[indexPath.row] == 1
            //Если элемент с указанным индексом равен 1, то возвращается true
            //в противном случае - false. True это записывается в IsOn
            //То есть мы для массива сделали "перфокарту", которую можем хранить
            //и в соответствии с которой выводить массив таблицы
            //вот она наша перфокарта наверху в разделе переменных:
            //var array = [1,0,1,0,0,1]
            //В таком порядке свитчи и отображены на симуляторе.
            
            
            //   let cell = UITableViewCell(style: .value1, reuseIdentifier: "AD")
            //Параметры отображения ячейки пишем из кода
            //А ранее мы цепляли прототип ячейки по идентификатору через dequeue
            //   cell.backgroundColor = .green
            //   cell.textLabel?.text = "Some text from code"
            //   cell.detailTextLabel?.text = "Detail"
            
            //   return cell
            
            return customCell
        }
        
        //This code is for custom header/footer
        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            //   let header = UIView()
            //   header.backgroundColor = .blue
            //Instead of the above two lines, we now hook our CustomSectionHeader here:
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "Header")
            return headerView
            
            //  let button3 = UIButton(frame: CGRect(x: 0, y: 0, width: 90, height: 20))
            //   button3.setTitleColor(.orange, for: .normal)
            //  button3.setTitle("Footer 2", for: .normal)
            //  header.addSubview(button3)
            //  return header
        }
        
        // This is to add text on header
        //It actually duplicates the above button3.setTitleColor expression
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return "BREAKING VK MOBILE NEWS HEADER"
        }
        //This function configures header's height
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 35
        }
        
        //This function configures footer's height
        func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
            return 45
        }
        // This is to add text on footer
        func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
            return "BREAKING VK MOBILE NEWS FOOTER"
        }
        
    }
