
# rails_5_api_demo
An API in Rails 5 Using Token Based Authentication

# README
A simple demo project where a The user can login by providing a valid email and password. Authenticate user can get their activity perform topics. User can add a new topics as well. show all activity users for a topics.  
 
* Rails and Ruby version

	Ruby 2.4.0p0

	Rails 5.1.4

	Database Mysql

* Steps to perform

	bundle install

	rake db:create / rails db:create

	rake db:migrate / rails db:migrate

	rake db:seed / rails db:seed

* API's
	User signup
	
		url: http://localhost:3000/api/login.json
		
		Return a message user's created or not
		
		PARAMETERS:
		
			email: string
			
			password: password
			
			full_name: string
			
			age: integer

	user Login
		URL: http://localhost:3000/api/login.json
		
		Raturns a uniq token
		
		PARAMETTERS
		
			email: string
			
			password: password
			

	Get a users for a topic
		URL: http://localhost:3000/api/topics/"#{foot_ball}"/users.json
		
		return array of users with following formats
			{			
			    "data": [		    
				{			
			    "id": "9",		    
			    "type": "users",		    
			    "attributes": {		    
				"full-name": "subhaisis",			
				"age": null			
			    }		    
		   	}			
		    ]		    
		}
			
	Get a user's topics
		URL: http://localhost:3000/api/users/{id}/topics/
		# current user topics when id is 0
		return array of topic with following formats
		{
		
		    "data": [
		        {
	            "id": "9",
	            "type": "topics",
	            "attributes": {
	                "name": "football",
	                "describtion": "Football is a family of team sports that involve, to varying degrees, kicking a ball with the foot to score a goal "
	            }
		        }
		    ]
			}
