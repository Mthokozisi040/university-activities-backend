-- seed_data.sql
BEGIN;

-- Insert sample sports activities
INSERT INTO activities (category, name, description, icon, requirements, schedule, location, team_size, difficulty, features) VALUES
(
  'sports',
  'Football',
  'Join our competitive university football team and compete in inter-collegiate tournaments. We welcome players of all skill levels and provide comprehensive training.',
  'football',
  $$
  [
      {"name": "position", "label": "Preferred Position", "type": "select", "options": ["Goalkeeper", "Defender", "Midfielder", "Striker"], "required": true},
      {"name": "experience", "label": "Years of Experience", "type": "number", "min": 0, "max": 20, "required": true},
      {"name": "fitness_level", "label": "Fitness Level", "type": "select", "options": ["Beginner", "Intermediate", "Advanced"], "required": true},
      {"name": "availability", "label": "Training Availability", "type": "select", "options": ["Weekdays only", "Weekends only", "Both weekdays and weekends"], "required": true},
      {"name": "medical_conditions", "label": "Any Medical Conditions", "type": "textarea", "placeholder": "Please list any medical conditions or injuries we should be aware of", "required": false}
  ]
  $$,
  'Monday, Wednesday, Friday 6:00 PM - 8:00 PM',
  'University Sports Complex',
  '22 players + reserves',
  'Intermediate to Advanced',
  $$["Professional coaching", "Competition gear provided", "Inter-university tournaments", "Fitness training", "Team bonding events"]$$
);

INSERT INTO activities (category, name, description, icon, requirements, schedule, location, team_size, difficulty, features) VALUES
(
  'sports',
  'Basketball',
  'Experience the thrill of basketball with our dynamic university team. We focus on teamwork, skill development, and competitive excellence.',
  'basketball',
  $$
  [
      {"name": "height", "label": "Height (cm)", "type": "number", "min": 150, "max": 220, "required": true},
      {"name": "position", "label": "Preferred Position", "type": "select", "options": ["Point Guard", "Shooting Guard", "Small Forward", "Power Forward", "Center"], "required": true},
      {"name": "experience", "label": "Basketball Experience", "type": "select", "options": ["Beginner", "High School Level", "Club Level", "Semi-Professional"], "required": true},
      {"name": "phone", "label": "Phone Number", "type": "tel", "required": true},
      {"name": "emergency_contact", "label": "Emergency Contact", "type": "text", "required": true}
  ]
  $$,
  'Tuesday, Thursday 7:00 PM - 9:00 PM, Saturday 10:00 AM - 12:00 PM',
  'Basketball Court A',
  '12 players',
  'All levels welcome',
  $$["Professional coaching", "Tournament participation", "Skills development workshops", "Team uniform", "Access to training facilities"]$$
);

INSERT INTO activities (category, name, description, icon, requirements, schedule, location, team_size, difficulty, features) VALUES
(
  'sports',
  'Tennis',
  'Improve your tennis skills with our dedicated tennis program. Individual coaching and group sessions available for all skill levels.',
  'tennis',
  $$
  [
      {"name": "skill_level", "label": "Current Skill Level", "type": "select", "options": ["Beginner", "Novice", "Intermediate", "Advanced"], "required": true},
      {"name": "preferred_hand", "label": "Playing Hand", "type": "select", "options": ["Right-handed", "Left-handed", "Ambidextrous"], "required": true},
      {"name": "lesson_type", "label": "Preferred Lesson Type", "type": "select", "options": ["Individual coaching", "Group lessons", "Both"], "required": true},
      {"name": "goals", "label": "Tennis Goals", "type": "textarea", "placeholder": "What do you hope to achieve through tennis?", "required": false}
  ]
  $$,
  'Flexible scheduling available',
  'Tennis Courts 1-4',
  'Individual or small groups',
  'All levels',
  $$["Professional instruction", "Equipment rental available", "Tournament opportunities", "Flexible scheduling", "Court access"]$$
);

