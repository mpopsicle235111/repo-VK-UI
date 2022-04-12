//
//  User.swift
//  Hometask 2
//
//  Created by Anton Lebedev on 07.11.2021.
//

import UIKit
import CoreGraphics


class User: myTableViewController {
    
  
    //This is legacy array
    // var myFriends = ["Oleg", "Katya", "Petya", "Roxy", "Catherine", "Nick", "Gus", "Johnny", "Beth"]
    
    //Для задания пар имени и картинки используем
    //многомерный массив из книжки Василия Усова
    //В каждой парочке - нулевой и первый элемент
    //Нулевой элемент - имя друга, первый - название его картинки
    //Good for display, not good for sorting, replaced
//    var arrayOfFriendsAndPictures = [["Oleg","Oleg-img"], ["Katya","Katya-img"], ["Petya","Petya-img"], ["Roxy","Roxy-img"],["Catherine","Catherine-img"], ["Nick","Nick-img"], ["Gus","Gus-img"], ["Johnny","Johnny-img"], ["Beth","Beth-img"]]

    
    //This the latest storage vault, as dictionary:
    var arrayOfFriendsAndPictures : [String: Any] = [
        "Lara" : "Lara-img",
        "Roxy" : "Roxy-img",
        "Catherine" : "Catherine-img",
        "Nick" : "Nick-img",
        "Gus" : "Gus-img",
        "Johnny" : "Johnny-img",
        "Kid" : "Kid-img",
        "Kevin" : "Kevin-img",
        "Pamela" : "Pamela-img",
        "Candy" : "Candy-img",
        "Tea" : "Tea-img",
        "Vasya" : "Vasya-img",
        "Charlize" : "Charlize-img",
        "Jack" : "Jack-img",
        "Motoko" : "Motoko-img",
        "Amy" : "Amy-img",
        "Cameron" : "Cameron-img",
        "Summer" : "Summer-img",
        "William" : "William-img",
        "Olga" : "Olga-img",
        "Britney" : "Britney-img",
        "A" : "",
        "B" : "",
        "C" : "",
        "D" : "",
        "E" : "",
        "F" : "",
        "G" : "",
        "H" : "",
        "I" : "",
        "J" : "",
        "K" : "",
        "L" : "",
        "M" : "",
        "N" : "",
        "O" : "",
        "P" : "",
        "Q" : "",
        "R" : "",
        "S" : "",
        "T" : "",
        "U" : "",
        "V" : "",
        "W" : "",
        "X" : "",
        "Y" : "",
        "Z" : "",
    ]
  

    
    
    struct VKUser {
        var name: String = "" //Для свойств можно задать
        var age: Int = 5 //значения по умолчанию
        var sex: String = "male"
        var interests: String = "reading"
        var favMusic: String = "pop"
        var motto: String = "Get Rich Or Die Trying"
       
        }

    var Oleg = VKUser(name: "Oleg", age: 16, sex: "male", interests: "skiing", favMusic: "rap", motto: "Don't mess with Shady" )
    var Katya = VKUser(name: "Katya", age: 18, sex: "female", interests: "painting", favMusic: "pop", motto: "Hit me baby one more time" )
    var Petya = VKUser(name: "Petya", age: 15, sex: "male", interests: "boating", favMusic: "classic", motto: "get off my Bach" )
    var Roxy = VKUser(name: "Roxy", age: 25, sex: "female", interests: "new friends", favMusic: "rock", motto: "I love Catherine" )
    var Catherine = VKUser(name: "Catherine", age: 35, sex: "female", interests: "writing", favMusic: "rock", motto: "Keep an icepick under the bed" )
    var Nick = VKUser(name: "Nick", age: 50, sex: "male", interests: "shooting", favMusic: "country", motto: "Shoot first, ask later" )
    var Gus = VKUser(name: "Gus", age: 55, sex: "male", interests: "beer", favMusic: "country", motto: "Use lift, not stairs" )
    var Johnny = VKUser(name: "Johnny", age: 45, sex: "male", interests: "making music", favMusic: "rock", motto: "Jump in my car, don't be afraid" )
    var Beth = VKUser(name: "Beth", age: 41, sex: "female", interests: "psychology", favMusic: "romantic", motto: "Tell me everything" )

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

  

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfFriendsAndPictures.count
    }
    
   
    //This function will set the number of rows in each alphabetical contact section
    func myTableView(in tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return arrayOfFriendsAndPictures.count
        }
        return 2
      }
    
    //Второй метод просит вернуть сам ряд(ячейку)
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //А образ того, как будет выглядеть ячейка, надо взять из контроллера с идентификатором
        //myFirstTableViewCell
        
        
   
            let cell = myTableView.dequeueReusableCell(withIdentifier: "myFirstTableViewCell", for: indexPath)
        //Возьмем и покажем номера ячеек
        //cell.textLabel?.text = indexPath.row.description
        //Подгрузим имя друга из базы и покажем его
        //let friend = myFriends[indexPath.row]
        
        
        //Let us sort our array of friends and pictures alphabetically
        let sortedArrayOfFriendsAndPictures = arrayOfFriendsAndPictures.sorted(by: { $0.0 < $1.0 })
        
        //Then let's split the joint array in two arrays: that of names and that of pictures
        let arrayOfNames = sortedArrayOfFriendsAndPictures.map { return $0.key }
        let arrayOfImages = sortedArrayOfFriendsAndPictures.map { return $0.value }
        
        //Now let's assign values to table cells and display everything
        let friend = arrayOfNames[indexPath.row]
        cell.textLabel?.text = friend
        let friendImg = arrayOfImages[indexPath.row]
        cell.imageView?.image = UIImage(named: friendImg as! String)
        //Let's make images circular
        cell.imageView?.layer.cornerRadius = 40
        cell.imageView?.clipsToBounds = true
        //Let's make cell border circular
        //cell.layer.cornerRadius = 16
        cell.contentMode = .scaleToFill
        return cell
        
}
}
