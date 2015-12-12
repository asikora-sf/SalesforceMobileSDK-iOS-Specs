Pod::Spec.new do |s|

  s.name         = "SmartStore"
  s.version      = "4.0.0"
  s.summary      = "Salesforce Mobile SDK for iOS - SmartStore"
  s.homepage     = "https://github.com/forcedotcom/SalesforceMobileSDK-iOS"

  s.license      = { :type => "Salesforce.com Mobile SDK License", :file => "LICENSE.md" }
  s.author       = { "Kevin Hawkins" => "khawkins@salesforce.com" }

  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/forcedotcom/SalesforceMobileSDK-iOS.git",
                     :tag => "pod_v#{s.version}",
                     :submodules => true }
  
  s.requires_arc = true
  s.default_subspec  = 'SmartStore'

  s.subspec 'SQLCipher' do |sqlcipher|

      sqlcipher.preserve_paths = 'external/ThirdPartyDependencies/sqlcipher/LICENSE'
      sqlcipher.vendored_libraries = 'external/ThirdPartyDependencies/sqlcipher/libsqlcipher.a'

  end

  s.subspec 'SmartStore' do |smartstore|

      smartstore.dependency 'SalesforceMobileSDK-iOS/SalesforceSDKCore'
      smartstore.dependency 'SmartStore/SQLCipher'
      smartstore.dependency 'FMDB', '~> 2.5'
      smartstore.source_files = 'libs/Smartstore/Smartstore/Classes/**/*.{h,m}', 'libs/Smartstore/Smartstore/Smartstore.h'
      smartstore.public_header_files = 'libs/SmartStore/SmartStore/Classes/SFAlterSoupLongOperation.h', 'libs/SmartStore/SmartStore/Classes/SFQuerySpec.h', 'libs/SmartStore/SmartStore/Classes/SFSmartSqlHelper.h', 'libs/SmartStore/SmartStore/Classes/SFSmartStore.h', 'libs/SmartStore/SmartStore/Classes/SFSmartStoreDatabaseManager.h', 'libs/SmartStore/SmartStore/Classes/SFSmartStoreInspectorViewController.h', 'libs/SmartStore/SmartStore/Classes/SFSmartStoreUpgrade.h', 'libs/SmartStore/SmartStore/Classes/SFSmartStoreUtils.h', 'libs/SmartStore/SmartStore/Classes/SFSoupIndex.h', 'libs/SmartStore/SmartStore/Classes/SFStoreCursor.h', 'libs/SmartStore/SmartStore/Classes/SalesforceSDKManagerWithSmartStore.h', 'libs/SmartStore/SmartStore/SmartStore.h', 'libs/SmartStore/SmartStore/Classes/sqlite/SqliteAdditions.h'
      smartstore.header_dir = 'Headers/SmartStore'
      smartstore.prefix_header_contents = '#import <SalesforceSDKCore/SFLogger.h>', '#import <SalesforceSDKCore/SalesforceSDKConstants.h>'
      smartstore.xcconfig = { 'HEADER_SEARCH_PATHS' => "${PODS_ROOT}/Headers/Public/SalesforceMobileSDK-iOS/Headers", 'OTHER_CFLAGS' => '-DSQLITE_HAS_CODEC' }
      smartstore.requires_arc = true

  end

end
