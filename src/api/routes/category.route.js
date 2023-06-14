import { Router } from "express";
import CategoryController from "../controller/category.controller.js";

const controller = new CategoryController

const router = Router();

router.get("/", controller.getAllCategory);

router.get("/getleaf/:id",controller.getLeaftCategory)

router.get("/:id", controller.getCategoryById);

router.post("/", controller.createCategory);

router.delete('/:id', controller.deleteCategory);

router.patch('/:id', controller.updateCategory);

export default router