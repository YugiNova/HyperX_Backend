import { Router } from "express";
import PromotionController from "../controller/promotion.controller.js";
import validator from "../middleware/validator.js";

const controller = new PromotionController
const router = Router()

router.get("/", controller.getPromotions)
router.get("/:id", controller.getPromotionById)
router.post("/",validator.validatePromotionInput(),controller.createPromotion)
router.patch("/:id",validator.validatePromotionInput(),controller.updatePromotion)
router.delete("/:id",controller.deletePromotion)

export default router