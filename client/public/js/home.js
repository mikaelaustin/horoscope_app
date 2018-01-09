$(document).ready(function(){

//Get route for drop down list
//get route for horoscope and all users with the name

//post route with user info and bday being added to users
	$.ajax({
		method: 'GET',
		url: '/get-users'
	}).then(function(res){
		console.log(res)
	})

	$('#zodiac-form').on('submit', function(e){
		e.preventDefault();

		var zodiacObj = {
			name: $('#name-input').val(),
			birthdate: $('#birthdate-input').val()
		}

		$.ajax({
			method: 'POST',
			url: '/api/create-user',
			dataType: 'json',
			data: JSON.stringify(signInObj),
			contentType: 'application/json'
		}).then(function(res){
			console.log(res)
		
		});
	});

	
})