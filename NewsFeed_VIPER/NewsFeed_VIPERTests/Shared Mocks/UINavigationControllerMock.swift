//
//  UINavigationControllerMock.swift
//  lalamove Driver Unit Test
//
//  Created by Dennis Li on 7/8/2019.
//  Copyright © 2019 EasyVan. All rights reserved.
//

import UIKit

class UINavigationControllerMock: UINavigationController {
    var pushedViewController: UIViewController?
    var dismissedParameter = [(Bool, (() -> Void)?)]()

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        pushedViewController = viewController
    }

    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        super.dismiss(animated: flag, completion: completion)
        dismissedParameter.append((flag, completion))
    }
}
