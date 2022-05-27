import { Router } from 'express';
import { getUsers, Login, Register, Logout } from '../controllers/users.js';
import { verifyToken } from '../middlewares/VerifyToken.js';
import { refreshToken } from '../controllers/refreshToken.js';
import { addToursight, getAllToursight, getDataByCategory, getDataByClassName, getToursightByid, searchToursightByName } from '../controllers/toursight.js';
import { uploadImg, uploadLoader } from '../middlewares/Multer.js';
import { multer, bucket, getAllImgByUser, getImageByid, getUploadedImageByIduser, uploadByUser } from '../controllers/image.js';
import Images from '../models/image.js';
// import { getInfoByImg } from '../controllers/predict.js';



const router = Router();

// Auth Register and Login
router.post('/users', Register);
router.post('/login', Login);
router.get('/token', refreshToken);
router.get('/users', verifyToken, getUsers);
router.delete('/logout', verifyToken, Logout);


// Upload Dummy Data
router.post('/dummy', uploadImg, addToursight);


// Resource User
router.get('/toursight', verifyToken, getAllToursight); //homepage setelah login tampilkan toursight
router.get('/toursight/:id', verifyToken, getToursightByid); // menampilkan data berdasarkan id
router.get('/search', verifyToken, searchToursightByName); // search toursight berdasarkan nama
router.get('/getdatabyimg', verifyToken, getDataByClassName); //search dengan menampilkan satu data dari classname
router.get('/category', verifyToken, getDataByCategory);

// Upload Image untuk temporary image recognition

// router.post('/tmp', verifyToken, uploadLoader, (req, res) => {
//     const image = req.file;
//     res.json({
//         message: 'Upload Success',
//         result: image
//     });
// });



router.post('/image', verifyToken, multer.single('image'), uploadByUser);

router.get('/image', verifyToken, getAllImgByUser);
router.get('/image/:id', verifyToken, getImageByid);
router.get('/imageuser', verifyToken, getUploadedImageByIduser);

// router.post('/predict', getInfoByImg);

export default router;

