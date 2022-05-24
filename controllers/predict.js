import tfnode from '@tensorflow/tfjs-node';
import tf, { topk } from '@tensorflow/tfjs';
import mobilenet from '@tensorflow-models/mobilenet';
import fs from 'fs';
// import path from 'path';
// import Landmark from '../models/landmark-model.js';


// export const makePredictions = async (req, res, next) => {
//   const imagePath = './upload/predict-image.jpg';
//   try {
//     const loadModel = async (img) => {
//       const output = {};
//       // laod model
//       console.log('Loading.......')
//       const model = await mobilenet.load({
//         modelUrl: "file://keras_models/saved_model.pb"
//       });
//       // classify
//       output.predictions = await model.classify(img,{
//         topk: 1,
//       });
//       console.log(output);
//       res.statusCode = 200;
//       res.json(output);
//     };
//     await image(imagePath, async (err, imageData) => {
//       // pre-process image
//       const numChannels = 3;
//       const numPixels = imageData.width * imageData.height;
//       const values = new Int32Array(numPixels * numChannels);
//       const pixels = imageData.data;
//       for (let i = 0; i < numPixels; i++) {
//         for (let channel = 0; channel < numChannels; ++channel) {
//           values[i * numChannels + channel] = pixels[i * 4 + channel];
//         }
//       }
//       const outShape = [imageData.height, imageData.width, numChannels];
//       const input = tf.tensor3d(values, outShape, 'int32');
//       await loadModel(input);

//       // delete image file
//       fs.unlinkSync(imagePath, (error) => {
//         if (error) {
//           console.error(error);
//         }
//       });
//     });
//   } catch (error) {
//     console.log(error)
//   }
// };





export const getInfoByImg = async(req,res) => {
  const imagePath = "upload/predict-image.jpg";
  try{
      // const image = req.file.path;
      const imageBuffer = fs.readFile(image);
      const tfimage = tfnode.node.decodeImage(imageBuffer);
      const model = await mobilenet.load({
        modelUrl: 'file://keras_models/saved_model.pb'
      });
      const results = await model.classify(tfimage);
      const ClassHProb = results.reduce(function(prev, current) {
        return (prev.probability > current.probability) ? prev : current;
      })["className"];
      res.json(results);
      const toursight = await db.query(
        `SELECT * FROM toursight WHERE name LIKE '%` + ClassHProb + `%';`,
        {
            type: QueryTypes.SELECT,
            raw: true,
        }
      );
      // res.json(toursight);
      // delete image file 
      fs.unlinkSync(imagePath, (err) => {
        if (err) {
          console.log(err);
        }
      });
  } catch (err) {
    // res.json({ message: err });
  }
}

getInfoByImg(process.argv[2]);


      // const output = {};
      // output.predictions = await model.classify(tfimage);
      // console.log(output);
      // res.statusCode = 200;
      // res.json(output);
    



// const loadModel = async () => {
//     const mn = new mobilenet.MobileNet(1, 1);
//     mn.path = `file://${path}`;
//     await mn.load();
//     return mn;
// }


// const classifyImage = async (imagePath) => {
//   const image = req.file.path;
//   const decodedImage = tfnode.node.decodeImage(image, 3);
//   const model = await mobilenet.load();
//   const predictions = await model.classify(decodedImage);
//   console.log('predictions:', predictions);
// }

// if (process.argv.length !== 3) 
//     throw new Error('Usage: node test-tf.js <image-file>')

// classify(process.argv[2])