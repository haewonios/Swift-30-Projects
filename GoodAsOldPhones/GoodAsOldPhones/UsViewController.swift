//
//  UsViewController.swift
//  GoodAsOldPhones
//
//  Created by hyewon on 1/14/26.
//

import UIKit

class UsViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.alwaysBounceVertical = true
        return view
    }()
    
    private let contentView = UIView()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "About US"
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.text = """
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas a vulputate lorem, nec rhoncus enim. Mauris dolor eros, congue eget justo dignissim, volutpat facilisis ipsum. Phasellus tincidunt, nibh id hendrerit tincidunt, nisi sapien tincidunt lorem, in aliquam ex dui sed tellus. Ut at varius metus. Mauris finibus accumsan justo, pulvinar egestas ex accumsan non. Maecenas sapien ipsum, vehicula nec bibendum at, ornare quis quam. Vivamus bibendum pharetra nisl, vel gravida urna laoreet in. In accumsan libero at ligula eleifend, ut pretium quam cursus. Proin a justo sed justo ultricies commodo. Vestibulum imperdiet purus rutrum, maximus ante ut, vehicula dolor. Donec facilisis nisi eget nunc egestas commodo. 
            """
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Contact"
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private let emailImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "icon-about-email")
        return view
    }()
    
    private let phoneImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "icon-about-phone")
        return view
    }()
    
    private let websiteImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "icon-about-website")
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("UsViewController viewDidLoad")
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(contentLabel)
        contentView.addSubview(subTitleLabel)
        contentView.addSubview(emailImageView)
        contentView.addSubview(phoneImageView)
        contentView.addSubview(websiteImageView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        emailImageView.translatesAutoresizingMaskIntoConstraints = false
        phoneImageView.translatesAutoresizingMaskIntoConstraints = false
        websiteImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 100),
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            contentLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            contentLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            contentLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            contentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            
            subTitleLabel.topAnchor.constraint(equalTo: contentLabel.bottomAnchor, constant: 20),
            subTitleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            emailImageView.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 20),
            emailImageView.centerXAnchor.constraint(equalTo: subTitleLabel.centerXAnchor),
            
            phoneImageView.topAnchor.constraint(equalTo: emailImageView.bottomAnchor, constant: 20),
            phoneImageView.centerXAnchor.constraint(equalTo: subTitleLabel.centerXAnchor),
            
            websiteImageView.topAnchor.constraint(equalTo: phoneImageView.bottomAnchor, constant: 20),
            websiteImageView.centerXAnchor.constraint(equalTo: subTitleLabel.centerXAnchor),
            websiteImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
}
