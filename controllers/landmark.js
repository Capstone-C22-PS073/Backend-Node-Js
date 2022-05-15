import Landmark from '../models/landmark-model.js';

export const getAllLandmark = async(req, res, next) => {
    try{
        const landmark = await Landmark.findAll({
            attributes: ['id_landmark', 'landmark_name', 'location', 'category', 'image', 'deskripsi']
        });
        res.json(landmark);
    } catch (err) {
        console.log(err);
    }
};

export const addLandmark = async(req, res, next ) => {
    let input = {
        landmark_name: req.body.landmark_name,
        location: req.body.location,
        category: req.body.category,
        image: req.file.path,
        deskripsi: req.body.deskripsi
    }
    const landmark = await Landmark.create(input)
    res.status(200).send(landmark);
    console.log(landmark);
};

export const getLandmarkByid = async(req, res, next) => {
    let id = req.params.id;
    let landmark = await Landmark.findOne({
        where: {
           id_landmark : id
        }
    })
    res.status(200).send(landmark);
}


