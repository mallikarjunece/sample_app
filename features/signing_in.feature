Feature: Signing In
	Scenario: Unsuccessful Signin
		Given a user visits the signin page
		When they submit invalid signin information
		Then they should see an error message

	Scenario: Successful Signin
		Given a user visits signin page
		And the user has account
		When the user submits valid signin information
		Then they should see profile page
		And they should see a signout link
