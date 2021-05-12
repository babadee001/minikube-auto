import express from 'express';

import MessageRouter from './routes/message';


const app = express();


app.use('/', MessageRouter);

const port = process.env.PORT || 5000;


app.get('*', (req, res) => {
  res.status(404).send({
    message: 'This route doesnt exist.'
  });
});

app.listen(port, () => {
  console.log('App listening on port', port);
});
