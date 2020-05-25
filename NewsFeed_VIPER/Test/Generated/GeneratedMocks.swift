// MARK: - Mocks generated from file: NewsFeed_VIPER/Misc/AnyView.swift

import Cuckoo
@testable import NewsFeed_VIPER

import UIKit


 class MockAnyView: AnyView, Cuckoo.ProtocolMock {
    
     typealias MocksType = AnyView
    
     typealias Stubbing = __StubbingProxy_AnyView
     typealias Verification = __VerificationProxy_AnyView

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: AnyView?

     func enableDefaultImplementation(_ stub: AnyView) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     var view: UIView {
        get {
            return cuckoo_manager.getter("view",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.view)
        }
        
    }
    

    

    

	 struct __StubbingProxy_AnyView: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var view: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockAnyView, UIView> {
	        return .init(manager: cuckoo_manager, name: "view")
	    }
	    
	    
	}

	 struct __VerificationProxy_AnyView: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var view: Cuckoo.VerifyReadOnlyProperty<UIView> {
	        return .init(manager: cuckoo_manager, name: "view", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	}
}

 class AnyViewStub: AnyView {
    
    
     var view: UIView {
        get {
            return DefaultValueRegistry.defaultValue(for: (UIView).self)
        }
        
    }
    

    

    
}


// MARK: - Mocks generated from file: NewsFeed_VIPER/Misc/Routers.swift

import Cuckoo
@testable import NewsFeed_VIPER

