var path = require('path');
var express = require('express');
var bodyParser = require('body-parser');

var models = require('./models');
models.sequelize.sync();

var cookieParser = require('cookie-parser');
var passport = require('passport');
var session = require('express-session');
var SequelizeStore = require('connect-session-sequelize')(session.Store);
var flash = require('connect-flash');

var app = express();
var routes = require('./controllers/routes.js');

var PORT = process.env.PORT || 8000;

app.use(bodyParser.json({limit: '50mb'}));
app.use(bodyParser.urlencoded({ 
	limit: '50mb',
	extended: true, 
	parameterLimit:50000}));
app.use(bodyParser.text());
app.use(bodyParser.json());


app.use(cookieParser())
app.use(session({
	secret: 'lesson',
	store: new SequelizeStore({
		db: models.sequelize
 	}),
 	resave: true,
 	saveUninitialized: false
}));
app.use(passport.initialize());
app.use(passport.session());
app.use(flash());

app.use('/', routes)

app.use(express.static('./client'));

//require('./controllers/passport.js')(passport);
//require('./controllers/routes.js')(app);

app.listen(PORT, function(){
	console.log("Listening on PORT " + PORT);
});