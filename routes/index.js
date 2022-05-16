import { Router } from 'express';
import { getUsers, Login, Register, Logout } from '../controllers/users.js';
import { verifyToken } from '../middlewares/VerifyToken.js';
import { refreshToken } from '../controllers/refreshToken.js';
import { addLandmark, getAllLandmark, getLandmarkByid } from '../controllers/landmark.js';
import { uploadImg, uploadLoader } from '../middlewares/Multer.js';
// import { classifyImage } from '../controllers/predict.js';


const router = Router();

// Auth Register and Login
router.post('/users', Register);
router.post('/login', Login);
router.get('/token', refreshToken);
router.get('/users', verifyToken, getUsers);
router.delete('/logout', Logout);


// Upload Dummy Data
router.post('/landmark', uploadImg, addLandmark);



// Resource User
router.get('/landmark', verifyToken, getAllLandmark);
router.get('/landmark/:id', verifyToken, getLandmarkByid);
// Upload Image to procces image recognition
// router.post('/upload', uploadLoader, classifyImage);

export default router;

