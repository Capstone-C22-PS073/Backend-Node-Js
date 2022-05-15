import { DataTypes, Sequelize} from 'sequelize';
import db from '../config/database.js';


const Landmark = db.define('landmark', {
    id_landmark:{
       allowNull: false,
       autoIncrement: true,
       primaryKey: true,
       type: DataTypes.INTEGER
    },
    landmark_name:{
        type: DataTypes.STRING(100)
    },
    location:{
        type: DataTypes.STRING(200),
    },
    category:{
        type: DataTypes.STRING(50)
    },
    image:{
        type: DataTypes.STRING(255)
    },
    deskripsi:{
        type: DataTypes.TEXT
    }
}, {
    freezeTableName: true
});

export default Landmark;