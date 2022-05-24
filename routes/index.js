import { Router } from 'express';
import { getUsers, Login, Register, Logout } from '../controllers/users.js';
import { verifyToken } from '../middlewares/VerifyToken.js';
import { refreshToken } from '../controllers/refreshToken.js';
import { addToursight, getAllToursight, getToursightByid, searchToursightByName } from '../controllers/toursight.js';
import { uploadImg, uploadLoader } from '../middlewares/Multer.js';
import { getInfoByImg } from '../controllers/predict.js';



const router = Router();

// Auth Register and Login
router.post('/users', Register);
router.post('/login', Login);
router.get('/token', refreshToken);
router.get('/users', verifyToken, getUsers);
router.delete('/logout', Logout);


// Upload Dummy Data
router.post('/dummy', uploadImg, addToursight);


// Resource User
router.get('/toursight', verifyToken, getAllToursight);
router.get('/toursight/:id', verifyToken, getToursightByid);
router.get('/search', verifyToken, searchToursightByName);

// Upload Image to procces image recognition
router.post('/upload', uploadLoader, (req, res) => {
    const image = req.file;
    res.json({
        message: 'Upload Success',
        result: image
    });
});
router.post('/predict', getInfoByImg);

export default router;

