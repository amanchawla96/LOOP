//
//  ChooseTeamMemeberVC.swift
//  LOOP
//
//  Created by Aman Chawla on 14/06/17.
//  Copyright © 2017 SoftkiwiTech. All rights reserved.
//

import UIKit

class ChooseTeamMemberVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	@IBOutlet weak var tableView: UITableView!
	
	var teamMembers = [String: String]()
	var selectedMembers = [String: String]()
	
	struct objects {
		var userEmail: String!
		var userName: String!
	}
	
	var objArray = [objects]()
	
    override func viewDidLoad() {
        super.viewDidLoad()

		for (key, value) in teamMembers {
			objArray.append(objects(userEmail: key, userName: value))
		}
    }
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return teamMembers.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "ChooseTeamMemberCell", for: indexPath) as? ChooseTeamMemberCell
		let objArray = self.objArray[indexPath.row]
		cell?.updateUI(objArray: objArray)
		return cell!
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let cell = tableView.cellForRow(at: indexPath) as! ChooseTeamMemberCell
		
		if cell.isSelected {
			let cat = cell.catagoryLbl.text
			let email = cell.personEmailLbl.text
			selectedMembers.updateValue(cat!, forKey: email!)
		}
		
		selectedMembers.updateValue(cell.catagoryLbl.text!, forKey: cell.personEmailLbl.text!)
	}

}
