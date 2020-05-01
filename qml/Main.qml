import Felgo 3.0
import QtQuick 2.0
import "pages"
import "helper"

/*/////////////////////////////////////
  NOTE:
  Additional integration steps are needed to use Felgo Plugins, for example to add and link required libraries for Android and iOS.
  Please follow the integration steps described in the plugin documentation of your chosen plugins:
  - Chartboost: https://felgo.com/doc/plugin-chartboost/

  To open the documentation of a plugin item in Qt Creator, place your cursor on the item in your QML code and press F1.
  This allows to view the properties, methods and signals of Felgo Plugins directly in Qt Creator.

/////////////////////////////////////*/

App{
  NavigationStack {
    Page {
      title: "Chartboost"

      Chartboost {
        id: chartboost

        appId:  "5eac6ff2b0d7d50a7a26676c"
        appSignature:  "64d4ea36cd5616e6d83d4b1dfead14f9a1bd1eff"

        // Do not use reward videos in this example
        shouldDisplayRewardedVideo: false

        // Call this function to display an interstitial ad at the default location
        function showAdIfAvailable() {
          chartboost.showInterstitial()
        }

        onInterstitialCached: {
          console.debug("InterstitialCached at location:", location)
        }

        onInterstitialFailedToLoad: {
          console.debug("InterstitialFailedToLoad at location:", location, "error:", error)
        }

      }
    }
  }
}
