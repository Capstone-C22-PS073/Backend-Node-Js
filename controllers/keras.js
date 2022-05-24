import kerasJs from 'keras-js';
import tf from '@tensorflow/tfjs';
import fs from 'fs';
import tfnode from '@tensorflow/tfjs-node';
import mobilenet from '@tensorflow-models/mobilenet';


export const loadModel = async () => {
    const handler = tfnode.io.fileSystem('keras_models/saved_model.pb');
    const model = await tf.loadLayersModel(handler);
}

    const test = tf.loadLayersModel


// const readImage = async path => {
//     const imageBuffer = fs.readFileSync(path);
//     const tfimage = tfnode.node.decodeImage(imageBuffer);
// }


// const imageClassification = async path => {
//     const image = req.file.path;
//     const mobilenetModel = await mobilenet.load({
//         modelUrl: 'file://keras_models/saved_model.pb'
//     });
//     const predictions = await mobilenetModel.classify(image);
//     console.log('Classification Results:', predictions);
// }

// if (process.argv.length !== 3) throw new Error('Incorrect arguments: node classify.js <IMAGE_FILE>');

// imageClassification(process.argv[2]);

