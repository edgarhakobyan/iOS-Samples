//
//  DataProvider.swift
//  ToDoApp
//
//  Created by Edgar on 11.02.21.
//

import UIKit

class DataProvider: NSObject {
    var taskManager: TaskManager?
}

extension DataProvider: UITableViewDelegate {
    
}

extension DataProvider: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = Section(rawValue: section) else { fatalError() }
        guard let taskManager = taskManager else { return 0 }
        
        switch section {
        case .todo:
            return taskManager.tasksCount
        case .done:
            return taskManager.doneTasksCount
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return TaskCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
}

enum Section: Int {
    case todo
    case done
}
