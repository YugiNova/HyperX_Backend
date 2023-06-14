import { Sequelize } from "sequelize";
import mysql from "../../config/database.config.js";
export const sequelize = new Sequelize(
    mysql.database,
    mysql.user,
    mysql.password,
    {
        host: mysql.host,
        dialect: "mysql",
        logging: false,
        pool: {
            max: 5,
            min: 0,
            idle: 10000
        }
    }
);

sequelize.authenticate().then(() => {
    console.log('Connection has been established successfully.');
 }).catch((error) => {
    console.error('Unable to connect to the database: ', error.message);
 });


