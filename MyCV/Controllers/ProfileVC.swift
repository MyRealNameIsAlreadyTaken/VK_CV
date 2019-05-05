//
//  ProfileVC.swift
//  MyCV
//
//  Created by Me on 5/4/19.
//  Copyright © 2019 VitaliiKravets. All rights reserved.
//

import UIKit

final class ProfileVC: UIViewController {

	private let profileHeaderView: ProfileHeaderView?
	private let cvTableView: CVTableView?
	
	private var dataProviderService: DataProviderService?
	private let applicantAPI: APIService
	private var imageLoadService: ImageLoadService?
	private let imageDownsampleService: ImageDownsampleService
	
	private let cacheService: CacheService
	
	required init?(coder aDecoder: NSCoder) {
		self.profileHeaderView = ProfileHeaderView.fromNib()
		self.cvTableView = CVTableView.fromNib()
		
		self.applicantAPI = ApplicantAPI(networkService: NetworkManager(urlSession: URLSession(configuration: .ephemeral)))
		self.imageDownsampleService = ImageDownsampler()
		
		self.cacheService = CacheManager()
		
		self.dataProviderService = self.cacheService.dataExists(for: ApplicantCacheKeys.applicant)
			? LocalDataProvider(for: ApplicantCacheKeys.applicant)
			: NetworkDataProvider(with: self.applicantAPI)
		
		self.imageLoadService = self.cacheService.dataExists(for: ApplicantCacheKeys.profileImage)
			? ImageLoader(for: ApplicantCacheKeys.profileImage, imageDownsampleService: imageDownsampleService)
			: ImageDownloader(imageDownsampleService: self.imageDownsampleService)
		
		super.init(coder: aDecoder)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.configureSubviews()
		self.dataProviderService?.fetchData { result in
			var applicant: Applicant? = result.decoded()
			applicant?.imageLoadService = self.imageLoadService
			applicant?.delegate = self
			
			self.profileHeaderView?.model = applicant
			self.cvTableView?.model = applicant
			
			result.value.map { self.cacheService.save(data: $0, for: ApplicantCacheKeys.applicant) }
		}
	}
	
	private func configureSubviews() {
		
		[self.profileHeaderView, self.cvTableView].forEach {
			$0 >>= self.view.addSubview
		}
		
		self.profileHeaderView?.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 25).isActive = true
		self.profileHeaderView?.constraint(top: false, bottom: false, to: self.view, constant: 16)
		
		let bottomAnchor = self.profileHeaderView?.bottomAnchor
		bottomAnchor.map { self.cvTableView?.topAnchor.constraint(equalTo: $0).isActive = true }
		self.cvTableView?.constraint(top: false, to: self.view, constant: 16)
	}
}

extension ProfileVC: ApplicantDelegate {
	
	func applicant(_ applicant: Applicant, didFinishLoading image: UIImage?) {
		image?.pngData().map { self.cacheService.save(data: $0, for: ApplicantCacheKeys.profileImage) }
	}
}
