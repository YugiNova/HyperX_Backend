import { Promotion } from "../models/promotion.model.js"
import { Product } from "../models/product.model.js"

import { convertQueryParams } from "../../ultils/convertDataTypes.js"
import moment from "moment"


class PromotionService {
    getPromotions = async ({page,limit,order,...find}) => {
        try {
            const queries = convertQueryParams({page,limit,order,...find})

            const {count,rows} = await Promotion.findAndCountAll({
                ...queries
            })
            
            return {
                type: "success",
                statusCode: 200,
                message: "Get promotions successfull",
                data: {count,result: rows}
            }
        } catch (error) {
            return {
                type: "error",
                statusCode: 500,
                message: error.message
            }
        }
    }

    getPromotionById = async (promotion_id) => {
        try {
            const result = await Promotion.findOne({
                where: {
                    id: promotion_id
                }
            })

            if(!result){
                return {
                    type: "error",
                    statusCode: 500,
                    message: "Promotion not found"
                }
            }

            return {
                type: "success",
                statusCode: 200,
                message: "Get promotion successfull",
                data: result
            }
        } catch (error) {
            return {
                type: "error",
                statusCode: 500,
                message: error.message
            }
        }
    }

    createPromotion = async (reqBody) => {
        try {
            const result = await Promotion.create({
                ...reqBody
            })

            return {
                type: 'success',
                statusCode: 200,
                message: 'Create promotion successfull',
                data: result
            }
        } catch (error) {
            return {
                type: "error",
                statusCode: 500,
                message: error.message
            }
        }
    }

    updatePromotion = async (id,reqBody) => {
        try {
            const checkExists = await Promotion.findOne({
                where: {
                    id: id
                }
            })

            if(!checkExists){
                return {
                    type: "error",
                    statusCode: 500,
                    message: "Promotion not found"
                }
            }

            const result = await Promotion.update({
                ...reqBody,
                modified_at: moment().format()
            },{
                where: {
                    id: id
                }
            })
            return {
                type: 'success',
                statusCode: 200,
                message: 'Update promotion successfull'
            }

        } catch (error) {
            return {
                type: "error",
                statusCode: 500,
                message: typeof(error) === string ? error : error.message
            }
        }
    }

    deletePromotion = async (promotion_id) => {
        try {
            const checkExists = await Promotion.findOne({
                where: {
                    id: promotion_id
                }
            })

            if(!checkExists){
                return {
                    type: "error",
                    statusCode: 500,
                    message: "Promotion not found"
                }
            }

            //Set promotion_id of relate product to 0
            await Product.update({
                promotion_id: 0
            },{
                where: {
                    promotion_id: promotion_id
                }
            })

            const result = await Promotion.destroy({
                where: {
                    id: promotion_id
                }
            })
            return {
                type: 'success',
                statusCode: 200,
                message: 'Delete promotion successfull'
            }
            
        } catch (error) {
            return {
                type: "error",
                statusCode: 500,
                message: typeof(error) === string ? error : error.message
            }
        }
    }
}

export {PromotionService}