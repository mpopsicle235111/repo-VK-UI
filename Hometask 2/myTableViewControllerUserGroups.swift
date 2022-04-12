//
//  myTableViewControllerUserGroups.swift
//  Hometask 2
//
//  myTableViewController.swift
//  Hometask 2
//
//  Created by Anton Lebedev on 05.11.2021.
//

import UIKit


class UserGroupImage: UITableViewCell {
    
    
    @IBOutlet weak var userGroupImage: UIImageView!
    
    override class var layerClass: AnyClass {
        return CAShapeLayer.self
    }
}


class myTableViewControllerUserGroups: UITableViewController {
    
    
    @IBOutlet weak var searchContainerView: UIView!
    @IBOutlet weak var myTableViewUserGroups: UITableView!

    //These 3 vars are introduced to enable our search controller
    var searchController: UISearchController!
    var originalDataSource: [String] = ["We Love McDonalds", "We Love Britney", "We Hate Britney", "We Love Cats", "We Love Dogs", "We Hate Cats", "We Hate Dogs", "We Love Christina", "We Hate Christina"]
    var currentDataSource: [String] = []
 
    //Nice to work, bur hard to search
    var arrayOfMyGroupsAndPictures = [["We Love McDonalds","WLMcdonalds-img"], ["We Love Britney","WLBritney-img"], ["We Hate Britney","WHBritney-img"], ["We Love Cats", "WLCats-img"], ["We Love Dogs","WLDogs-img"], ["We Hate Cats","WHCats-img"], ["We Hate Dogs","WHDogs-img"], ["We Love Christina","WLChristina-img"], ["We Hate Christina", "WHChristina-img"]]

    
    //This the latest storage vault, as dictionary:
//    var arrayOfMyGroupsAndPictures : [String: Any] = [
//        "We Love McDonalds" : "WLMcdonalds-img",
//        "We Love Britney" : "WLBritney-img",
//        "We Hate Britney" : "WHBritney-img",
//        "We Love Cats" : "WLCats-img",
//        "We Love Dogs" : "WLDogs-img",
//        "We Hate Cats" : "WHCats-img",
//        "We Hate Dogs" : "WHDogs-img",
//        "We Love Christina" : "WLChristina-img",
//        ]
    
  

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableViewUserGroups.backgroundColor = .lightGray
        
        myTableViewUserGroups.dataSource = self
        //DataSource - это объект, из которого таблица будет брать информацию
        //В данном случае источником информации будет сам класс ViewController
        myTableViewUserGroups.delegate = self
        //Delegate определяет, кто будет обрабатывать не информацию, а события
        //В данном случае на эту обработку мы поставили также ViewController
        
        //THESE BELOW LINES OPERATE THE SEARCH CONTROLLER
        
        //This is not necessary, because we have a custom array of group names and images already
        //addGroupToDataSource(groupCount: 25, groupName: "We hate everything")
        //addGroupToDataSource(groupCount: 25, groupName: "We love everything")
        
  
        currentDataSource = originalDataSource
        
        //We have to pass NIL below, because the Definition says "Pass nil if you wish to display search results in the same view that you are searching".
        //And that is the requirement of our Hometask
        //So our viewController both does the searching and gets back the results
        searchController = UISearchController(searchResultsController: nil)
        
        //This searchResults updater idea also comes from the Definition of the UISearchController
        //In order to make this line work, we add a special extension for the class
        //myTableViewControllerUserGroups below
        searchController.searchResultsUpdater = self
        
        //This one we can toggle for fun
       // searchController.obscuresBackgroundDuringPresentation = false
        searchContainerView.addSubview(searchController.searchBar)
        
        //This makes our SearchController a delegate to the searchBar event
        //It gives us more flexibility to process and cler the search
        //In order to make this work, we have to make another extension for
        //the class myTableViewControllerUserGroups below
        searchController.searchBar.delegate = self
        
