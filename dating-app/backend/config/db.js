const mongoose = require('mongoose');

// MongoDB connection (update with your own credentials)
mongoose.connect('mongodb://localhost:27017/dating-app', {
  useNewUrlParser: true,
  useUnifiedTopology: true,
})
  .then(() => console.log('MongoDB connected'))
  .catch(err => console.error('MongoDB connection error:', err));

module.exports = mongoose;
