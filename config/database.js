import { Sequelize } from 'sequelize';

const database = process.env.CLOUDSQLDATABASE | `toursight_database`;
const user = process.env.CLOUDSQLUSER | 'root';
const password = process.env.CLOUDSQLPASSWORD | '';
const host = process.env.CLOUDSQLHOST | 'localhost';

const db = new Sequelize (database, user, password,{
    host: host,
    dialect: 'mysql'
});


export default db;