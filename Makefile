bzl_release_appstore_build: plist_increase_cfbundleversion
	bazel build //Main:MainApp --config=release --define=environment=production

bzl_release_adhoc_build: plist_increase_cfbundleversion
	bazel build //Main:MainApp --config=release --define=environment=adhoc

bzl_ipa_release_build:
	bazel build //Main:MainApp --config=release --define=environment=production

bzl_ipa_dev_build:
	bazel build //Main:MainApp --config=debug --define=environment=develop

tools_setup:
	gem install cocoapods-rome
	gem install cocoapods-keys
	brew install needle
	brew tap bazelbuild/tap     
	brew install bazelbuild/tap/bazel

pod_dependency:
	pod install
	
pod_rome_list_fw_bazel:
	ls -1 Rome | sed 's/\(.*\).framework/"\/\/Vendor\/\1:\1",/'

needle_generate:
	needle generate Main/App_NeedleGenerated.swift Main

rswift_generate:
	make -C tools/rswift generate
	mv tools/rswift/App_R.generated.swift Main
	mv tools/rswift/Barcode_R.generated.swift Modules/Barcode

ci_build: pod_dependency rswift_generate bzl_ipa_release_build

firebase_distribution:
	echo "need help!"

plist_increase_cfbundleversion:
	$(eval buildnumber = $(shell expr `/usr/libexec/PlistBuddy -c "Print :CFBundleVersion" Main/Plist_Info.plist` + 1))
	/usr/libexec/PlistBuddy -c "Set :CFBundleVersion ${buildnumber}" Main/Plist_Info.plist

xctemplate_foo:
	$(eval XCODE_TEMPLATE_DIR = /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/File\ Templates)
	echo $(XCODE_TEMPLATE_DIR)
	$(eval CUSTOM_DIR = ${XCODE_TEMPLATE_DIR}/Custom)
	$(eval TEMPLATE_DIR = Foo.xctemplate)
	echo "Prepare directory $(CUSTOM_DIR)"
	mkdir -p $(CUSTOM_DIR)
	echo "Done!"
	echo "Copy '$(TEMPLATE_DIR)' to '$(CUSTOM_DIR)'"
	cp -R $(TEMPLATE_DIR) $(CUSTOM_DIR)
	echo "Done!"
	echo "Happy coding!"