-- Insert sample societies
INSERT INTO activities (category, name, description, icon, requirements, meeting_schedule, location, member_count, founded, activities, benefits) VALUES
(
  'societies',
  'Debate Club',
  'Sharpen your argumentative skills and boost your confidence in public speaking. Participate in inter-university debate competitions and intellectual discussions.',
  'debate',
  $$
  [
      {"name": "speaking_experience", "label": "Public Speaking Experience", "type": "select", "options": ["None", "Some experience", "Experienced", "Very experienced"], "required": true},
      {"name": "debate_topics", "label": "Preferred Debate Topics", "type": "select", "options": ["Politics", "Social Issues", "Technology", "Philosophy", "All topics"], "required": true},
      {"name": "time_commitment", "label": "Weekly Time Commitment", "type": "select", "options": ["2-4 hours", "4-6 hours", "6-8 hours", "8+ hours"], "required": true},
      {"name": "motivation", "label": "Why do you want to join?", "type": "textarea", "required": true},
      {"name": "email", "label": "Email Address", "type": "email", "required": true}
  ]
  $$,
  'Every Tuesday 7:00 PM - 9:00 PM',
  'Student Union Room 205',
  45,
  '2015',
  $$["Weekly practice debates", "Inter-university competitions", "Public speaking workshops", "Current affairs discussions", "Mock parliamentary sessions"]$$,
  $$["Improved public speaking", "Critical thinking development", "Networking opportunities", "Competition experience", "Leadership skills"]$$
);

INSERT INTO activities (category, name, description, icon, requirements, meeting_schedule, location, member_count, founded, activities, benefits) VALUES
(
  'societies',
  'Photography Club',
  'Capture the world through your lens! Learn photography techniques, participate in photo walks, and showcase your work in exhibitions.',
  'photography',
  $$
  [
      {"name": "camera_type", "label": "Camera Equipment", "type": "select", "options": ["DSLR", "Mirrorless", "Point and shoot", "Smartphone only", "No camera yet"], "required": true},
      {"name": "experience_level", "label": "Photography Experience", "type": "select", "options": ["Complete beginner", "Hobbyist", "Semi-professional", "Professional"], "required": true},
      {"name": "interests", "label": "Photography Interests", "type": "select", "options": ["Portrait", "Landscape", "Street", "Wildlife", "All genres"], "required": true},
      {"name": "portfolio", "label": "Portfolio Link (optional)", "type": "text", "placeholder": "Instagram, website, or other portfolio link", "required": false}
  ]
  $$,
  'Every Saturday 2:00 PM - 4:00 PM',
  'Art Building Studio 3',
  38,
  '2018',
  $$["Weekly photo walks", "Technical workshops", "Guest photographer sessions", "Annual exhibition", "Photo editing tutorials"]$$,
  $$["Equipment access", "Professional mentoring", "Exhibition opportunities", "Networking with photographers", "Skill development workshops"]$$
);

INSERT INTO activities (category, name, description, icon, requirements, meeting_schedule, location, member_count, founded, activities, benefits) VALUES
(
  'societies',
  'Music Society',
  'Join our vibrant music community! Whether you play an instrument, sing, or just love music, we have something for everyone.',
  'music',
  $$
  [
      {"name": "instrument", "label": "Primary Instrument/Voice", "type": "select", "options": ["Piano", "Guitar", "Violin", "Drums", "Bass", "Vocals", "Saxophone", "Trumpet", "Other", "None - just love music!"], "required": true},
      {"name": "skill_level", "label": "Skill Level", "type": "select", "options": ["Beginner", "Intermediate", "Advanced", "Professional"], "required": true},
      {"name": "music_genres", "label": "Favorite Music Genres", "type": "select", "options": ["Classical", "Jazz", "Rock", "Pop", "Folk", "Electronic", "All genres"], "required": true},
      {"name": "performance_interest", "label": "Interest in Performing", "type": "select", "options": ["Very interested", "Somewhat interested", "Not interested", "Only in groups"], "required": true},
      {"name": "availability", "label": "Available Times", "type": "select", "options": ["Weekday evenings", "Weekend afternoons", "Both", "Flexible"], "required": true}
  ]
  $$,
  'Every Thursday 6:30 PM - 8:30 PM',
  'Music Hall',
  52,
  '2012',
  $$["Weekly jam sessions", "Concerts and performances", "Music theory workshops", "Recording sessions", "Open mic nights"]$$,
  $$["Access to practice rooms", "Instrument borrowing", "Performance opportunities", "Music production training", "Collaborative projects"]$$
);

