const path = require('path');

const express = require('express');

const app = express();

app.use(express.static('public'));

app.get('/', (req, res) => {
  const filePath = path.join(__dirname, 'views', 'welcome.html');
  res.sendFile(filePath);
});

// Health check endpoint for ECS
app.get('/health', (req, res) => {
  res.status(200).json({ status: 'healthy' });
});

app.listen(80);