//
//  Group.swift
//  Hometask 2
//
//  Created by Anton Lebedev on 07.11.2021.
//

import UIKit

class Group: myTableViewControllerUserGroups {

    
//    var myGroups = [ "WeLoveMcDonalds", "WeLoveBritneySpears", "WeHateBritneySpears", "WeLoveCats", "WeLoveDogs", "WeHateCats", "WeHate Dogs", "WeLoveChristinaAguilera", "WeHate Christina Aguilera" ]
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//
//    }

        struct VKGroup {
            var name: String = "" //Для свойств можно задать
            var openAccess: Bool = true //значения по умолчанию
            var admin: String = ""
            var interests: String = "reading"
            var membersNumber: Int = 0
            var motto: String = "Move on, nothing to see here"
        }
    
        var macFans = VKGroup(name: "We Love McDonalds", openAccess: true, admin: "Oleg", interests: "work", membersNumber: 7, motto: "Do you want fries with that?" )
        var weLoveBritney = VKGroup(name: "We Love Britney Spears", openAccess: false, admin: "Oleg", interests: "Britney", membersNumber: 286, motto: "Oops, I did it again" )
        var weHateBritney = VKGroup(name: "We Hate Britney Spears", openAccess: false, admin: "Oleg", interests: "Britney", membersNumber: 9, motto: "Crazy" )
        var weLoveCats = VKGroup(name: "We Love Cats", openAccess: true, admin: "Oleg", interests: "cats", membersNumber: 3007, motto: "Meow" )
        var weLoveDogs = VKGroup(name: "We Love Dogs", openAccess: true, admin: "Katya", interests: "dogs", membersNumber: 1584, motto: "Bow-wow" )
        var weHateCats = VKGroup(name: "We Hate Cats", openAccess: true, admin: "Katya", interests: "cats", membersNumber: 4, motto: "Make Coats Of 'Em" )
        var weHateDogs = VKGroup(name: "We Hate Dogs", openAccess: false, admin: "Katya", interests: "dogs", membersNumber: 3, motto: "Come on doggie, there's a tasty sausage 4U" )
        var weLoveChristina = VKGroup(name: "We Love Christina Aguilera", openAccess: false, admin: "Oleg", interests: "Christina Aguilera", membersNumber: 10002, motto: "You have to rub me the right way" )
        var weHateChristina = VKGroup(name: "We Hate Christina Aguilera", openAccess: false, admin: "Oleg", interests: "Britney", membersNumber: 1984, motto: "We love Britney Spears" )

    //override func viewDidLoad() {
    //        myTableViewUserGroups.backgroundColor = .yellow
    //        myTableViewUserGroups.dataSource = self
    //        //DataSource - это объект, из которого таблица будет брать информацию
    //        //В данном случае источником информации будет сам класс ViewController
    //        myTableViewUserGroups.delegate = self
    //        super.viewDidLoad()}




//   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//        return myGroups.count
//    }

//  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        
//        let cell = myTableViewUserGroups.dequeueReusableCell(withIdentifier: "myTableViewCellUserGroups", for: indexPath)
//
//    //Подгрузим имя группы из базы и покажем его
//   
//     let groupName = myGroups[indexPath.row]
//     cell.textLabel?.text = groupName
//    
//     return cell
//        
//   }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
