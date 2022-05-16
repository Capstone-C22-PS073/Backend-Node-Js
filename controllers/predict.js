import tfnode from '@tensorflow/tfjs-node';
import mobilenet from '@tensorflow-models/mobilenet';
import fs from 'fs';



const loadModel = async () => {
    const mn = new mobilenet.MobileNet(1, 1);
    mn.path = `file://${path}`;
    await mn.load();
    return mn;
}


const classify = async (imagePath) => {
  const image = req.file.path;
  const decodedImage = tfnode.node.decodeImage(image, 3);
  const model = await mobilenet.load();
  const predictions = await model.classify(decodedImage);
  console.log('predictions:', predictions);
}

if (process.argv.length !== 3) 
    throw new Error('Usage: node test-tf.js <image-file>')

classify(process.argv[2])