import UIKit


 class MockRouterProtocol: RouterProtocol, Cuckoo.ProtocolMock {
    
     typealias MocksType = RouterProtocol
    
     typealias Stubbing = __StubbingProxy_RouterProtocol
     typealias Verification = __VerificationProxy_RouterProtocol

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: RouterProtocol?

     func enableDefaultImplementation(_ stub: RouterProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     var sourceViewController: UIViewController? {
        get {
            return cuckoo_manager.getter("sourceViewController",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.sourceViewController)
        }
        
        set {
            cuckoo_manager.setter("sourceViewController",
                value: newValue,
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.sourceViewController = newValue)
        }
        
    }
    
    
    
     var closeCompletion: VoidHandler? {
        get {
            return cuckoo_manager.getter("closeCompletion",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.closeCompletion)
        }
        
        set {
            cuckoo_manager.setter("closeCompletion",
                value: newValue,
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.closeCompletion = newValue)
        }
        
    }
    

    

    

	 struct __StubbingProxy_RouterProtocol: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var sourceViewController: Cuckoo.ProtocolToBeStubbedOptionalProperty<MockRouterProtocol, UIViewController> {
	        return .init(manager: cuckoo_manager, name: "sourceViewController")
	    }
	    
	    
	    var closeCompletion: Cuckoo.ProtocolToBeStubbedOptionalProperty<MockRouterProtocol, VoidHandler> {
	        return .init(manager: cuckoo_manager, name: "closeCompletion")
	    }
	    
	    
	}

	 struct __VerificationProxy_RouterProtocol: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var sourceViewController: Cuckoo.VerifyOptionalProperty<UIViewController> {
	        return .init(manager: cuckoo_manager, name: "sourceViewController", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var closeCompletion: Cuckoo.VerifyOptionalProperty<VoidHandler> {
	        return .init(manager: cuckoo_manager, name: "closeCompletion", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	}
}

 class RouterProtocolStub: RouterProtocol {
    
    
     var sourceViewController: UIViewController? {
        get {
            return DefaultValueRegistry.defaultValue(for: (UIViewController?).self)
        }
        
        set { }
        
    }
    
    
     var closeCompletion: VoidHandler? {
        get {
            return DefaultValueRegistry.defaultValue(for: (VoidHandler?).self)
        }
        
        set { }
        
    }
    

    

    
}


// MARK: - Mocks generated from file: NewsFeed_VIPER/Modules/NewsList/NewsListInteractor.swift

import Cuckoo
@testable import NewsFeed_VIPER


 class MockNewsListInteractorProtocol: NewsListInteractorProtocol, Cuckoo.ProtocolMock {
    
     typealias MocksType = NewsListInteractorProtocol
    
     typealias Stubbing = __StubbingProxy_NewsListInteractorProtocol
     typealias Verification = __VerificationProxy_NewsListInteractorProtocol

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: NewsListInteractorProtocol?

     func enableDefaultImplementation(_ stub: NewsListInteractorProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    

	 struct __StubbingProxy_NewsListInteractorProtocol: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	}

	 struct __VerificationProxy_NewsListInteractorProtocol: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	}
}

 class NewsListInteractorProtocolStub: NewsListInteractorProtocol {
    

    

    
}


// MARK: - Mocks generated from file: NewsFeed_VIPER/Modules/NewsList/NewsListRouter.swift

import Cuckoo
@testable import NewsFeed_VIPER

import UIKit


 class MockNewsListRouterProtocol: NewsListRouterProtocol, Cuckoo.ProtocolMock {
    
     typealias MocksType = NewsListRouterProtocol
    
     typealias Stubbing = __StubbingProxy_NewsListRouterProtocol
     typealias Verification = __VerificationProxy_NewsListRouterProtocol

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: NewsListRouterProtocol?

     func enableDefaultImplementation(_ stub: NewsListRouterProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     var sourceViewController: UIViewController? {
        get {
            return cuckoo_manager.getter("sourceViewController",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.sourceViewController)
        }
        
        set {
            cuckoo_manager.setter("sourceViewController",
                value: newValue,
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.sourceViewController = newValue)
        }
        
    }
    
    
    
     var closeCompletion: VoidHandler? {
        get {
            return cuckoo_manager.getter("closeCompletion",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.closeCompletion)
        }
        
        set {
            cuckoo_manager.setter("closeCompletion",
                value: newValue,
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.closeCompletion = newValue)
        }
        
    }
    

    

    

	 struct __StubbingProxy_NewsListRouterProtocol: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var sourceViewController: Cuckoo.ProtocolToBeStubbedOptionalProperty<MockNewsListRouterProtocol, UIViewController> {
	        return .init(manager: cuckoo_manager, name: "sourceViewController")
	    }
	    
	    
	    var closeCompletion: Cuckoo.ProtocolToBeStubbedOptionalProperty<MockNewsListRouterProtocol, VoidHandler> {
	        return .init(manager: cuckoo_manager, name: "closeCompletion")
	    }
	    
	    
	}

	 struct __VerificationProxy_NewsListRouterProtocol: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var sourceViewController: Cuckoo.VerifyOptionalProperty<UIViewController> {
	        return .init(manager: cuckoo_manager, name: "sourceViewController", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var closeCompletion: Cuckoo.VerifyOptionalProperty<VoidHandler> {
	        return .init(manager: cuckoo_manager, name: "closeCompletion", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	}
}

 class NewsListRouterProtocolStub: NewsListRouterProtocol {
    
    
     var sourceViewController: UIViewController? {
        get {
            return DefaultValueRegistry.defaultValue(for: (UIViewController?).self)
        }
        
        set { }
        
    }
    
    
     var closeCompletion: VoidHandler? {
        get {
            return DefaultValueRegistry.defaultValue(for: (VoidHandler?).self)
        }
        
        set { }
        
    }
    

    

    
}


// MARK: - Mocks generated from file: NewsFeed_VIPER/Modules/NewsList/NewsListView.swift

import Cuckoo
@testable import NewsFeed_VIPER

import UIKit


 class MockNewsListViewProtocol: NewsListViewProtocol, Cuckoo.ProtocolMock {
    
     typealias MocksType = NewsListViewProtocol
    
     typealias Stubbing = __StubbingProxy_NewsListViewProtocol
     typealias Verification = __VerificationProxy_NewsListViewProtocol

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: NewsListViewProtocol?

     func enableDefaultImplementation(_ stub: NewsListViewProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     var presenter: NewsListPresenterProtocol? {
        get {
            return cuckoo_manager.getter("presenter",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.presenter)
        }
        
        set {
            cuckoo_manager.setter("presenter",
                value: newValue,
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.presenter = newValue)
        }
        
    }
    
    
    
     var view: UIView {
        get {
            return cuckoo_manager.getter("view",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.view)
        }
        
    }
    

    

    
    
    
     func presentModel(model: NewsListModel)  {
        
    return cuckoo_manager.call("presentModel(model: NewsListModel)",
            parameters: (model),
            escapingParameters: (model),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.presentModel(model: model))
        
    }
    

	 struct __StubbingProxy_NewsListViewProtocol: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var presenter: Cuckoo.ProtocolToBeStubbedOptionalProperty<MockNewsListViewProtocol, NewsListPresenterProtocol> {
	        return .init(manager: cuckoo_manager, name: "presenter")
	    }
	    
	    
	    var view: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockNewsListViewProtocol, UIView> {
	        return .init(manager: cuckoo_manager, name: "view")
	    }
	    
	    
	    func presentModel<M1: Cuckoo.Matchable>(model: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(NewsListModel)> where M1.MatchedType == NewsListModel {
	        let matchers: [Cuckoo.ParameterMatcher<(NewsListModel)>] = [wrap(matchable: model) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockNewsListViewProtocol.self, method: "presentModel(model: NewsListModel)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_NewsListViewProtocol: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var presenter: Cuckoo.VerifyOptionalProperty<NewsListPresenterProtocol> {
	        return .init(manager: cuckoo_manager, name: "presenter", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var view: Cuckoo.VerifyReadOnlyProperty<UIView> {
	        return .init(manager: cuckoo_manager, name: "view", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func presentModel<M1: Cuckoo.Matchable>(model: M1) -> Cuckoo.__DoNotUse<(NewsListModel), Void> where M1.MatchedType == NewsListModel {
	        let matchers: [Cuckoo.ParameterMatcher<(NewsListModel)>] = [wrap(matchable: model) { $0 }]
	        return cuckoo_manager.verify("presentModel(model: NewsListModel)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class NewsListViewProtocolStub: NewsListViewProtocol {
    
    
     var presenter: NewsListPresenterProtocol? {
        get {
            return DefaultValueRegistry.defaultValue(for: (NewsListPresenterProtocol?).self)
        }
        
        set { }
        
    }
    
    
     var view: UIView {
        get {
            return DefaultValueRegistry.defaultValue(for: (UIView).self)
        }
        
    }
    

    

    
     func presentModel(model: NewsListModel)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}

