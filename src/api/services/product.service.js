import { Op, QueryTypes, Sequelize, or } from "sequelize";
import { Category } from "../models/category.model.js";
import { Product, ProductDetail } from "../models/product.model.js";
import { sequelize } from "../models/index.js";
import { convertQueryParams } from "../../ultils/convertDataTypes.js";

class ProductService {
    getProductDetail = async (product_id) => {
        try {
            const product = await Product.findOne({
                where: {
                    id: product_id,
                },
            });
            if (!product) {
                throw "Product not found";
            }
            const productDetail = await ProductDetail.findAll({
                where: {
                    product_id: product_id,
                },
            });
            return {
                type: "error",
                statusCode: 200,
                message: "Get product successfull",
                data: { ...product.dataValues, detail: productDetail },
            };
        } catch (error) {
            return {
                type: "error",
                statusCode: 500,
                message: typeof error === "string" ? error : error.message,
            };
        }
    };

    getProducts = async ({ page, limit, order, ...find }) => {
        try {
            const queries = convertQueryParams({ page, limit, order, ...find });
            if (find.category_id && Array.isArray(find.category_id)) {
                queries.where = {
                    category_id: { [Op.or]: find.category_id },
                };
            }
            const { count, rows } = await Product.findAndCountAll({
                ...queries,
            });
            return {
                type: "success",
                statusCode: 200,
                message: "Get products successfull",
                data: { count, result: rows },
            };
        } catch (error) {
            return {
                type: "error",
                statusCode: 500,
                message: typeof error === "string" ? error : error.message,
            };
        }
    };

    createProduct = async (data) => {
        try {
            const result = await Product.create({ ...data });
            return {
                type: "success",
                statusCode: 200,
                message: "Create product successfull",
                data: result,
            };
        } catch (error) {
            return {
                type: "error",
                statusCode: 500,
                message: error.message,
            };
        }
    };

    updateProduct = async (id, data) => {
        try {
            const result = await Product.update(
                { ...data, modified_at: moment().format() },
                { where: { id: id } }
            );
            if(result[0] === 0) throw 'Product not found'
            return {
                type: "success",
                statusCode: 200,
                message: "Update product successfull",
            };
        } catch (error) {
            return {
                type: "error",
                statusCode: 500,
                message: typeof(error) === "string" ? error : error.message
            }
        }
    };

    deleteProduct = async (id) => {
        try {
            const result = await Product.destroy({where: {id:id}})
            if(result === 0) throw "Product not found"
            return {
                type: "success",
                statusCode: 200,
                message: "Delete product successfull",
            };
        } catch (error) {
            return {
                type: "error",
                statusCode: 500,
                message: typeof(error) === "string" ? error : error.message
            }
        }
    }
}

export default ProductService;