-- Insert sample political structures
INSERT INTO activities (category, name, description, icon, requirements, term_length, positions_available, commitment_level, election_period, responsibilities, qualifications) VALUES
(
  'political-structures',
  'Student Council',
  'Be the voice of your fellow students! Join the Student Council to advocate for student rights, organize events, and make positive changes on campus.',
  'student_council',
  $$
  [
      {"name": "year_of_study", "label": "Year of Study", "type": "select", "options": ["First Year", "Second Year", "Third Year", "Fourth Year", "Graduate"], "required": true},
      {"name": "gpa", "label": "Current GPA", "type": "number", "min": 2.0, "max": 4.0, "placeholder": "Minimum 3.0 required", "required": true},
      {"name": "leadership_experience", "label": "Previous Leadership Experience", "type": "textarea", "placeholder": "Describe any leadership roles or experiences", "required": true},
      {"name": "campaign_platform", "label": "Campaign Platform", "type": "textarea", "placeholder": "What changes would you like to bring to the university?", "required": true},
      {"name": "time_availability", "label": "Weekly Time Commitment Available", "type": "select", "options": ["5-10 hours", "10-15 hours", "15-20 hours", "20+ hours"], "required": true},
      {"name": "contact_email", "label": "Contact Email", "type": "email", "required": true}
  ]
  $$,
  '1 Academic Year',
  15,
  'High - 15-20 hours per week',
  'March-April annually',
  $$["Represent student interests", "Organize campus events", "Attend weekly council meetings", "Liaison with university administration", "Manage student committees", "Budget allocation for student activities"]$$,
  $$["Minimum 3.0 GPA", "Strong communication skills", "Previous leadership experience preferred", "Commitment to student advocacy", "Ability to work in teams"]$$
);

INSERT INTO activities (category, name, description, icon, requirements, term_length, positions_available, commitment_level, election_period, responsibilities, qualifications) VALUES
(
  'political-structures',
  'University Senate Student Representative',
  'Represent the student body in the highest governing body of the university. Participate in critical decisions affecting academic policies and campus life.',
  'government',
  $$
  [
      {"name": "academic_standing", "label": "Academic Standing", "type": "select", "options": ["Undergraduate - Junior", "Undergraduate - Senior", "Graduate Student", "PhD Candidate"], "required": true},
      {"name": "gpa_requirement", "label": "Current GPA", "type": "number", "min": 3.0, "max": 4.0, "placeholder": "Minimum 3.5 required", "required": true},
      {"name": "previous_governance", "label": "Previous Governance Experience", "type": "textarea", "placeholder": "Describe experience in student government or similar roles", "required": true},
      {"name": "committee_interest", "label": "Committee Interest", "type": "select", "options": ["Academic Affairs", "Student Life", "Budget & Finance", "Campus Development", "All committees"], "required": true},
      {"name": "references", "label": "Faculty/Staff References", "type": "textarea", "placeholder": "Please provide names and contact information for 2 references", "required": true}
  ]
  $$,
  '2 Academic Years',
  3,
  'Very High - 20+ hours per week',
  'September-October annually',
  $$["Attend monthly Senate meetings", "Serve on university committees", "Consult with student organizations", "Review and vote on university policies", "Present student concerns to administration", "Participate in strategic planning"]$$,
  $$["Minimum 3.5 GPA", "Junior standing or above", "Exceptional communication skills", "Previous student government experience", "Strong analytical abilities", "Faculty recommendations required"]$$
);

