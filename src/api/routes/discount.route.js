import { Router } from "express";
import DiscountController from "../controller/discount.controller.js";

const router = Router();
const controller = new DiscountController

router.get("/", controller.getAllDiscount)
router.get("/:id",controller.getDiscountByID)
router.post("/",controller.createDiscount)
router.patch('/:id',controller.updateDiscount)
router.delete('/:id',controller.deleteDiscount)

export default router