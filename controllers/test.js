import tfnode from '@tensorflow/tfjs-node';
// import tf from '@tensorflow/tfjs';
import mobilenet from '@tensorflow-models/mobilenet';
import fs from 'fs';

const readImage = (path) => {
    // read the entire content of a file
    const imageBuffer = fs.readFileSync(path);
    const tfimage = tfnode.node.decodeImage(imageBuffer);
    return tfimage;
};

const imageClassification = async path => {
    const image = readImage(path);

    const model = await mobilenet.load({
        modelUrl: 'file://keras_models/saved_model.pb'
    });
    const predictions = await model.classify(image);
    return predictions;
}

export const classifyimg = async(req, res) => {
    const predictions = await imageClassification('upload/predict-image.jpg');
    if(predictions){
        let result = {
            class: predictions[0].className,
            probability: predictions[0].probability
        }
        res.json(result);
    }
}