        //The below line adds custom transition
        //in NavigationController, via
        //TransitionAnimator and TransitionCoordinator
        navigationController?.addCustomTransitioning()
    }


    //Эти два метода для реализации обязательны, иначе ничего работать не будет
    //Остальные методы ViewdataSource являются опциональными
    
    //Первый метод задает количество рядов в таблице
    //Когда таблица уже загрузится и соберётся отобразиться, она спросит у этого метода, сколько показывать строк
   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

       return arrayOfMyGroupsAndPictures.count
    
   }


    //Второй метод просит вернуть сам ряд(ячейку)
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

       let cell = myTableViewUserGroups.dequeueReusableCell(withIdentifier: "myTableViewCellUserGroups", for: indexPath)

   //Подгрузим имя группы из базы и покажем его

     let groupName = arrayOfMyGroupsAndPictures[indexPath.row][0]
     cell.textLabel?.text = groupName
     let myGroupImg = arrayOfMyGroupsAndPictures[indexPath.row][1]
     cell.imageView?.image = UIImage(named: myGroupImg)
     cell.imageView?.layer.cornerRadius = 45
     cell.imageView?.clipsToBounds = true
     cell.layer.cornerRadius = 16
     cell.contentMode = .scaleToFill
     return cell
     

    }
    
    //    func numberOfSections(in tableView: UITableView) -> Int {
    //        return 0
    //    }  -  если вписать такой метод, таблица будет пустая (отбразится ноль секций)
    
    //А мы закажем одну секцию
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //высоту секции можно задать также напрямую из кода, а не из Storyboard
      override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 100
       }
    
    //This method adds headers to group letter sections
//        override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//            let label = UILabel()
//            label.text = "Header"
//            label.backgroundColor = UIColor.clear
//            return label
//    }




    //У UITableViewDelegate все методы являются опциональными
    //Например, этот метод добавлен для разнообразия
    //и выводит в консоль адрес ячейки при нажатии на нее
    // вида [1,0], где 1 - номер секции, 0 - номер ячейки
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
        
        //This is the table cell image animation when pressed
        //We select the cell
        let cell = myTableViewUserGroups.dequeueReusableCell(withIdentifier: "myTableViewCellUserGroups", for: indexPath)
      //Inside the cell we select a View to animate - imageView
      //We have to keep group name because of the Reuse problem
      let groupName = arrayOfMyGroupsAndPictures[indexPath.row][0]
      cell.textLabel?.text = groupName
      let myGroupImg = arrayOfMyGroupsAndPictures[indexPath.row][1]
      cell.imageView?.image = UIImage(named: myGroupImg)
    //We have to force circular image because of the Reuse problem
        cell.imageView?.layer.cornerRadius = 45
        cell.imageView?.clipsToBounds = true
        //Here is the animation itself
        let animation = CASpringAnimation(keyPath: "transform.scale")
        animation.fromValue = 0
        animation.toValue = 1
        animation.stiffness = 1000
        animation.mass = 1
        animation.duration = 2
    //It is not necessary to delay the beginning of animation here
        //animation.beginTime = CACurrentMediaTime() + 1
        animation.fillMode = CAMediaTimingFillMode.backwards
        cell.imageView?.layer.add(animation, forKey: nil)
        
        //The below lines added in order to make SearchController Work
        //This is a selector, that crashes when we select freshly added other group
        //It is not much relevant so it can be omitted altogether
