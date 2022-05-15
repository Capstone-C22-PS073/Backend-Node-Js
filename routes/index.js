import { Router } from 'express';
import { getUsers, Login, Register, Logout } from '../controllers/users.js';
import { verifyToken } from '../middlewares/VerifyToken.js';
import { refreshToken } from '../controllers/refreshToken.js';
import { addLandmark, getAllLandmark, getLandmarkByid } from '../controllers/landmark.js';
import { upload } from '../middlewares/Multer.js';


const router = Router();

// Auth
router.post('/users', Register);
router.post('/login', Login);
router.get('/token', refreshToken);
router.get('/users', verifyToken, getUsers);
router.delete('/logout', Logout);


// Upload Data
router.post('/landmark', upload, addLandmark);


// Resource User
router.get('/landmark', verifyToken, getAllLandmark);
router.get('/landmark/:id',verifyToken, getLandmarkByid);

export default router;

// verify token digunakan untuk akses source oleh users setelah login