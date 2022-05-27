import bcrypt from 'bcryptjs';
import Users from '../models/user-model.js';
import jwt from 'jsonwebtoken';


export const getUsers = async(req, res) => {
    try {
        const users = await Users.findAll({
            attributes: ['id', 'username', 'email']
        });
        res.json(users);
    } catch (err) {
        console.log(err);
    }
}

export const Register = async(req, res) => {
    const { username, email, password } = req.body;
    // if(password !== confPassword) return res.status(400).json({msg: "Password tidak sama dengan confirm password"});
    const salt = await bcrypt.genSalt();
    const hashPassword = await bcrypt.hash(password, salt);
    const usernameExists = await Users.findOne({
        where:{
            username: username 
        }
    })
    const emailExists = await Users.findOne({
        where:{
            email: email
        }
    });

    try{
        if( usernameExists ){
            res.status(409).json("Username is already used");
        }
        if( emailExists ){
            res.status(409).json("Email is already registered");
        }

        await Users.create({
            username: username,
            email: email,
            password: hashPassword
        });
        res.status(201).json({msg: "Register Berhasil"});
    } catch (err){
        console.log(err);
    }
}

export const Login = async(req,res) => {
    try {
        const user = await Users.findAll({
            where:{
                email:req.body.email
            }
        });
        const match = await bcrypt.compare(req.body.password, user[0].password);
        if(!match) {
            return res.status(400).json({msg:"Wrong Password"});
        }
        const id = user[0].id;
        const username = user[0].username;
        const email = user[0].email;
        const accessToken = jwt.sign({id, username, email}, process.env.ACCESS_TOKEN_SECRET, {
            expiresIn: '1200s'
        });
        const refreshToken = jwt.sign({id, username, email}, process.env.REFRESH_TOKEN_SECRET, {
            expiresIn: '1d'
        });
        await Users.update({refresh_token:refreshToken},{
            where:{
                id: id
            }
        });
        res.cookie('refreshToken', refreshToken, {
            httpOnly:true,
            maxAge: 24 * 60 * 60 * 1000 
            // secure: true, //untuk server yang ada ssl
        });
        res.status(201).json({ id, username, email, accessToken });
    } catch (err) {
        res.status(404).json({msg: "Email tidak ditemukan"});
    }
}

export const Logout = async(req, res) => {
    const refreshToken = req.cookies.refreshToken;
    if(!refreshToken) return res.sendStatus(204);
    const user = await Users.findAll({
        where: {
            refresh_token: refreshToken
        }
    });
    if(!user[0]) return res.sendStatus(204); 
    const userId = user[0].id;
    await Users.update({ refresh_token: null}, {
        where:{
            id: userId
        }
    });
    res.clearCookie('refreshToken');
    return res.sendStatus(200);
}