//        let alertController = UIAlertController(title: "Selection", message: "Selected: \(currentDataSource[indexPath.row])", preferredStyle: .alert)
//        
//                //This enables searchController to take control of the window
//                searchController.isActive = false
//        
//                let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
//                alertController.addAction(okAction)
//                present(alertController, animated: true, completion: nil)
    }
    
    
   //Это метод для удаления группы из списка групп пользователя
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        //Если была нажата кнопка "Удалить"
        if editingStyle == .delete {
        //То удаляем группу из массива
            arrayOfMyGroupsAndPictures.remove(at: indexPath.row)
        //И ещё сразу удаляем строку из таблицы
            tableView.deleteRows(at: [indexPath], with: .fade)
    }
    }
    //Этот запасной метод также служит для того, чтобы удалять ячейки
    //Но в нем не прописана логика удаления, а так он пока только красный значок покажет
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    
    //This function is for the SearchController to work
    //We shall loop through and check how many groups we want to add to our serach result
    func addGroupToDataSource(groupCount: Int, groupName : String) {
        
        for index in 1...groupCount {
            originalDataSource.append("\(groupName) #\(index)")
        }
    }
    
    
    
    //This is our Search Controller Button
    @IBAction func restoreData(_ sender: Any) {
        restoreCurrentDataSource()
    }
    
    //THIS IS THE BRAIN BEHIND THE SEARCH OPERATION
    func filterCurrentDataSource(searchTerm: String) {
        
        //First we check if the searchTerm is not the empty string
        if searchTerm.count > 0 {
            //then go ahead and do the filtering
            currentDataSource = originalDataSource
            
            //This line makes everything lowercased and takes the empty strings out for
            //making apples compare to apples and not them oranges
            let filteredResults = currentDataSource.filter { $0.replacingOccurrences(of: " ", with: "").lowercased().contains(searchTerm.replacingOccurrences(of: " ", with: "").lowercased()) }
            currentDataSource = filteredResults
            myTableViewUserGroups.reloadData()
        }
    }
    //This is another func to make the searchController work
    func restoreCurrentDataSource () {
        currentDataSource = originalDataSource
        myTableViewUserGroups.reloadData()
    }
    
    @IBAction func addGroup(segue: UIStoryboardSegue) {
    //Это сегвей с OtherGroups
        //Проверим его идентификатор, чтбы убедиться, что это нужный переход по нажатию группы из числа OtherGroups
        //(для этого этому сегвею ранее и присвоили идентификатор addGroup)
        if segue.identifier == "addGroup" {
            //Если так, то получаем ссылку на контроллер OtherGroups, с которого осуществлен переход
            let myTableViewControllerOtherGroups = segue.source as! myTableViewControllerOtherGroups
            //Потом получим инекс выделенной ячейки
            if let indexPath = myTableViewControllerOtherGroups.tableView.indexPathForSelectedRow {
                //Получаем группу по индексу
                let group = myTableViewControllerOtherGroups.arrayOfOtherGroupsAndPictures[indexPath.row]
                //Эта строка добавлена позже - она проверяет, нет ли такой группы уже в списке,
                //чтобы повторно её не добавить
                if !arrayOfMyGroupsAndPictures.contains(group) {
                //Добавляем группу в группу пользователя
                    arrayOfMyGroupsAndPictures.append(group)
                //Обновляем таблицу
                tableView.reloadData()
            }
        }
    }
    }
    
}

//This extension makes work the updater in our SearchController:
//as soon as we add this extension, the " searchController.searchResultsUpdater = self"
//error stops flashing red, kekeke
extension myTableViewControllerUserGroups : UISearchResultsUpdating {

    //This method is a requirement, and it gives us access to search bar and search text
    func updateSearchResults(for searchController: UISearchController) {
    
        if let searchText = searchController.searchBar.text {
            filterCurrentDataSource(searchTerm: searchText)
        }
    }
}

//This extension makes the SearchBar work
extension myTableViewControllerUserGroups : UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchController.isActive = false
        if let searchText = searchBar.text {
            filterCurrentDataSource(searchTerm: searchText)
        }
    }
    //Works around, if the Searchbar is tapped accidentally
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchController.isActive = false
        if let searchText = searchBar.text, !searchText.isEmpty {
            restoreCurrentDataSource()
        }
    }
}
//The entirety of this extension is included in the above code
//Source: https://youtu.be/hHsGgvIZWVM
//extension myTableViewControllerUserGroups : UITableViewDataSource, UITableViewDelegate {
//    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    
//        let alertController = UIAlertController(title: "Selection", message: "Selected: \(currentdataSource[indexPath.row])", preferredStyle: .alert)
//        
//        //This enables searchController to take control of the window
//        searchController.isActive = false
//        
//        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
//        alertController.addAction(okAction)
//        present(alertController, animated: true, completion: nil)
//        
//    }
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return currentDataSource.count
//    }
//    func tableview(_ tableView: UITableView, cellForRowAt indexPath : IndexPath) -> UITableViewCell {
//        let myTableViewCellUserGroups = tableView.dequeueReusableCell(withIdentifier: "myTableViewCellUserGroups", for: indexPath)
//        myTableViewCellUserGroups.textLabel?.text = currentDataSource[indexPath.row]
//        return myTableViewCellUserGroups
//    }
//}
