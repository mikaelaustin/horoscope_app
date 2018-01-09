'use strict';
module.exports = function(sequelize, DataTypes) {
  var Horoscope = sequelize.define('Horoscope', {
    zodiac: {
      type: DataTypes.STRING,
      unique: true 
    },
    todays_horoscope: DataTypes.STRING,
    description: DataTypes.STRING,
    date_range: DataTypes.STRING

  }, {
    classMethods: {
      associate: function(models) {
      }
    }
  });
  return Horoscope;
};