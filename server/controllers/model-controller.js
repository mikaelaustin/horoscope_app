//In the model-controller.js file, make a function called createZodiac that adds zodiac information to the Zodiac model 
//(i.e. models.Zodiac.create({}))
//Import that into the route-controller.js file


var models = require('./../models');

// function getZodiac(birthdate) {
// 	if birthdate in range:
// 		return "cancer"
// }

module.exports = {
	getAllUsers: (cb) => {
		models.Users.findAll({
			attributes: ['name', 'birthdate', 'zodiac', 'userID']
		}).then(function(res){
			console.log(res)
			//cb(res)
		});
	},
	createUser: (name, birthdate, cb) => {
		models.User.create({
			name: name,
			birthdate: birthdate,
		}).then((res) => {
			console.log(res)
			//cb(res);
		})
	},

	getAllHoroscope: (cb) => {
		models.Users.findAll({
			attributes: ['zodiac', 'todays_horoscope', 'description', 'date_range']
		}).then(function(res){
			console.log(res)
			//cb(res)
		});
	},
	createHoroscope: (zodiac, todays_horoscope, description, date_range, cb) => {
		models.User.create({
			zodiac: zodiac,
			todays_horoscope: todays_horoscope, 
			description: description,
			date_range: date_range,
		}).then((res) => {
			console.log(res)
			//cb(res);
		})
	}
}