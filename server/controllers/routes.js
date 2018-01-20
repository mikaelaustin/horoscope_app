var express = require('express');
var path = require('path');
var models = require('./../models');
models.sequelize.sync();

var router = express.Router();
var mc = require('./model-controller.js');

router.get('/', (req,res) => {
	res.sendFile(path.join(__dirname, './../../client/public/html/home.html'))
});


//example from class --- make your own version of what is below.
// router.get('/api/get-users', function(req,res){
// 	mc.getAllUsers((users) => {
// 		res.json(users);
// 	})
// });

router.get('/api/get-users/:zodiac', function(req, res){
	//console.log(req)
	models.User.findAll({where: {zodiac: req.params.zodiac}}).then(function(users){
		//console.log("~~~~~~~~~~~~~~~~~~~~~~~~~")
		//console.log(users)
		console.log("~~~~~~~~~~~~~~~~~~~~~~~~~")
		var user_array = []
		for(var i=0; i < users.length; i++){
		  	user_array.push(users[i].dataValues.name)
		
		}
			console.log(user_array)
		 	console.log("~~~~~~~~~~~~~~~~~~~~~~~~~")
		 	res.json(user_array)
	})
})

router.post('/api/create-user', (req,res) => {
	console.log(req.body)
	mc.createUser(
		req.body.name, 
		req.body.birthdate,
		req.body.zodiac,
		(user) => {
			console.log("----------------------------------")
			console.log(user);
			console.log("----------------------------------")
			res.json(user);
		}
	)
});

//get horoscope where date range is within date range of what is input and returns 
router.get('/api/get-horoscopes', function(req,res){
	mc.getAllHoroscope((horoscopes) => {
		console.log(horoscopes)
		res.json(horoscopes);
	})
});

router.post('/api/create-horoscope', (req,res) => {
	mc.createHoroscope(
		//console.log(req.body)
		req.body.zodiac, 
		req.body.todays_horoscope,
		req.body.description,
		req.body.date_range,
		(horoscope) => {
			console.log(horoscope)
			console.log("++++++++++++++")
			res.json(horoscope)
			console.log("++++++++++++++")
		}
	)
});
router.get('/api/get-horoscope/:zodiac', (req, res)=> {
	console.log(req)
	console.log("console logging req in zodiac routes")
	 models.Horoscope.findOne({where: {zodiac: req.params.zodiac}}).then(function(zodiac){
	 	//var zodiac_array=[]
	 	//console.log(zodiac)
	 	//res.json(zodiac)
	 	console.log("#############################")
	 	// res.json(zodiac.dataValues.zodiac)
	 	// res.json(zodiac.dataValues.todays_horoscope)
	 	// res.json(zodiac.dataValues.description)
	 	// res.json(zodiac.dataValues.date_range)
	 	//zodiac_array.push(zodiac.dataValues.zodiac).push(zodiac.dataValues.todays_horoscope).push(zodiac.dataValues.description).push(zodiac.dataValues.date_range)
	 	//res.json(zodiac_array)

 		

 		console.log(zodiac.dataValues)
 		res.json(zodiac.dataValues)


 		})
});






module.exports = router;