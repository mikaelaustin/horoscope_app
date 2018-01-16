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

			
			$.ajax({
				method: 'GET',
				url: '/api/get-horoscope/' + res.zodiac
			}).then(function(results){
				console.log(results)
				console.log("showing horoscope for user")

				$('#result-div').remove();

				var resultDiv = $('<div id="result-div">');

				var tableStr = $('<table id="horoscope-table" class="col-md-4 col-md-offset-4 table"><thead><tr>Zodiac<th>Name</th><th>Todays Horoscope</th><th>Description</th><th>Date Range</th></tr></thead><tbody id="horoscope-tbody">');
				for(var i = 0; i < results.length; i++){
					tableStr += "<tr><td>" + results[i].zodiac + "</td><td>" + results[i].todays_horoscope + "</td><td>" + results[i].description + "</td><td>" + results[i].date_range + "</tr>"
				}
				tableStr += "</tbody></table>";
				resultDiv.append(tableStr)

				$('horoscope-div').append(resultDiv)

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
			url: '/api/get-users/' + zodiac
		}).then(function(users){
			console.log(users)
			console.log('showing users from zodiac pick')

		// 	$('#user-list-div').remove();

		// 	var userListDiv = $('<div id="user-list-div">');

		// 	var userList = $('<ul id="user-list" class="col-md-4 text-center">');
		// 	for (var i=0; i < users.length; i++){
		// 		userList += "<li" + users[i].name + "</li>";

		// 	}
		// 	userList += "</ul>"
		// 	userListDiv.append(userList)

		// 	$('#get-users-div').append(userListDiv)
		 });
	});
});
	


	
