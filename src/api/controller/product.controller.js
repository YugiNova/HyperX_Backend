import { validationResult } from "express-validator";
import { ObjectArrayToArray } from "../../ultils/convertDataTypes.js";
import CategoryService from "../services/category.service.js";
import ProductService from "../services/product.service.js";

const product = new ProductService();
const category = new CategoryService();

class ProductController {
    getProductDetail = async (req, res, next) => {
        const result = await product.getProductDetail(req.params.id);
        res.status(result.statusCode).json(result);
    };

    getProducts = async (req, res, next) => {
        if(req.params.category_id){
            let leafCategories = await category.getLeafCategoryOfTree(Number(categoryId));
            leafCategories = ObjectArrayToArray(leafCategories.data, "id");
            req.params.category_id = leafCategories
        }
        const result = await product.getProducts(req.query);
        res.status(result.statusCode).json(result);
    };

    createProduct = async (req, res, next) => {
        const error = validationResult(req)
        if(!error.isEmpty()){
            res.status(400).json({
                type: "error",
                statusCode: 400,
                message: error.array()
            })
            return;
        }

        const result = await product.createProduct(req.body);

        res.status(result.statusCode).json(result)
    };

    updateProduct = async (req,res,next) => {    
        const error = validationResult(req)
        if(!error.isEmpty()){
            res.status(400).json({
                type: "error",
                statusCode: 400,
                message: error.array()
            })
            return;
        }
        
        const result = await product.updateProduct(Number(req.params.id),req.body)
        res.status(result.statusCode).json(result)
    }

    deleteProduct = async (req,res,next) => {
        const result = await product.deleteProduct(Number(req.params.id))
        res.status(result.statusCode).json(result)
    }
}

export default ProductController;
