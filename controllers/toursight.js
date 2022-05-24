import Toursight from '../models/toursight-model.js';
import { Op, QueryTypes, Sequelize } from 'sequelize';
import db from '../config/database.js';

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

export const addToursight = async(req, res) => {
    let input = {
        name: req.body.name,
        location: req.body.location,
        category: req.body.category,
        image: req.file.path,
        deskripsi: req.body.deskripsi
    }
    const toursight = await Toursight.create(input)
    res.status(200).send(toursight);
    console.log(toursight);
};

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
    const getData = req.query.classname;
    const toursight = await db.query(
        `SELECT * FROM toursight WHERE name LIKE '%` + getData + `%' LIMIT 1;`,
        {
            type: QueryTypes.SELECT,
            raw: true,
        }
    );
    res.json(toursight);
}

