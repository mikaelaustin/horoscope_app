$(document).ready(function(){

//Get route for drop down list
//get route for horoscope and all users with the name

//post route with user info and bday being added to users
	$.ajax({
		method: 'GET',
		url: '/get-horoscope'
	}).then(function(res){
		console.log(res)
	})

	$('#zodiac-form').on('submit', function(e){
		e.preventDefault();

		var zodiacObj = {
			name: $('#name-input').val(),
			birthdate: $('#birthdate-input').val()
		}
		console.log(zodiacObj);
		$.ajax({
			method: 'POST',
			url: '/api/create-user',
			dataType: 'json',
			data: JSON.stringify(zodiacObj),
			contentType: 'application/json'
		}).then(function(res){
			console.log(res)
			//window.location.href = '/get-horoscope'+res.results[0].id
		
		});

		$.ajax({
			method: 'GET',
			url: '/api/get-horoscope/:id',
		}).then(function(res){
			console.log(res)
		})
	});

	$('.option').on('click', function(){

		var zodiac = $('.selectpicker').val()

		$.ajax({
			method: 'GET',
			url: '/api/get-users',
			dataType: 'json',
			data: JSON.stringify(zodiacPicker),
			contentType: 'application/json'
		}).then(function(res){
			console.log(res)
		})
	})

	
})