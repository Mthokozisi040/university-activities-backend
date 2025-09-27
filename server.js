// server.js
const express = require('express');
const cors = require('cors');
const { Pool } = require('pg');
require('dotenv').config();

const app = express();
const PORT = process.env.PORT || 5000;

// Middleware
app.use(cors());
app.use(express.json());

// Database connection
const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
  ssl: process.env.NODE_ENV === 'production' ? { rejectUnauthorized: false } : false
});

// Test database connection
pool.connect((err, client, release) => {
  if (err) {
    console.error('Error connecting to the database:', err.stack);
  } else {
    console.log('Connected to PostgreSQL database');
    release();
  }
});

// API Routes

// GET all sports
app.get('/api/sports', async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM activities WHERE category = $1 ORDER BY name', ['sports']);
    res.json(result.rows);
  } catch (error) {
    console.error('Error fetching sports:', error);
    res.status(500).json({ error: 'Internal server error' });
  }
});

// GET single sport by ID
app.get('/api/sports/:id', async (req, res) => {
  try {
    const { id } = req.params;
    const result = await pool.query('SELECT * FROM activities WHERE id = $1 AND category = $2', [id, 'sports']);
    
    if (result.rows.length === 0) {
      return res.status(404).json({ error: 'Sport not found' });
    }
    
    res.json(result.rows[0]);
  } catch (error) {
    console.error('Error fetching sport:', error);
    res.status(500).json({ error: 'Internal server error' });
  }
});

// GET all societies
app.get('/api/societies', async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM activities WHERE category = $1 ORDER BY name', ['societies']);
    res.json(result.rows);
  } catch (error) {
    console.error('Error fetching societies:', error);
    res.status(500).json({ error: 'Internal server error' });
  }
});

// GET single society by ID
app.get('/api/societies/:id', async (req, res) => {
  try {
    const { id } = req.params;
    const result = await pool.query('SELECT * FROM activities WHERE id = $1 AND category = $2', [id, 'societies']);
    
    if (result.rows.length === 0) {
      return res.status(404).json({ error: 'Society not found' });
    }
    
    res.json(result.rows[0]);
  } catch (error) {
    console.error('Error fetching society:', error);
    res.status(500).json({ error: 'Internal server error' });
  }
});

// GET all political structures
app.get('/api/political-structures', async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM activities WHERE category = $1 ORDER BY name', ['political-structures']);
    res.json(result.rows);
  } catch (error) {
    console.error('Error fetching political structures:', error);
    res.status(500).json({ error: 'Internal server error' });
  }
});

// GET single political structure by ID
app.get('/api/political-structures/:id', async (req, res) => {
  try {
    const { id } = req.params;
    const result = await pool.query('SELECT * FROM activities WHERE id = $1 AND category = $2', [id, 'political-structures']);
    
    if (result.rows.length === 0) {
      return res.status(404).json({ error: 'Political structure not found' });
    }
    
    res.json(result.rows[0]);
  } catch (error) {
    console.error('Error fetching political structure:', error);
    res.status(500).json({ error: 'Internal server error' });
  }
});

// POST application
app.post('/api/applications', async (req, res) => {
  try {
    const { category, activityId, formData } = req.body;
    
    // Validate required fields
    if (!category || !activityId || !formData) {
      return res.status(400).json({ error: 'Missing required fields' });
    }
    
    const result = await pool.query(
      'INSERT INTO applications (category, activity_id, form_data, created_at) VALUES ($1, $2, $3, NOW()) RETURNING *',
      [category, activityId, JSON.stringify(formData)]
    );
    
    res.status(201).json({ 
      message: 'Application submitted successfully',
      application: result.rows[0]
    });
  } catch (error) {
    console.error('Error submitting application:', error);
    res.status(500).json({ error: 'Internal server error' });
  }
});

// Health check endpoint
app.get('/health', (req, res) => {
  res.json({ status: 'OK', timestamp: new Date().toISOString() });
});

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});

module.exports = app;