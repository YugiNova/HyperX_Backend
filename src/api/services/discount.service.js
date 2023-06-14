import moment from "moment";
import { Discount } from "../models/discount.model.js";
import { Product } from "../models/product.model.js";
import { Promotion } from "../models/promotion.model.js";

class DiscountService {
    getAllDiscount = async () => {
        try {
            const result = await Discount.findAll();
            return {
                type: "success",
                statusCode: 200,
                message: "Get all discounts successfull",
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

    getDiscountByID = async (discount_id) => {
        try {
            const result = await Discount.findOne({
                where: {
                    id: discount_id
                }
            });

            if(!result){
                return {
                    type: "error",
                    statusCode: 500,
                    message: "Discount not found",
                };
            }

            return {
                type: "success",
                statusCode: 200,
                message: "Get discount successfull",
                data: result,
            };
        } catch (error) {
            return {
                type: "error",
                statusCode: 500,
                message: typeof(error) === 'string'? error : error.message,
            };
        }
    }

    createDiscount = async (discount,name) => {
        try {
            const result = await Discount.create({
                discount,name
            });
            return {
                type: "success",
                statusCode: 200,
                message: "Create discount successfull",
                data: result.id,
            };
        } catch (error) {
            return {
                type: "error",
                statusCode: 500,
                message: error.message,
            };
        }
    }

    deleteDiscount = async (discount_id) => {
        try {
            const check = await Discount.findOne({
                where: {
                    id: discount_id
                }
            });

            if(!result){
                return {
                    type: "error",
                    statusCode: 500,
                    message: "Discount not found",
                };
            }

            //Set discount_id of relate promotion to 0
            await Promotion.update({
                discount_id: 0
            },{
                where:{
                    discount_id: discount_id
                }
            })
            //Set discount_id of relate product to 0
            await Product.update({
                discount_id: 0
            },{
                where: {
                    discount_id: discount_id
                }
            })

            const result = await Discount.destroy({
                where: {
                    id: discount_id
                }
            });
            return {
                type: "success",
                statusCode: 200,
                message: "Delete discount successfull",
                data: result,
            };
        } catch (error) {
            return {
                type: "error",
                statusCode: 500,
                message: error.message,
            };
        }
    }

    updateDiscount = async (discount_id,discount,name) => {
        try {
            const checkExists = await Discount.findOne({
                where:{
                    id: discount_id
                }
            })

            if(!checkExists){
                return {
                    type: "error",
                    statusCode: 500,
                    message: "Discount not found",
                };
            }

            const result = await Discount.update({
                discount,
                name,
                modified_at: moment().format()
            },{
                where: {
                    id: discount_id
                }
            });
            return {
                type: "success",
                statusCode: 200,
                message: "Update discount successfull",
            };
        } catch (error) {
            return {
                type: "error",
                statusCode: 500,
                message: error.message,
            };
        }
    }
}

export default DiscountService