//
//  myTableViewControllerOtherGroups.swift
//  Hometask 2
//
//  Created by Anton Lebedev on 06.11.2021.
//

import UIKit

class OtherGroupImage: UITableViewCell {
    override class var layerClass: AnyClass {
        return CAShapeLayer.self
    }
}


class myTableViewControllerOtherGroups: UITableViewController {

    @IBOutlet weak var myTableViewOtherGroups: UITableView!
    
    var arrayOfOtherGroupsAndPictures = [["Club1","C1-img"],["Club2","C2-img"], ["Club3","C3-img"], ["Club4","C4-img"], ["Club5","C5-img"], ["Club6","C6-img"], ["Club7","C7-img"], ["Club8","C8-img"], ["Club9","C9-img"]]

    override func viewDidLoad() {
        super.viewDidLoad()

        myTableViewOtherGroups.backgroundColor = .cyan
        
        myTableViewOtherGroups.dataSource = self
        //DataSource - это объект, из которого таблица будет брать информацию
        //В данном случае источником информации будет сам класс ViewController
        myTableViewOtherGroups.delegate = self
        //Delegate определяет, кто будет обрабатывать не информацию, а события
        //В данном случае на эту обработку мы поставили также ViewController
    }

    

}


extension myTableViewControllerOtherGroups {
    //    func numberOfSections(in tableView: UITableView) -> Int {
    //        return 0
    //    }  -  если вписать такой метод, таблица будет пустая (отбразится ноль секций)
    
    //А мы закажем одну секцию
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    
    
    
    //Эти два метода для реализации обязательны, иначе ничего работать не будет
    //Остальные методы ViewdataSource являются опциональными
    
    //Первый метод задает количество рядов в таблице
    //Когда таблица уже загрузится и соберётся отобразиться, она спросит у этого метода, сколько показывать строк
 override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return arrayOfOtherGroupsAndPictures.count
    }
    
    
    //Второй метод просит вернуть сам ряд(ячейку)
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //А образ того, как будет выглядеть ячейка, надо взять из контроллера с идентификатором
        //myFirstTableViewCell
       
        let cell = myTableViewOtherGroups.dequeueReusableCell(withIdentifier: "myTableViewCellOtherGroups", for: indexPath)
        
        //Возьмем и покажем номера ячеек
    cell.textLabel?.text = indexPath.row.description
        let otherGroupName = arrayOfOtherGroupsAndPictures[indexPath.row][0]
    cell.textLabel?.text = otherGroupName
        let otherGroupImg = arrayOfOtherGroupsAndPictures[indexPath.row][1]
    cell.imageView?.image = UIImage(named: otherGroupImg)
    cell.imageView?.layer.cornerRadius = 45
    cell.imageView?.clipsToBounds = true
        
    cell.layer.cornerRadius = 16
    cell.contentMode = .scaleToFill
    return cell

        
    }
    

    //высоту секции можно задать также напрямую из кода, а не из Storyboard
    //    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //        return 400
    //    }
}




extension myTableViewControllerOtherGroups {
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
}
