//
//  ViewController.swift
//  IPadTraits
//
//  Created by Don Mag on 11/27/18.
//  Copyright © 2018 DonMag. All rights reserved.
//

import UIKit

class IPadTraitsView: UIView {
	
	func loadViewFromNib() -> UIView? {
		let bundle = Bundle(for: type(of: self))
		let nib = UINib(nibName: "IPadTraitsView", bundle: bundle)
		return nib.instantiate(
			withOwner: self,
			options: nil).first as? UIView
	}
	
}


class ViewController: UIViewController {

	override public var traitCollection: UITraitCollection {
		
		var desiredTraits = [UITraitCollection]()
		
		if view.bounds.width < view.bounds.height {
			desiredTraits = [UITraitCollection(horizontalSizeClass: .compact), UITraitCollection(verticalSizeClass: .regular)]
		} else {
			desiredTraits = [UITraitCollection(horizontalSizeClass: .compact), UITraitCollection(verticalSizeClass: .compact)]
		}
		
		return UITraitCollection(traitsFrom: desiredTraits)
		
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let vv = IPadTraitsView()
		if let v = vv.loadViewFromNib() {
			view.addSubview(v)
			v.translatesAutoresizingMaskIntoConstraints = false
			NSLayoutConstraint.activate([
				v.topAnchor.constraint(equalTo: view.topAnchor, constant: 20.0),
				v.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20.0),
				v.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20.0),
				v.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20.0),
				])
		}
		
	}
	
}

