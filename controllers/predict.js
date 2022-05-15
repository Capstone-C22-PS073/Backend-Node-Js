import tf from '@tensorflow/tfjs';
import tf from '@tensorflow/tfjs-node';

export const predictLandmark = () => {
    const model = await tf.loadLayersModel('gs://training-models/model.json');
    const output = model.predict(example)
};