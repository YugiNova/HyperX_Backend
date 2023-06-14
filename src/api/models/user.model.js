import { DataTypes } from "sequelize";
import { Sequelize } from "sequelize";
import { sequelize } from "./index.js";

const User = sequelize.define("User",{
    id:{
        type: DataTypes.INTEGER,
        primaryKey:true,
        autoIncrement: true,
        allowNull: false
    },
    fullname:{
        type: DataTypes.STRING,
        allowNull: true
    },
    email:{
        type: DataTypes.STRING,
        allowNull: true
    },
    password:{
        type: DataTypes.STRING,
        allowNull: true
    },
    role_id:{
        type: DataTypes.INTEGER,
        allowNull: true
    },
    status:{
        type: DataTypes.STRING,
        allowNull: true
    },
    register_at: {
        field: "created_at",
        type: 'TIMESTAMP',
        defaultValue: Sequelize.literal('CURRENT_TIMESTAMP'),
        allowNull: false
    },
    modified_at: {
        field: "modified_at",
        type: 'TIMESTAMP',
        defaultValue: Sequelize.literal('CURRENT_TIMESTAMP'),
        allowNull: false
    }
},{
    tableName: 'user',
    timestamps: false
})

export {User}