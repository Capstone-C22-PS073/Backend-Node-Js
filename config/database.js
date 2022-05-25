import { Sequelize } from 'sequelize';

const database = `toursight_database`;
const user = 'root';
const password = '';
const host = 'localhost';

const db = new Sequelize (database, user, password,{
    host: host,
    dialect: 'mysql'
});


export default db;