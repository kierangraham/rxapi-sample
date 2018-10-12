platform :ios, '12.0'

def test_pods
  pod 'Nimble'
end

abstract_target 'Base-Dependencies' do
  use_frameworks!

  target 'RxAPI' do

    pod 'RxSwift'
    pod 'RxCocoa'

    target 'RxAPITests' do
      inherit! :search_paths
      test_pods
    end

    target 'RxAPIUITests' do
      inherit! :search_paths
      test_pods
    end
  end
end
