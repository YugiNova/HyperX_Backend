import { where } from "sequelize";
import { Category } from "../models/category.model.js";
import moment from "moment/moment.js";
import { getLeafCategories, getTreeCategories } from "../../ultils/recursiveFunction.js";

class CategoryService {
    getAllCategories = async () => {
        try {
            let categories = await Category.findAll();
            const result = getTreeCategories(categories, 0);
            return {
                type: "success",
                statusCode: 200,
                message: "Get all product successfull",
                data: result,
            };
        } catch (error) {
            return {
                type: "error",
                statusCode: 500,
                message: error.message,
            };
        }
    };

    getCategoryById = async (category_id) => {
        try {
            let categories = await Category.findAll();
            let category = await Category.findOne({
                where: {
                    id: category_id,
                },
            });
            category = category.dataValues;
            let children = getTreeCategories(categories, category_id);
            const result = {
                ...category,
                children : children,
            };
            return {
                type: "success",
                statusCode: 200,
                message: "Get category successfull",
                data: result,
            };
        } catch (error) {
            return {
                type: "error",
                statusCode: 500,
                message: error.message,
            };
        }
    };

    getLeafCategoryOfTree = async (category_id) => {
        let treeCate = []
        if(category_id === 0){
            treeCate = await this.getAllCategories()
            treeCate = treeCate.data
        }else{
            treeCate = await this.getCategoryById(category_id);
            treeCate = treeCate.data.children
        }

        // treeCate = await this.getCategoryById(category_id);

        if(treeCate.type === 'error'){
            return treeCate
        }
        // console.log(treeCate.data.children)
        let leafCate = getLeafCategories(treeCate)
        return {
            type: 'success',
            statusCode: 200,
            message: 'Get all leaf of category successfull',
            data: leafCate
        }
    }

    createCategory = async (parent_id, name) => {
        let checkName = await Category.findOne({
            where: {
                name: name,
            },
        });
        if (checkName !== null) {
            return {
                type: "error",
                statusCode: 500,
                message: `Category's name already exists`,
            };
        }

        try {
            let category = await Category.create({
                parent_id: parent_id,
                name: name,
            });
            return {
                type: "success",
                statusCode: 200,
                message: `Create category successfull`,
                data: category.id,
            };
        } catch (error) {
            return {
                type: "error",
                statusCode: 500,
                message: error.message,
            };
        }
    };

    deleteCategory = async (id) => {
        let category = await Category.destroy({
            where: {
                id: id,
            },
        });

        if (category === 0) {
            return {
                type: "error",
                statusCode: 500,
                message: "Category not found",
            };
        }

        let subCatgory = await Category.update(
            {
                parent_id: null,
            },
            {
                where: {
                    parent_id: id,
                },
            }
        );

        return {
            type: "success",
            statusCode: 200,
            message: "Delete category successfull",
        };
    };

    updateCategory = async (id, parent_id, name) => {
        try {
            const result = Category.update(
                {
                    parent_id: parent_id,
                    name: name,
                    modified_at: moment().format(),
                },
                {
                    where: { id: id },
                }
            );

            return {
                type: "success",
                statusCode: 200,
                message: "Update category successfull",
                data: result,
            };
        } catch (error) {
            return {
                type: "error",
                statusCode: 500,
                message: error.message,
            };
        }
    };
}

export default CategoryService;
