-- database_schema.sql
-- Create activities table
CREATE TABLE IF NOT EXISTS activities (
    id SERIAL PRIMARY KEY,
    category VARCHAR(50) NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    icon VARCHAR(50),
    requirements JSONB,
    schedule VARCHAR(255),
    location VARCHAR(255),
    team_size VARCHAR(50),
    difficulty VARCHAR(50),
    features JSONB,
    meeting_schedule VARCHAR(255),
    member_count INTEGER,
    founded VARCHAR(50),
    activities JSONB,
    benefits JSONB,
    term_length VARCHAR(255),
    positions_available INTEGER,
    commitment_level VARCHAR(255),
    election_period VARCHAR(255),
    responsibilities JSONB,
    qualifications JSONB,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create applications table
CREATE TABLE IF NOT EXISTS applications (
    id SERIAL PRIMARY KEY,
    category VARCHAR(50) NOT NULL,
    activity_id INTEGER NOT NULL,
    form_data JSONB NOT NULL,
    status VARCHAR(50) DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (activity_id) REFERENCES activities(id) ON DELETE CASCADE
);

-- Create indexes for better performance
CREATE INDEX IF NOT EXISTS idx_activities_category ON activities(category);
CREATE INDEX IF NOT EXISTS idx_activities_name ON activities(name);
CREATE INDEX IF NOT EXISTS idx_applications_category ON applications(category);
CREATE INDEX IF NOT EXISTS idx_applications_activity_id ON applications(activity_id);
CREATE INDEX IF NOT EXISTS idx_applications_created_at ON applications(created_at);