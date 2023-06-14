import { Op } from "sequelize"

export const ObjectArrayToArray = (array, atributes) => {
    const result = array.map((item) => {
        return item[atributes];
    });

    return result;
};

export const convertQueryParams = ({page, limit, order, ...find}) => {
    let queries = {};
    const pageCheck = page || +process.env.DEFAULT_PAGE
    const offset = pageCheck-1
    const fLimit = +limit || +process.env.DEFAULT_LIMIT;
    queries.offset = offset * fLimit;
    queries.limit = fLimit;
    queries.order = [order || [process.env.DEFAULT_ORDER_FIELD, process.env.DEFAULT_ORDER]];
    
    if(Object.keys(find).length > 0){
        let convertFind = Object.entries(find);
        convertFind[0][1] = { [Op.substring]: convertFind[0][1] };
        convertFind = Object.fromEntries(convertFind);
        // console.log(convertFind);
        queries.where = convertFind
    }
    
    return queries
};
