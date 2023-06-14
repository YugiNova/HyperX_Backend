import { DataTypes } from "sequelize";
import { sequelize } from "./index.js";
import { Sequelize } from "sequelize";
import { Category } from "./category.model.js";


const Product = sequelize.define("Product",{
    id:{
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false
    },
    sku: {
        type: DataTypes.STRING,
        allowNull: true
    },
    name: {
        type: DataTypes.STRING,
        allowNull: true
    },
    price: {
        type: DataTypes.STRING,
        allowNull: true
    },
    image_url: {
        type: DataTypes.STRING,
        allowNull: true
    },
    image_public_id: {
        type: DataTypes.STRING,
        allowNull: true
    },
    short_desc: {
        type: DataTypes.STRING,
        allowNull: true
    },
    long_desc: {
        type: DataTypes.STRING,
        allowNull: true
    },
    discount_id: {
        type: DataTypes.STRING,
        allowNull: true
    },
    promotion_id: {
        type: DataTypes.STRING,
        allowNull: true
    },
    category_id: {
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
    timestamps: false,
    tableName: 'product'
})

const ProductDetail = sequelize.define("ProductDetail",{
    id:{
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false
    },
    product_id:{
        type: DataTypes.INTEGER,
        allowNull: true,
    },
    title:{
        type: DataTypes.STRING,
        allowNull: true
    },
    info:{
        type: DataTypes.STRING,
        allowNull: true
    }
},{
    timestamps: false,
    tableName: 'product_detail'
})



export {Product,ProductDetail}