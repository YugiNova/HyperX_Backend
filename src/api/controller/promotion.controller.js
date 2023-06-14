import { validationResult } from "express-validator";
import { PromotionService } from "../services/promotion.service.js";

const promotionService = new PromotionService();

class PromotionController {
    getPromotions = async (req, res, next) => {
        const result = await promotionService.getPromotions(req.query);
        res.status(result.statusCode).json(result);
    };

    getPromotionById = async (req, res, next) => {
        const result = await promotionService.getPromotionById(Number(req.params.id));
        res.status(result.statusCode).json(result);
    };

    createPromotion = async (req, res, next) => {
        let error = validationResult(req);
        if (!error.isEmpty()) {
            res.json({
                type: "error",
                statusCode: 400,
                message: error.array(),
            });
            return;
        }
        const result = await promotionService.createPromotion(req.body);
        res.status(result.statusCode).json(result);
    };

    updatePromotion = async (req, res, next) => {
        const error = validationResult(req)
        if(!error.isEmpty()){
            result.json({
                type: "error",
                statusCode: 400,
                message: error.array(),
            });
        }
        const result = await promotionService.updatePromotion(
            Number(req.params.id),
            req.body
        );
        res.status(result.statusCode).json(result);
    };

    deletePromotion = async (req, res, next) => {
        const result = await promotionService.deletePromotion(Number(req.params.id));
        res.status(result.statusCode).json(result);
    };
}

export default PromotionController;
