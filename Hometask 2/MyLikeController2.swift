//
//  MyLikeController2.swift
//  Hometask 2
//
//  Created by Anton Lebedev on 12.11.2021.
//

import UIKit

class PhotoCell: UITableViewCell {
    
    @IBOutlet weak var likeButton: UIButton!
  
    @IBOutlet weak var textField: UITextView!
    
    var counter : Int = 0
    
    @IBAction func clickLikeButton(_ sender: Any) {
        
        //Если тэг 0, картинка серая
        if likeButton.tag == 0
        { likeButton.setImage(UIImage(named:"GHeart-img"), for: .normal)
            likeButton.tag = 1
            counter = 1
            print(counter)
            
        } else {
            likeButton.setImage(UIImage(named:"Heart-img"), for: .normal)
            likeButton.tag = 0}
            counter = 0
        print(counter)
        
}
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //А образ того, как будет выглядеть ячейка, надо взять из контроллера с идентификатором
        //myFirstTableViewCell
        
        
   
            let cell = tableView.dequeueReusableCell(withIdentifier: "photoCell", for: indexPath)
       
        //Эта строка для показа номеров ячеек
        //cell.textLabel?.text = indexPath.row.description
        
        //Эта строка для показа имени друга из базы
        //let friend = arrayOfFriendsAndPictures[indexPath.row][0]
        //cell.textLabel?.text = friend
        
        //Эта строка для показа счетчика лайков
        let counterText = String(counter)
        cell.textLabel?.text = counterText
      
        
       
        
        
        
        
////      //Сделаем картинки круглыми
////        cell.PhotoFriends.layer.cornerRadius = 75/2
//  //      cell.PhotoFriends.contentMode = .scaleToFill
//        //let friendImage = UITableViewCell(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
//        cell.layer.cornerRadius = 16
//        cell.contentMode = .scaleToFill
        return cell
        
}
}
class MyLikeController2: UITableViewController {

    @IBOutlet weak var likeLabel: UILabel!
//    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var likeTableView: UITableView!
    var counter : Int = 0

    
    
    var arrayOfFriendsAndPictures = [["Oleg","Oleg-img"], ["Katya","Katya-img"], ["Petya","Petya-img"], ["Roxy","Roxy-img"],["Catherine","Catherine-img"], ["Nick","Nick-img"], ["Gus","Gus-img"], ["Johnny","Johnny-img"], ["Beth","Beth-img"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        likeTableView.backgroundColor = .lightGray
            
        likeTableView.dataSource = self
            //DataSource - это объект, из которого таблица будет брать информацию
            //В данном случае источником информации будет сам класс ViewController
        likeTableView.delegate = self
            //Delegate определяет, кто будет обрабатывать не информацию, а события
            //В данном случае на эту обработку мы поставили также ViewController
        
        //The below line adds custom transition
        //in NavigationController, via
        //TransitionAnimator and TransitionCoordinator
        navigationController?.addCustomTransitioning()
      
    }

   
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfFriendsAndPictures.count
    }
    
   
    
    
    //Второй метод просит вернуть сам ряд(ячейку)
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //А образ того, как будет выглядеть ячейка, надо взять из контроллера с идентификатором
        //myFirstTableViewCell
        
        
   
            let cell = likeTableView.dequeueReusableCell(withIdentifier: "photoCell", for: indexPath)
       
        //Эта строка для показа номеров ячеек
        //cell.textLabel?.text = indexPath.row.description
        
        //Эта строка для показа имени друга из базы
        //let friend = arrayOfFriendsAndPictures[indexPath.row][0]
        //cell.textLabel?.text = friend
        
        //Эта строка для показа счетчика лайков
        cell.textLabel?.text = String(counter)
        
        //Картинку друга показываем
        let friendImg = arrayOfFriendsAndPictures[indexPath.row][1]
        cell.imageView?.image = UIImage(named: friendImg)
        
        
        
        
        
////      //Сделаем картинки круглыми
////        cell.PhotoFriends.layer.cornerRadius = 75/2
//  //      cell.PhotoFriends.contentMode = .scaleToFill
//        //let friendImage = UITableViewCell(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
//        cell.layer.cornerRadius = 16
//        cell.contentMode = .scaleToFill
        view.setNeedsDisplay()
        return cell
        
}
    
}
