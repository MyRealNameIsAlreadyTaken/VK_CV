//
//  CVTableView.swift
//  MyCV
//
//  Created by Me on 5/4/19.
//  Copyright © 2019 VitaliiKravets. All rights reserved.
//

import UIKit

class CVTableView: UIView, NibLoading {
	
	@IBOutlet var tableView: UITableView?
	@IBOutlet var educationCell: CVTableViewCell?
	@IBOutlet var languagesCell: CVTableViewCell?
	@IBOutlet var technologiesCell: CVTableViewCell?
	@IBOutlet var workSamplesCell: CVTableViewCell?
	@IBOutlet var aboutMeCell: CVTableViewCell?
	@IBOutlet var aboutAppCell: CVTableViewCell?
	
	private var cells: [CVTableViewCell?] = []
	
	var model: Applicant? {
		didSet {
			self.fill(with: model)
			DispatchQueue.main.async {
				self.tableView?.reloadData()
			}
		}
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
		super.translatesAutoresizingMaskIntoConstraints = false
		self.tableView?.dataSource = self
		self.tableView?.delegate = self
		
		self.cells = [self.educationCell, self.languagesCell, self.technologiesCell, self.workSamplesCell, self.aboutMeCell, self.aboutAppCell]
	}
	
	private func fill(with model: Applicant?) {
		self.cells.forEach {
			$0?.model = model
		}
	}
}

extension CVTableView: UITableViewDataSource {
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 6
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let section = indexPath.section
		let cell = self.cells[section]
		
		let headerFont = UIFont(name: "GillSans-Bold", size: 17)
		let headerFontMetrics = UIFontMetrics(forTextStyle: .title2)
		let bodyFont = UIFont(name: "GillSans", size: 17)
		let bodyFontMetrics = UIFontMetrics(forTextStyle: .body)
		
		headerFont.map { cell?.headerLabel?.font = headerFontMetrics.scaledFont(for: $0) }
		bodyFont.map { cell?.bodyLabel?.font = bodyFontMetrics.scaledFont(for: $0) }
		bodyFont.map { cell?.workSamplesTextView?.font = bodyFontMetrics.scaledFont(for: $0) }
		
		return cell ?? UITableViewCell()
	}
}

extension CVTableView: UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 8
	}
	
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let headerView = UIView()
		headerView.backgroundColor = .clear
		
		return headerView
	}
}
