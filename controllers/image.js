import Multer from 'multer';
import { Storage } from '@google-cloud/storage';
import dotenv from 'dotenv';
import Images from '../models/image.js';


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
        const image = await Images.findAll({
            attributes: ["id", "image"]
        });
        res.json(image);
    } catch (err) {
        console.log(err);
    }
}