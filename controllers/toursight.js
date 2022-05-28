import Toursight from '../models/toursight-model.js';
import { QueryTypes } from 'sequelize';
import db from '../config/database.js';
import dotenv from 'dotenv';
import Multer from 'multer';
import { Storage } from '@google-cloud/storage';

dotenv.config()

export const getAllToursight = async(req, res, next) => {
    try{
        const toursight = await Toursight.findAll({
            attributes: ['id', 'name', 'location', 'category', 'image', 'deskripsi'],
            raw: true
        });
        res.json(toursight);
    } catch (err) {
        console.log(err);
    }
};


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

export const bucket = storage.bucket(process.env.GCS_BUCKET_DUMMY);

export const uploadDummy = async (req,res) => {
    const name = req.body.name;
    const category = req.body.category;
    const location = req.body.location;
    const image = req.file.originalname
    const deskripsi = req.body.deskripsi;
    
    const blob = bucket.file("images/"+ image);
    const blobStream = blob.createWriteStream();

    blobStream.on("error", err => console.log(err));

    blobStream.on("finish", () => {
        const publicUrl = `https://storage.googleapis.com/${process.env.GCS_BUCKET_DUMMY}/${blob.name}`;
        Toursight.create({
            name: name,
            category: category,
            location: location,
            image: publicUrl,
            deskripsi: deskripsi
        })
        .then(() => res.status(201).send({ 
            message: 'Upload Success',
            name: name,
            category: category,
            location: location,
            image: publicUrl,
            deskripsi: deskripsi
        }));
    })
    blobStream.end(req.file.buffer);
}


// export const addToursight = async(req, res) => {
//     let input = {
//         name: req.body.name,
//         location: req.body.location,
//         category: req.body.category,
//         image: req.file.path,
//         deskripsi: req.body.deskripsi
//     }
//     const toursight = await Toursight.create(input)
//     res.status(200).send(toursight);
//     console.log(toursight);
// };

export const getToursightByid = async(req, res) => {
    let id = req.params.id;
    let toursight = await Toursight.findOne({
        where: {
           id : id
        }
    })
    res.status(200).send(toursight);
}

export const searchToursightByName = async(req, res) => {
    const search = req.query.keyword;
    const toursight = await db.query(
        `SELECT * FROM toursight WHERE name LIKE '%` + search + `%';`,
        {
            type: QueryTypes.SELECT,
            raw: true,
        }
    );
    res.json(toursight);
}

export const getDataByClassName = async(req, res) => {
    const getData = req.body.classname;
    const toursight = await db.query(
        `SELECT * FROM toursight WHERE name LIKE '%` + getData + `%' LIMIT 1;`,
        {
            type: QueryTypes.SELECT,
            raw: true,
        }
    );
    res.json(toursight);
}

export const getDataByCategory = async(req, res ) => {
    const category = req.query.category

    const toursight = await db.query(
        `SELECT * FROM toursight WHERE category LIKE '%` + category + `%';`,
        {
            type: QueryTypes.SELECT,
            raw: true,
        }
    )
    res.json(toursight);
}