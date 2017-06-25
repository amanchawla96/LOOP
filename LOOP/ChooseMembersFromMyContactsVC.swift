//
//  ChooseMembersVC.swift
//  LOOP
//
//  Created by Aman Chawla on 09/06/17.
//  Copyright © 2017 SoftkiwiTech. All rights reserved.
//

import UIKit
import Alamofire

class ChooseMembersFromMyContactsVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

	@IBOutlet weak var tableView: UITableView!
	
	var myContacts = [[String: Any]]()
	var selectedMembers = [String: String]()
	var projectName: String!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		tableView.delegate = self
		tableView.dataSource = self
		
		dowloadMyContacts()
    }
	
	func dowloadMyContacts() {
		Alamofire.request("\(baseURL)frnd_req.php?my_email=rishabh9393@gmail.com", method: .get).responseJSON { response in
			
			if let dict = response.result.value as? [[String:Any]]{
				self.myContacts=dict
				self.tableView.reloadData()
			}
		}
	}
	
	@IBAction func doneBtnPressed(_ sender: Any) {
		performSegue(withIdentifier: "backToAddMeetingVC", sender: self)
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "backToAddMeetingVC" {
			let destination = segue.destination as! AddMeetingVC
			destination.selectedMembers = self.selectedMembers
		}
		
		if segue.identifier == "backToProjectVC" {
			let destination = segue.destination as! ProjectsVC
			destination.selectedMembers = self.selectedMembers
			
		}
	}
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return myContacts.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "ChooseMemberCell", for: indexPath) as? ChooseMemberCell
		
		let myContacts = self.myContacts[indexPath.row]
		cell?.updateUI(Contacts: myContacts)
		
		
		return cell!
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		let cell = tableView.cellForRow(at: indexPath) as! ChooseMemberCell
		
		if cell.isSelected {
			let cat = cell.catagoryLbl.text
			let email = cell.personEmailLbl.text
			selectedMembers.updateValue(cat!, forKey: email!)
		}
		
	}
	
}
