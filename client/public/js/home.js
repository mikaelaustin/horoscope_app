$(document).ready(function(){

//Get route for drop down list
//get route for horoscope and all users with the name

//post route with user info and bday being added to users
	// $.ajax({
	// 	method: 'GET',
	// 	url: '/get-horoscope'
	// }).then(function(res){
	// 	console.log(res)
	// })

	$('#zodiac-form').on('submit', function(e){
		e.preventDefault();

		var zodiacObj = {
			name: $('#name-input').val(),
			birthdate: $('#birthdate-input').val(),
			zodiac: $('#zodiac-dropdown').val()
		}
		console.log(zodiacObj);

		//ajax call to create user in the database
		$.ajax({
			method: 'POST',
			url: '/api/create-user',
			dataType: 'json',
			data: JSON.stringify(zodiacObj),
			contentType: 'application/json'
		}).then(function(res){
			console.log(res)
			console.log("user created")

			//ajax call to get zodiac for that user
			$.ajax({
				method: 'GET',
				url: '/api/get-horoscope/' + res.zodiac
			}).then(function(results){
				console.log(results)
				console.log("showing horoscope for user")

				//$('#result-div').remove();

				 var resultDiv = $('<div id="result-div">');


				var zodiacHeader = $('<h3 id="zodiac-header" class="text-center">Zodiac</h3>')
				var today = $('<h5 id="today"class="text-center">Todays Horoscope</h5>')
				var description = $('<h5 id="description"class="text-center">Description</h5>')
				var dateRange = $('<h5 id="date"class="text-center">Date Range</h5>')

				zodiacHeader.text(results.zodiac);
				today.text("Today's Horoscope: " + results.todays_horoscope);
				description.text("Description: " + results.description);
				dateRange.text("Date Range: " + results.date_range);

				resultDiv.append(zodiacHeader).append(today).append(description).append(dateRange);
				$('#horoscope-div').append(resultDiv);


			})
		});
	});

		
	//function to have users with same sign appear

	$('#zodiac-input').on('change', function(){

		var zodiac = $('#zodiac-input').val()
		console.log(zodiac)
		console.log("showing zodiac")

		$.ajax({
			method: 'GET',
			url: '/api/get-users/' + zodiac,
			dataType: 'json',
			contentType: 'application/json'
		}).then(function(users){
			console.log(users)
			console.log('showing users from zodiac pick')

		// 	$('#user-list-div').remove();
			var seeUsers = $('<h5 id="showusers" class="text-center"></h5>')
		 	var userListDiv = $('<div id="user-list-div" class="text-center">');

		 	var userList = $('<ol id="user-list" class="text-center">');
		 	for (var i = 0; i < users.length; i++){
		 		userList += "<li>" + users[i] + "</li>";
		 	}

		 	userList += "</ol>";

		 	seeUsers.text("Users with " + zodiac + " zodiac:")

		 	userListDiv.append(seeUsers).append(userList);

		 	$('#get-users-div').append(userListDiv)
		 });
	});
});
	


	
