var express = require('express');

var router = express.Router();
var mc = require('./model-controller.js');


//example from class --- make your own version of what is below.
router.get('/get-users', function(req,res){
	mc.getAllUsers((users) => {
		res.json(users);
	})
});

router.post('/create-user', (req,res) => {
	mc.createUser(
		req.body.name, 
		req.body.birthdate,
		(user) => {
			console.log(user)
			//res.json(user)
		}
	)
});

router.get('/get-horoscopes', function(req,res){
	mc.getAllHoroscope((horoscopes) => {
		console.log(horoscopes)
		res.json(horoscopes);
	})
});

router.post('/create-horoscope', (req,res) => {
	mc.createHoroscope(
		req.body.zodiac, 
		req.body.todays_horoscope,
		req.body.description,
		req.body.date_range,
		(horoscope) => {
			console.log(horoscope)
			//res.json(horoscope)
		}
	)
});




module.exports = router;