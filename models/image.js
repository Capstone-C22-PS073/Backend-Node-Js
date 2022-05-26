import { DataTypes } from 'sequelize';
import db from '../config/database.js';
import Users from './user-model.js';


const Images = db.define('user_image', {
    id:{
       allowNull: false,
       autoIncrement: true,
       primaryKey: true,
       type: DataTypes.INTEGER
    },
    image:{
        type: DataTypes.STRING(300),
        allowNull: false
    },
    createdAt:{
        type: DataTypes.DATEONLY,
        defaultValue: DataTypes.NOW
    },
    updatedAt:{
        type: DataTypes.DATEONLY,
        defaultValue: DataTypes.NOW
    }
}, {
    freezeTableName: true,
    timestamps: false
});

export default Images;