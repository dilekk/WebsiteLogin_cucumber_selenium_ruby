Feature: Login to the CES as Studio User
	Background:
		Given navigate to FireFox CES Site
	Scenario:
		Given Studio User enters the username and password on the command line
		When Logged in to Studio User Site
		Then Show message Logged in Successfully

