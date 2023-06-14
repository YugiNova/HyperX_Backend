import multer from "multer";
import cloudinary from "../config/cloudinary.config.js";
import { CloudinaryStorage } from "multer-storage-cloudinary";
import path from "path";
import { Router } from "express";

const router = Router();

const storage = multer.memoryStorage();

export const multerUpload = multer({ storage: storage });

export const uploadCloud = async (file, options) => {
    const res = await cloudinary.v2.uploader.upload(file, options);

    return res;
};

export const removeCloud = async (public_id, options) => {
    const res = await cloudinary.v2.uploader.destroy(public_id, options);

    return res.result;
};

router.use(
    multerUpload.fields([{ name: "image" }, { name: "data" }]),
    async (req, res, next) => {
        try {
            const b64 = Buffer.from(req.files.image[0].buffer).toString(
                "base64"
            );
            let dataURI =
                "data:" + req.files.image[0].mimetype + ";base64," + b64;

            const cldRes = await uploadCloud(dataURI, {
                resource_type: "auto",
                folder: "hyperx",
                public_id:
                    Date.now().toString() +
                    req.files.image[0].originalname.split(".")[0],
            });
            req.body.data = JSON.parse(req.body.data);
            req.body.data = { ...req.body.data, image_url:cldRes.url, image_public_id: cldRes.public_id};
            next();
        } catch (error) {
            res.json({
                type: "error",
                statusCode: 500,
                message: error.message,
            });
        }
    }
);

// class Uploader {
//     constructor() {
//         this.router = Router()
//         this.storage = multer.memoryStorage()
//         this.uploader = multer({ storage: storage });
//     }

//     uploadCloud = async (file, options) => {
//         const res = await cloudinary.v2.uploader.upload(file, options);

//         return res;
//     };

//     removeCloud = async (file, options) => {
//         const res = cloudinary.v2.uploader.destroy(public_id, options);

//         return res;
//     };

//     upload = this.router.use(uploader.single("image"), async (req, res, next) => {
//         try {
//             const b64 = Buffer.from(req.file.buffer).toString("base64");
//             let dataURI = "data:" + req.file.mimetype + ";base64," + b64;

//             const cldRes = await this.uploadCloud(dataURI, {
//                 resource_type: "auto",
//                 folder: "hyperx",
//                 public_id:
//                     Date.now().toString() + req.file.originalname.split(".")[0],
//             });
//             res.json(cldRes.url);
//         } catch (error) {
//             res.json({
//                 type: "error",
//                 statusCode: 500,
//                 message: error.message,
//             });
//         }
//     });
// }

export default router;
