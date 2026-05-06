import com.android.build.gradle.AppExtension

val android = project.extensions.getByType(AppExtension::class.java)

android.apply {
    flavorDimensions("env")

    productFlavors {
        create("dev") {
            dimension = "env"
            applicationId = "com.yourcompany.vpnapp.dev"
            resValue(type = "string", name = "app_name", value = "VPN Dev")
        }
        create("staging") {
            dimension = "env"
            applicationId = "com.yourcompany.vpnapp.staging"
            resValue(type = "string", name = "app_name", value = "VPN Staging")
        }
        create("prod") {
            dimension = "env"
            applicationId = "com.yourcompany.vpnapp"
            resValue(type = "string", name = "app_name", value = "VPN")
        }
    }
}