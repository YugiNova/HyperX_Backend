import { DataTypes } from "sequelize";
import { Sequelize } from "sequelize";
import { sequelize } from "./index.js";

const Promotion = sequelize.define("promotion",{
    id:{
        primaryKey: true,
        type: DataTypes.INTEGER,
        allowNull: false,
        autoIncrement: true
    },
    name:{
        type: DataTypes.STRING,
        allowNull: true
    },
    code:{
        type: DataTypes.STRING,
        allowNull: true
    },
    description:{
        type: DataTypes.STRING,
        allowNull: true
    },
    discount_id:{
        type: DataTypes.INTEGER,
        allowNull: true
    },
    image_url:{
        type: DataTypes.STRING,
        allowNull: true
    },
    image_public_id:{
        type: DataTypes.STRING,
        allowNull: true
    },
    type:{
        type: DataTypes.STRING,
        allowNull: true
    },
    created_at: {
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
    },
    created_by: DataTypes.INTEGER,
    modified_by: DataTypes.INTEGER,
},{
    tableName: "promotion",
    timestamps: false,
})

export {Promotion}
