platform :ios, '12.0'

def test_pods
  pod 'Nimble'
  pod 'RxBlocking'
end

abstract_target 'BaseDependencies' do
  use_frameworks!

  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'RxDataSources'

  target 'RxAPI' do
  end

  target 'RxAPIUITests' do
    inherit! :search_paths
  end

  target 'RxAPITests' do
    inherit! :search_paths
    test_pods
  end
end
