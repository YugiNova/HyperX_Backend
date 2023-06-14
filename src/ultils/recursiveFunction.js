export const getTreeCategories = (categories, parent_id) => {
    let temp_categories = [];
    categories.forEach((item, index) => { 
        if (item.parent_id === parent_id) {
            let children = getTreeCategories(categories, item.id);
            if (children.length > 0) {
                item = item.dataValues;
                item = { ...item, children };
            }
            temp_categories.push(item);
        }
        
    });
    return temp_categories;
};

export const getLeafCategories = (treeCate) => {
    let temp_categories = []
    treeCate.forEach(item => {    
        if(item.children){
            let leaf = getLeafCategories(item.children)
            if(leaf.length > 0){
                temp_categories.push(...leaf)
            }
        }else{
            // console.log(item.dataValues)
            temp_categories.push(item.dataValues)
        } 
    })

    return temp_categories
}