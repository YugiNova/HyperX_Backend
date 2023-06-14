import { Router } from "express";
import ProductController from "../controller/product.controller.js";
import validator from "../middleware/validator.js";

const controller = new ProductController;
const router = Router();

router.get("/",controller.getProducts)
router.get("/:id", controller.getProductDetail);
router.post("/",validator.validateProductInput(),controller.createProduct)
router.patch("/:id",validator.validateProductInput(),controller.updateProduct)
router.delete("/:id", controller.deleteProduct)

export default router
