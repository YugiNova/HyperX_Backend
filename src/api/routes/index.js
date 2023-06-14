import { Router } from "express";
import categoryRoute from "./category.route.js";
import productRoute from "./product.route.js";
import discountRoute from "./discount.route.js";
import promotionRoute from "./promotion.route.js";

const router = Router();

router.use("/category", categoryRoute)

router.use("/product", productRoute)

router.use("/discount", discountRoute)

router.use("/promotion", promotionRoute)

export default router