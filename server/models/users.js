'use strict';
module.exports = function(sequelize, DataTypes) {
  var Users = sequelize.define('Users', {
    name: DataTypes.STRING,
    birthdate: DataTypes.STRING,
    zodiac: DataTypes.STRING,
    userID: {
      type: DataTypes.INTEGER(11).UNSIGNED,
      unique: true,
      references: {
        model: 'Users',
        key: 'id'
      },
      field: 'user_id',
      allowNull: false
    }
  }, {
    classMethods: {
      associate: function(models) {
      }
    }
  });
  return Users;
};