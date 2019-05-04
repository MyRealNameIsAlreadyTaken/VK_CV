//
//  ProfileVC.swift
//  MyCV
//
//  Created by Me on 5/4/19.
//  Copyright © 2019 VitaliiKravets. All rights reserved.
//

import UIKit

final class ProfileVC: UIViewController {

	private let profileHeaderView = ProfileHeaderView.fromNib()
	private let cvTableView = CVTableView.fromNib()
	
	private let applicantAPI = ApplicantAPI(networkService: NetworkManager(urlSession: URLSession(configuration: .ephemeral)))
	private let imageDownsampler = ImageDownsampler()
	
	
	private var dataProviderService: DataProviderService?
	private var imageLoadService: ImageLoadService?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.initialConfiguration()
		self.dataProviderService?.fetchData { result in
			var applicant: Applicant? = result.decoded()
			applicant?.imageLoadService = self.imageLoadService
			
			self.profileHeaderView?.model = applicant
			self.cvTableView?.model = applicant
		}
	}
	
	private func initialConfiguration() {
		self.configureSubviews()
		self.configureDataProviders()
	}
	
	private func configureSubviews() {
		
		[self.profileHeaderView, self.cvTableView].forEach {
			$0 >>= self.view.addSubview
		}
		
		self.profileHeaderView?.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 25).isActive = true
		self.profileHeaderView?.constraint(top: false, bottom: false, to: self.view, constant: 8)
		
		guard let bottomAnchor = self.profileHeaderView?.bottomAnchor else { return }
		self.cvTableView?.topAnchor.constraint(equalTo: bottomAnchor).isActive = true
		self.cvTableView?.constraint(top: false, to: self.view, constant: 16)
	}
	
	private func configureDataProviders() {
		
		self.dataProviderService = NetworkDataProvider(with: self.applicantAPI)
		self.imageLoadService = ImageDownloader(imageDownsampleService: imageDownsampler)
	}
}

