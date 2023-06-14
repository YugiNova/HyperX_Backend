import CategoryService from "../services/category.service.js"

const category = new CategoryService

class CategoryController {

    getAllCategory = async (req,res,next) => {
        const result = await category.getAllCategories()
        res.status(result.statusCode).json(result)
    }

    getCategoryById = async (req,res,next) => {
        const result = await category.getCategoryById(Number(req.params.id))
        res.status(result.statusCode).json(result)
    }

    getLeaftCategory = async (req,res,next) => {
        const result = await category.getLeafCategoryOfTree(Number(req.params.id))
        res.status(result.statusCode).json(result)
    }

    createCategory = async (req,res,next) => {
        const {parent_id,name} = req.body;
    
        if(!parent_id || !name){
            res.json({
                type: 'error',
                statusCode: 400,
                message: 'Not enough fields'
            })
            return;
        }

        const result = await category.createCategory(parent_id,name)

        res.status(result.statusCode).json(result)
    }

    deleteCategory = async (req,res,next) => {
        const result = await category.deleteCategory(req.params.id)

        res.status(statusCode).json(result)
    }

    updateCategory = async (req,res,next) => {
        const {parent_id,name} = req.body;

        if(!parent_id || !name){
            res.status(400).json({
                type: 'error',
                statusCode: 400,
                message: "Not enough fields"
            })
            return;
        }

        const result = await category.updateCategory(Number(req.params.id),parent_id,name)

        res.status(res.statusCode).json(result)
    }
}
export default CategoryController