INSERT INTO activities (category, name, description, icon, requirements, term_length, positions_available, commitment_level, election_period, responsibilities, qualifications) VALUES
(
  'political-structures',
  'Residence Hall Council',
  'Lead and improve residential life for all students living on campus. Organize events, address concerns, and create a sense of community in the residence halls.',
  'political_party',
  $$
  [
      {"name": "residence_hall", "label": "Current Residence Hall", "type": "select", "options": ["North Hall", "South Hall", "East Tower", "West Complex", "Graduate Housing"], "required": true},
      {"name": "position_interest", "label": "Position of Interest", "type": "select", "options": ["President", "Vice President", "Secretary", "Treasurer", "Social Chair", "General Representative"], "required": true},
      {"name": "event_planning", "label": "Event Planning Experience", "type": "select", "options": ["Extensive", "Some experience", "Limited", "No experience but eager to learn"], "required": true},
      {"name": "conflict_resolution", "label": "Conflict Resolution Skills", "type": "select", "options": ["Very strong", "Good", "Developing", "Need training"], "required": true},
      {"name": "availability_evenings", "label": "Evening Availability", "type": "select", "options": ["Most evenings", "3-4 evenings per week", "2-3 evenings per week", "Weekends only"], "required": true},
      {"name": "motivation", "label": "Why do you want to serve?", "type": "textarea", "required": true}
  ]
  $$,
  '1 Academic Year',
  25,
  'Medium - 8-12 hours per week',
  'August-September annually',
  $$["Organize hall events and activities", "Address resident concerns", "Coordinate with Residence Life staff", "Manage hall budget", "Facilitate community meetings", "Promote hall spirit and unity"]$$,
  $$["Current residence hall resident", "Strong interpersonal skills", "Event planning abilities", "Commitment to community building", "Reliable and responsible", "Positive attitude"]$$
);

-- Insert additional sample data for variety
INSERT INTO activities (category, name, description, icon, requirements, schedule, location, difficulty, features) VALUES
(
  'sports',
  'Swimming',
  'Dive into competitive swimming with our university team. Train for competitions while improving your technique and endurance.',
  'swimming',
  $$
  [
      {"name": "swimming_strokes", "label": "Swimming Strokes Known", "type": "select", "options": ["Freestyle only", "Freestyle & Backstroke", "All four strokes", "Butterfly specialist"], "required": true},
      {"name": "pool_experience", "label": "Pool vs Open Water", "type": "select", "options": ["Pool only", "Open water only", "Both", "Neither - beginner"], "required": true},
      {"name": "competition_level", "label": "Competition Experience", "type": "select", "options": ["None", "High school", "Club level", "State/Regional"], "required": true},
      {"name": "training_intensity", "label": "Preferred Training Intensity", "type": "select", "options": ["Light/Recreational", "Moderate", "Intense", "Competitive"], "required": true}
  ]
  $$,
  'Monday-Friday 6:00 AM - 8:00 AM',
  'Aquatic Center',
  'All levels',
  $$["Olympic-size pool", "Professional coaching", "Strength training", "Competition opportunities", "Swim gear discounts"]$$
);

INSERT INTO activities (category, name, description, icon, requirements, meeting_schedule, member_count, activities, benefits) VALUES
(
  'societies',
  'Coding Club',
  'Learn programming, work on exciting projects, and prepare for tech careers. From beginners to advanced programmers - everyone is welcome!',
  'coding',
  $$
  [
      {"name": "programming_experience", "label": "Programming Experience", "type": "select", "options": ["Complete beginner", "Some basics", "Intermediate", "Advanced"], "required": true},
      {"name": "languages_known", "label": "Programming Languages", "type": "select", "options": ["None yet", "Python", "JavaScript", "Java", "C++", "Multiple languages"], "required": true},
      {"name": "project_interest", "label": "Project Interests", "type": "select", "options": ["Web development", "Mobile apps", "Game development", "AI/Machine Learning", "All of the above"], "required": true},
      {"name": "laptop_availability", "label": "Laptop Access", "type": "select", "options": ["Have my own laptop", "Sometimes have access", "Need to use lab computers"], "required": true}
  ]
  $$,
  'Every Wednesday 7:00 PM - 9:00 PM',
  28,
  $$["Coding workshops", "Hackathons", "Guest speaker sessions", "Open source contributions", "Career preparation"]$$,
  $$["Free programming resources", "Mentorship opportunities", "Networking with tech professionals", "Project collaboration", "Job placement assistance"]$$
);

COMMIT;
