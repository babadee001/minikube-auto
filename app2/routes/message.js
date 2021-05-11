import express from 'express';
import MessageController from '../controllers/message';

const router = express.Router();

router.route('/').get(MessageController.reverseMessage);

export default router;
