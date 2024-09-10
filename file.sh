#!/bin/bash

# Create the root directory if it doesn't exist
mkdir -p dating-app/backend dating-app/frontend dating-app/frontend/public dating-app/frontend/src dating-app/backend/config dating-app/backend/models dating-app/backend/routes

# Backend app.js
cat <<EOL > dating-app/backend/app.js
const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const mongoose = require('mongoose');
const authRoutes = require('./routes/auth');
const userRoutes = require('./routes/users');
const matchRoutes = require('./routes/matches');
const messageRoutes = require('./routes/messages');

// Create Express app
const app = express();
app.use(cors());
app.use(bodyParser.json());

// Connect to MongoDB (update with your own credentials)
mongoose.connect('mongodb://localhost:27017/dating-app', {
  useNewUrlParser: true,
  useUnifiedTopology: true,
});

// Define routes
app.use('/api/auth', authRoutes);
app.use('/api/users', userRoutes);
app.use('/api/matches', matchRoutes);
app.use('/api/messages', messageRoutes);

// Start the server
const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(\`Server is running on port \${PORT}\`);
});
EOL

# Backend config/db.js
cat <<EOL > dating-app/backend/config/db.js
const mongoose = require('mongoose');

// MongoDB connection (update with your own credentials)
mongoose.connect('mongodb://localhost:27017/dating-app', {
  useNewUrlParser: true,
  useUnifiedTopology: true,
})
  .then(() => console.log('MongoDB connected'))
  .catch(err => console.error('MongoDB connection error:', err));

module.exports = mongoose;
EOL

# Backend models/User.js
cat <<EOL > dating-app/backend/models/User.js
const mongoose = require('mongoose');

const UserSchema = new mongoose.Schema({
  username: { type: String, required: true },
  email: { type: String, required: true },
  password: { type: String, required: true },
  // Add other user fields as needed
});

const User = mongoose.model('User', UserSchema);
module.exports = User;
EOL

# Backend models/Match.js
cat <<EOL > dating-app/backend/models/Match.js
const mongoose = require('mongoose');

const MatchSchema = new mongoose.Schema({
  user1: { type: mongoose.Schema.Types.ObjectId, ref: 'User', required: true },
  user2: { type: mongoose.Schema.Types.ObjectId, ref: 'User', required: true },
  // Add other match fields as needed
});

const Match = mongoose.model('Match', MatchSchema);
module.exports = Match;
EOL

# Backend models/Message.js
cat <<EOL > dating-app/backend/models/Message.js
const mongoose = require('mongoose');

const MessageSchema = new mongoose.Schema({
  sender: { type: mongoose.Schema.Types.ObjectId, ref: 'User', required: true },
  receiver: { type: mongoose.Schema.Types.ObjectId, ref: 'User', required: true },
  content: { type: String, required: true },
  timestamp: { type: Date, default: Date.now },
});

const Message = mongoose.model('Message', MessageSchema);
module.exports = Message;
EOL

# Backend routes/auth.js
cat <<EOL > dating-app/backend/routes/auth.js
const express = require('express');
const router = express.Router();

// Define authentication routes
router.post('/login', (req, res) => {
  // Handle login
});

router.post('/register', (req, res) => {
  // Handle registration
});

module.exports = router;
EOL

# Backend routes/users.js
cat <<EOL > dating-app/backend/routes/users.js
const express = require('express');
const router = express.Router();

// Define user-related routes
router.get('/', (req, res) => {
  // Handle fetching users
});

router.get('/:id', (req, res) => {
  // Handle fetching a specific user
});

module.exports = router;
EOL

# Backend routes/matches.js
cat <<EOL > dating-app/backend/routes/matches.js
const express = require('express');
const router = express.Router();

// Define match-related routes
router.get('/', (req, res) => {
  // Handle fetching matches
});

module.exports = router;
EOL

# Backend routes/messages.js
cat <<EOL > dating-app/backend/routes/messages.js
const express = require('express');
const router = express.Router();

// Define message-related routes
router.get('/', (req, res) => {
  // Handle fetching messages
});

module.exports = router;
EOL

# Frontend public/index.html
cat <<EOL > dating-app/frontend/public/index.html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Dating App</title>
</head>
<body>
  <div id="root"></div>
</body>
</html>
EOL

# Frontend src/index.js
cat <<EOL > dating-app/frontend/src/index.js
import React from 'react';
import ReactDOM from 'react-dom';
import App from './App';

ReactDOM.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
  document.getElementById('root')
);
EOL

# Frontend src/App.js
cat <<EOL > dating-app/frontend/src/App.js
import React from 'react';
import Login from './components/Login';

function App() {
  return (
    <div className="App">
      <Login />
    </div>
  );
}

export default App;
EOL

# Frontend src/components/Login.js
cat <<EOL > dating-app/frontend/src/components/Login.js
import React, { useState } from 'react';

function Login() {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');

  const handleSubmit = (e) => {
    e.preventDefault();
    // Handle login
  };

  return (
    <div>
      <h2>Login</h2>
      <form onSubmit={handleSubmit}>
        <label>
          Username:
          <input type="text" value={username} onChange={(e) => setUsername(e.target.value)} />
        </label>
        <br />
        <label>
          Password:
          <input type="password" value={password} onChange={(e) => setPassword(e.target.value)} />
        </label>
        <br />
        <button type="submit">Login</button>
      </form>
    </div>
  );
}

export default Login;
EOL

# Frontend src/components/Profile.js
cat <<EOL > dating-app/frontend/src/components/Profile.js
import React from 'react';

function Profile() {
  return (
    <div>
      <h2>Profile</h2>
      {/* Profile content */}
    </div>
  );
}

export default Profile;
EOL

# Frontend src/components/Swipe.js
cat <<EOL > dating-app/frontend/src/components/Swipe.js
import React from 'react';

function Swipe() {
  return (
    <div>
      <h2>Swipe</h2>
      {/* Swipe functionality */}
    </div>
  );
}

export default Swipe;
EOL

# Frontend src/components/MatchList.js
cat <<EOL > dating-app/frontend/src/components/MatchList.js
import React from 'react';

function MatchList() {
  return (
    <div>
      <h2>Match List</h2>
      {/* Match list */}
    </div>
  );
}

export default MatchList;
EOL

# Frontend src/components/Chat.js
cat <<EOL > dating-app/frontend/src/components/Chat.js
import React from 'react';

function Chat() {
  return (
    <div>
      <h2>Chat</h2>
      {/* Chat functionality */}
    </div>
  );
}

export default Chat;
EOL

echo "All files have been populated with content."
