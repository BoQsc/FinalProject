#!/usr/bin/env


function stopNeedforConfirmation {

	# Setting the value to 0 disables this feature and means all add-ons will be installed without user confirmation.
	declare findText="pref(\"extensions.autoDisableScopes\", 3)";
	declare replace="lockpref(\"extensions.autoDisableScopes\", 0)";
	declare insideFile="/usr/lib/firefox/browser/defaults/preferences/vendor-firefox.js";
	sudo sed --in-place --expression "s/$findText/$replace/g" $insideFile
	
	# additional defaultpref and pref, might be required as well, needs testing.

}

function restoreNeedforConfirmation {

	# Setting the value to 0 disables this feature and means all add-ons will be installed without user confirmation.
	declare findText="lockpref(\"extensions.autoDisableScopes\", 0)";
	declare replace="pref(\"extensions.autoDisableScopes\", 3)";
	declare insideFile="/usr/lib/firefox/browser/defaults/preferences/vendor-firefox.js";
	sed --in-place --expression "s/$findText/$replace/g" $insideFile
	
	# Haven't tested if after restore the extensions are becoming disabled
}


	#Requires to be first
	#If executed after the extraction/installation of Firefox webextension 
        # - extensions might still require to confirm and enable extension manualy .
        # If this happens:
        # 1. Delete the extensions
        # 2. Relaunch firefox
        # 3. Terminate Firefox
        # 4. Extract the extension again 
        # 5. Launch Firefox and see that the extension has been enabled.
	stopNeedforConfirmation;


	# WebExtensions integration for GNOME Shell  
	apt-get install chrome-gnome-shell
	
	
	# Prepare Firefox to communicate with Gnome Shell
	# Download Firefox WebExtension to communicate with Gnome Shell	 
	wget --no-check-certificate `don't validate the server's certificate` \
	     --content-disposition `Honor the Content-Disposition header when choosing local file names (EXPERIMENTAL)` \
	     --output-document=gnome_shell_integration-an+fx-linuz.xpi   `Filename of the downloaded extension archive` \
	`Download URL` "https://addons.mozilla.org/firefox/downloads/latest/gnome-shell-integration/addon-898030-latest.xpi" \
	# https://github.com/mozilla/addons-frontend/issues/4083	 
		 
		 
	
	# Create extension's folder according to extension's id
	sudo mkdir "/usr/lib/firefox/browser/extensions/chrome-gnome-shell@gnome.org"
	# .xpi extension files are simply .zip files
	sudo unzip -o "gnome_shell_integration-an+fx-linuz.xpi" -d "/usr/lib/firefox/browser/extensions/chrome-gnome-shell@gnome.org"








	# More information can be found here:
	# https://developer.mozilla.org/en-US/docs/Mozilla/Add-ons/WebExtensions/Distribution_options/Add-ons_in_the_enterprise#Firefox_settings









firefoxInstances=`ps -e | grep "firefox" | wc -l` 
if [ $firefoxInstances -gt 0 ]
then


echo $firefoxInstances


fi
