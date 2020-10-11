load("@build_bazel_rules_apple//apple:ios.bzl", "ios_application")
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

load("//config:custom_rules.bzl", "prebuilt_dynamic_framework")

filegroup(
    name = "AppIcon",
    srcs = glob(["Assets.xcassets/AppIcon.appiconset/**"]),
    visibility = ["//visibility:public"],
)

filegroup(
    name = "Assets",
    srcs = glob([
        "Assets.xcassets/**/*",
    ],
    exclude = [
        "Assets.xcassets/*.appiconset/**",
    ]),
    visibility = ["//visibility:public"],
)

swift_library(
    name = "Main",
    srcs = glob(["**/*.swift"]),
    data = glob([
        "**/*.storyboard",
        "**/*.xib",
        "**/*.xcassets/**",
        "**/*.plist"
    ]),
    deps = [
        "//deps:KeychainAccess"
    ],
)

ios_application(
    name = "MainApp",
    bundle_id = "com.muiz.idn.movieboom.ios",
    families = [
        "iphone",
        "ipad",
    ],
    app_icons = [":AppIcon"],
    resources = [":Assets"],
    minimum_os_version = "12.0",
    infoplists = [
        "Plist_Info.plist",
        "Plist_Keychain.plist"
    ],
    visibility = ["//visibility:public"],
    provisioning_profile = select({
        "production":"//provisioning_profiles:release.mobileprovision",
        "development":"//provisioning_profiles:dev.mobileprovision",
    }),
    deps = [
        ":Main",
    ],
    frameworks = []
)


config_setting(
    name = "development",
    values = {
        "compilation_mode": "dbg"
    }
)

config_setting(
    name = "production",
    values = {
        "compilation_mode": "opt"
    }
)