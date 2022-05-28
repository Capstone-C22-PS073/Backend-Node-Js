import Multer from 'multer';
import { Storage } from '@google-cloud/storage';
import dotenv from 'dotenv';
import Images from '../models/image.js';
import db from '../config/database.js';
import { QueryTypes } from 'sequelize';


dotenv.config()

export const storage = new Storage({
    projectId: process.env.GCLOUD_PROJECT, 
    credentials: {
        client_email: process.env.GCLOUD_CLIENT_EMAIL,
        private_key: process.env.GCLOUD_PRIVATE_KEY,
    }
})

export const multer = Multer({
    storage: Multer.memoryStorage(),
    limits: { 
        fileSize: '5 * 1024 * 1024'
    }
})

export const bucket = storage.bucket(process.env.GCS_BUCKET);

export const uploadByUser = async (req,res) => {
    const username = req.body.username
    const newFileName = Date.now() + "-" + req.file.originalname;
    const blob = bucket.file(newFileName);
    const blobStream = blob.createWriteStream();

    blobStream.on("error", err => console.log(err));

    blobStream.on("finish", () => {
        const publicUrl = `https://storage.googleapis.com/${process.env.GCS_BUCKET}/${blob.name}`;
        // res.json({ 
        //     message: 'upload success',
        //     data: publicUrl
        // });
        
        Images.create({
            uploadedBy: username,
            image: publicUrl
        })
        .then(() => res.status(201).send({ 
            message: 'Upload Success',
            uploadedBy: username,
            image: publicUrl
        }));
    })
    blobStream.end(req.file.buffer);
}

export const getUploadedImageByIduser = async(req, res) => {
    const username = req.query.username;
    const images = await db.query(
        `SELECT * FROM user_image WHERE uploadedBy ='` + username + `';`,
        {
            type: QueryTypes.SELECT,
            raw: true,
        }
    );
    if (images){
        res.status(200).json(images);
    } else {
        res.status(200).json({ message: "No Images Uploaded"});
    }
    
}


export const getImageByid = async(req, res) => {
    let id = req.params.id;
    let image = await Images.findOne({
        where: {
           id : id
        }
    })
    res.status(200).send(image);
}

export const getAllImgByUser = async(req, res) => {
    try{
        const image = await Images.findAll();
        res.json(image);
    } catch (err) {
        console.log(err);
    }
}

// export const getUploadedImageByIduser = async(req, res) => {
//     let userId = req.params.userId;
//     let image = await Images.findAll({
//         where:{
//             userId: userId
//         }
//     });
//     res.status(200).send(image);
// }