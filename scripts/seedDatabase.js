// scripts/seedDatabase.js
const { Pool } = require('pg');
const fs = require('fs');
const path = require('path');
require('dotenv').config();

const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
  ssl: process.env.NODE_ENV === 'production' ? { rejectUnauthorized: false } : false
});

async function seedDatabase() {
  const client = await pool.connect();
  
  try {
    console.log('Seeding database with sample data...');
    
    // Check if data already exists
    const existingData = await client.query('SELECT COUNT(*) FROM activities');
    if (parseInt(existingData.rows[0].count) > 0) {
      console.log('⚠️  Database already contains data. Clear it first if you want to reseed.');
      const readline = require('readline');
      const rl = readline.createInterface({
        input: process.stdin,
        output: process.stdout
      });
      
      const answer = await new Promise((resolve) => {
        rl.question('Do you want to clear existing data and reseed? (y/N): ', resolve);
      });
      rl.close();
      
      if (answer.toLowerCase() !== 'y' && answer.toLowerCase() !== 'yes') {
        console.log('Seeding cancelled.');
        return;
      }
      
      // Clear existing data
      await client.query('TRUNCATE TABLE applications, activities RESTART IDENTITY CASCADE');
      console.log('🗑️  Cleared existing data');
    }
    
    // Read and execute seed file
    const seedPath = path.join(__dirname, '../seed_data.sql');
    const seedSQL = fs.readFileSync(seedPath, 'utf8');
    
    await client.query(seedSQL);
    console.log('✅ Database seeded successfully');
    
    // Show summary of seeded data
    const sportsCount = await client.query("SELECT COUNT(*) FROM activities WHERE category = 'sports'");
    const societiesCount = await client.query("SELECT COUNT(*) FROM activities WHERE category = 'societies'");
    const politicalCount = await client.query("SELECT COUNT(*) FROM activities WHERE category = 'political-structures'");
    
    console.log('\n📊 Seeded Data Summary:');
    console.log(`   Sports: ${sportsCount.rows[0].count} activities`);
    console.log(`   Societies: ${societiesCount.rows[0].count} activities`);
    console.log(`   Political Structures: ${politicalCount.rows[0].count} activities`);
    console.log(`   Total: ${parseInt(sportsCount.rows[0].count) + parseInt(societiesCount.rows[0].count) + parseInt(politicalCount.rows[0].count)} activities`);
    
  } catch (error) {
    console.error('❌ Error seeding database:', error);
    process.exit(1);
  } finally {
    client.release();
    await pool.end();
  }
}

seedDatabase();