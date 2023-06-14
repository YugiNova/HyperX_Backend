import DiscountService from "../services/discount.service.js";

const discountService = new DiscountService

class DiscountController {
    getAllDiscount = async (req,res,next) => {
        const result = await discountService.getAllDiscount()

        res.status(result.statusCode).json(result)
    }
    

    getDiscountByID = async (req,res,next) => {
        console.log(req.params.id)
        const result = await discountService.getDiscountByID(Number(req.params.id))

        res.status(result.statusCode).json(result)
    }

    createDiscount = async (req,res,next) => {
        let {discount, name} = req.body

        if(!discount || !name){
            res.status(400).json({
                type: 'error',
                statusCode: 400,
                message: 'Not enough fields'
            })
            return
        }
        discount = Number(discount)
        const result = await discountService.createDiscount(discount,name)

        res.status(result.statusCode).json(result)
    }

    updateDiscount = async (req,res,next) => {
        let {discount, name} = req.body
        let {id} = req.params

        if(!discount || !name){
            res.status(400).json({
                type: 'error',
                statusCode: 400,
                message: 'Not enough fields'
            })
        }
        discount = Number(discount)
        id = Number(id)
        const result = await discountService.updateDiscount(id,discount,name)

        res.status(result.statusCode).json(result)
    }

    deleteDiscount = async (req,res,next) => {
        const result = await discountService.deleteDiscount(Number(req.params.id))

        res.status(result.statusCode).json(result)
    }
}

export default DiscountController