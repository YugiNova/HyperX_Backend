import { body, check } from "express-validator"


let validatePromotionInput = () => {
    return [
        body('name','Name does not empty').not().isEmpty(),
        body('code').not().isEmpty(),
        body('description').not().isEmpty(),
        body('discount_id').not().isEmpty(),
        body('type').not().isEmpty(),
    ]
}

let validateProductInput = () => {   
    return [
        body('sku').not().isEmpty(),
        body('name').not().isEmpty(),
        body('price').not().isEmpty(),
        body('short_desc').not().isEmpty(),
        body('long_desc').not().isEmpty(),
        body('discount_id').not().isEmpty(),
        body('promotion_id').not().isEmpty(),
        body('category_id').not().isEmpty(),
    ]
}

let validator = {
    validatePromotionInput: validatePromotionInput,
    validateProductInput : validateProductInput
}

export default validator