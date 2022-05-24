import { Sequelize } from 'sequelize';

const database = `toursight_database`;
const user = 'root';
const password = '';

const db = new Sequelize (database, user, password,{
    host: 'localhost',
    dialect: 'mysql'
});


export default db;