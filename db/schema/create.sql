DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS boards CASCADE;
DROP TABLE IF EXISTS tasks CASCADE;
DROP TABLE IF EXISTS users_tasks CASCADE;
DROP TABLE IF EXISTS messages CASCADE;

CREATE TABLE users (
  id SERIAL PRIMARY KEY NOT NULL,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  avatar VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  phone_number VARCHAR(255) NOT NULL,
  created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW(),
  active BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE boards (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  image_url VARCHAR(255),
  created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW(),
  active BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE tasks (
  id SERIAL PRIMARY KEY NOT NULL,
  board_id INTEGER REFERENCES boards(id) ON DELETE CASCADE,
  title VARCHAR(255) NOT NULL,
  status INTEGER NOT NULL DEFAULT 1,
  description TEXT,
  due_date DATE,
  created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW(),
  active BOOLEAN NOT NULL DEFAULT TRUE,
  total_time_sec integer DEFAULT 0,
  array_of_users VARCHAR(255)
);

CREATE TABLE users_tasks (
  id SERIAL PRIMARY KEY NOT NULL,
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  task_id INTEGER REFERENCES tasks(id) ON DELETE CASCADE,
  created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW(),
  active BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE messages (
  id SERIAL PRIMARY KEY NOT NULL,
  userLS VARCHAR(255) NOT NULL,
  message TEXT,
  user_ls_avatar VARCHAR(255),
  created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW(),
  active BOOLEAN NOT NULL DEFAULT TRUE
);
