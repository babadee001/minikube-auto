import express from 'express';

const app = express();


const port = process.env.PORT || 3000;

app.get('/', (req, res) => {
  res.status(200).send({
    "id": "1", 
    "message": "Hello world"
  });
});

app.get('*', (req, res) => {
  res.status(404).send({
    message: 'This route doesnt exist.'
  });
});

app.listen(port, () => {
  console.log('App listening on port', port);
});
