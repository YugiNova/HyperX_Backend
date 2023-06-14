import { DataTypes } from "sequelize";
import { Sequelize } from "sequelize";
import { sequelize } from "./index.js";

const Category = sequelize.define("Category",{
    id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true,
        allowNull: false
    },
    parent_id: {
        type: DataTypes.INTEGER,
        allowNull: true
    },
    name: DataTypes.STRING,
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
    tableName: "category",
    timestamps: false,
})

export {Category}