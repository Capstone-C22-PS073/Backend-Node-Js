import { DataTypes } from 'sequelize';
import db from '../config/database.js';


const Images = db.define('user_image', {
    id:{
       allowNull: false,
       autoIncrement: true,
       primaryKey: true,
       type: DataTypes.INTEGER
    },
    image:{
        type: DataTypes.STRING(200),
        allowNull: false
    },

}, {
    freezeTableName: true,
    timestamps: false
});

export default Images;