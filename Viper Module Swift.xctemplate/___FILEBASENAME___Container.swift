//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import Swinject

class ___FILEBASENAMEASIDENTIFIER___Container: AssemblyType {
    
    func assemble(container: Container) {
        container.register(___FILEBASENAMEASIDENTIFIER___InteractorInputProtocol.self) { _ in
            ___FILEBASENAMEASIDENTIFIER___Interactor()
        }
        
        container.register(___FILEBASENAMEASIDENTIFIER___RouterInputProtocol.self) { (r, parentRouter: ___FILEBASENAMEASIDENTIFIER___ParentRouterProtocol) in
            ___FILEBASENAMEASIDENTIFIER___Router(parentRouter: parentRouter)
        }
        
        container.register(___FILEBASENAMEASIDENTIFIER___PresenterProtocol.self) { (r, interface: ___FILEBASENAMEASIDENTIFIER___InterfaceProtocol, parentRouter: ___FILEBASENAMEASIDENTIFIER___ParentRouterProtocol) in
            let interactor = r.resolve(___FILEBASENAMEASIDENTIFIER___InteractorInputProtocol.self)!
            let router = r.resolve(___FILEBASENAMEASIDENTIFIER___RouterInputProtocol.self, argument: parentRouter)!
            return ___FILEBASENAMEASIDENTIFIER___Presenter(interface: interface, interactor: interactor, router: router)
        }
        
        container.register(___FILEBASENAMEASIDENTIFIER___InterfaceProtocol.self) {  (r, parentRouter: ___FILEBASENAMEASIDENTIFIER___ParentRouterProtocol) in
            let controller = ___FILEBASENAMEASIDENTIFIER___Controller()
            let presenter = r.resolve(___FILEBASENAMEASIDENTIFIER___PresenterProtocol.self, arguments: (controller as ___FILEBASENAMEASIDENTIFIER___InterfaceProtocol, parentRouter))!
            controller.presenter = presenter
            
            return controller
        }

    }
    
}