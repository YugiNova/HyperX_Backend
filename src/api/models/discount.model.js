import { DataTypes } from "sequelize";
import { sequelize } from "./index.js";
import { Sequelize } from "sequelize";

const Discount = sequelize.define("Discount",{
    id:{
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false
    },
    discount:{
        type: DataTypes.FLOAT,
        allowNull: false
    },
    name:{
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
    tableName: "discount",
    timestamps: false,
})

export {Discount}