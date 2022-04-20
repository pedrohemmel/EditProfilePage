//
//  ViewController.swift
//  EditProfilePage
//
//  Created by Pedro Henrique Dias Hemmel de Oliveira Souza on 19/04/22.
//

import UIKit

class ViewController: UIViewController {
    
    //CREATING VIEWS
    
    private let headView : UIView = {
        let headView = UIView()
        headView.backgroundColor = .lightGray
        headView.translatesAutoresizingMaskIntoConstraints = false
        return headView
    }()
    
    private let redView : UIView = {
        let redView = UIView()
        redView.backgroundColor = .systemRed
        redView.layer.cornerRadius = 10
        redView.translatesAutoresizingMaskIntoConstraints = false
        return redView
    }()
    
    private let blueView : UIView = {
        let blueView = UIView()
        blueView.backgroundColor = .systemBlue
        blueView.layer.cornerRadius = 10
        blueView.translatesAutoresizingMaskIntoConstraints = false
        return blueView
    }()
    
    private let greenView : UIView = {
        let greenView = UIView()
        greenView.backgroundColor = .systemGreen
        greenView.layer.cornerRadius = 10
        greenView.translatesAutoresizingMaskIntoConstraints = false
        return greenView
    }()
    
    private let purpleView : UIView = {
        let purpleView = UIView()
        purpleView.backgroundColor = .systemPurple
        purpleView.layer.cornerRadius = 10
        purpleView.translatesAutoresizingMaskIntoConstraints = false
        return purpleView
    }()
    
    private let brownView : UIView = {
        let brownView = UIView()
        brownView.backgroundColor = .systemBrown
        brownView.layer.cornerRadius = 10
        brownView.translatesAutoresizingMaskIntoConstraints = false
        return brownView
    }()
    
    private let infoView : UIView = {
        let infoView = UIView();
        infoView.backgroundColor = .systemCyan
        infoView.translatesAutoresizingMaskIntoConstraints = false
        return infoView
    }()
    
    //CREATING LABELS
    
    private let lblName : UILabel = {
        let lblName = UILabel()
        lblName.text = "Nome"
        lblName.textColor = .black
        lblName.translatesAutoresizingMaskIntoConstraints = false
        return lblName
    }()

    private let lblHeadTitle : UILabel = {
        let lblHeadTitle = UILabel()
        lblHeadTitle.text = "Edit profile"
        lblHeadTitle.textColor = .black
        lblHeadTitle.textAlignment = .center
        lblHeadTitle.translatesAutoresizingMaskIntoConstraints = false
        return lblHeadTitle
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Adding views into the default view
        [headView, redView, blueView, greenView, purpleView, brownView, infoView, lblName, lblHeadTitle].forEach { view.addSubview($0) }
        
        //Modifying UIViews
        
        
        redView.anchor(top: headView.bottomAnchor, leading: nil, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 12, left: 0, bottom: 0, right: 12), size: .init(width: 100, height: 100))
        blueView.anchor(top: redView.bottomAnchor, leading: nil, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 12, left: 0, bottom: 0, right: 12), size: .init(width: 100, height: 100))
        greenView.anchor(top: headView.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: blueView.bottomAnchor, trailing: redView.leadingAnchor, padding: .init(top: 12, left: 12, bottom: 0, right: 12), size: .zero)
        purpleView.anchor(top: greenView.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: brownView.bottomAnchor, trailing: greenView.trailingAnchor, padding: .init(top: 12, left: 12, bottom: 0, right: 0), size: .zero)
        brownView.anchor(top: blueView.bottomAnchor, leading: purpleView.trailingAnchor, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 12, left: 12, bottom: 0, right: 12), size: .init(width: 100, height: 100))
        infoView.anchor(top: purpleView.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 12, left: 12, bottom: 12, right: 12), size: .zero)
        
        headView.anchor(top: view.topAnchor, leading: nil, bottom: nil, trailing: nil, padding: .zero, size: .zero)
        headView.anchorSize(to: view, to: brownView)
        
        lblHeadTitle.anchor(top: nil, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: headView.bottomAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 12, right: 0), size: .zero)
        lblHeadTitle.anchorSize(to: view, to: lblHeadTitle)
        
        //Modifying profile informations
        lblName.anchor(top: infoView.topAnchor, leading: infoView.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 20, left: 20, bottom: 0, right: 0), size: .zero)
        
        

        
    }


}

extension UIView {
    
    func anchorSize(to width: UIView, to height: UIView) {
        var anchorSize = [NSLayoutConstraint]()
        
        //Adding atributes
        anchorSize.append(widthAnchor.constraint(equalTo: width.widthAnchor))
        anchorSize.append(heightAnchor.constraint(equalTo: height.heightAnchor))
        
        //activating
        NSLayoutConstraint.activate(anchorSize)
    }
    
    //It left the constraints variables optionals because these variables can conflit with the size of the view
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
        var constraints = [NSLayoutConstraint]()
        
        //Applying constraints to the views
        
        //Making conditions to satisfy the optionals variables
        if let top = top {
            constraints.append(topAnchor.constraint(equalTo: top, constant: padding.top))
        }
        
        if let bottom = bottom {
            constraints.append(bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom))
        }
        
        if let trailing = trailing {
            constraints.append(trailingAnchor.constraint(equalTo: trailing, constant: -padding.right))
        }
        
        if let leading = leading {
            constraints.append(leadingAnchor.constraint(equalTo: leading, constant: padding.left))
        }
        
        if size.width != 0 {
            constraints.append(widthAnchor.constraint(equalToConstant: size.width))
        }
        
        if size.width != 0 {
            constraints.append(heightAnchor.constraint(equalToConstant: size.height))
        }
        
        //Activating constraints
        NSLayoutConstraint.activate(constraints)
    }
}

