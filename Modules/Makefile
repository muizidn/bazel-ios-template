bzl_release_adhoc_build:
	bazel build App:ModulesApp --config=release --define=environment=adhoc

bzl_ipa_release_build:
	bazel build App:ModulesApp --config=release --define=environment=production

bzl_ipa_dev_build:
	bazel build App:ModulesApp --config=debug --define=environment=develop

bzl_fw_dev_build:
	bazel build Barcode:Modules --config=debug --define=environment=develop