# Spoor

[![Gem Version](https://badge.fury.io/rb/spoor.svg)](https://badge.fury.io/rb/spoor)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

Spoor is a **Docker-based development environment** for Ruby on Rails applications, inspired by Laravel Sail. It simplifies setting up and managing a Dockerized development environment, allowing you to focus on building your Rails application.

---

## Prerequisites

Before using Spoor, ensure that **Docker** is installed and running on your system. You can download Docker from [https://www.docker.com/](https://www.docker.com/).

---

## Installation

Add the gem to your Rails application's `Gemfile`:

```ruby
gem "spoor"
```

Then run:

```bash
bundle install
```

After installing the gem, set up Spoor in your project:

```bash
spoor install
```

This will generate the necessary `docker-compose.yml` and `.env` files. If your project already has a `Dockerfile`, it will not be overwritten unless you use the `--force-dockerfile` flag:

```bash
spoor install --force-dockerfile
```

---

## Usage

### Start the Environment

To start the Spoor environment, run:

```bash
spoor up
```

This will start the Docker containers in the background.

### Stop the Environment

To stop the environment, run:

```bash
spoor down
```

### Run Rails Commands

You can run Rails commands inside the Docker container using:

```bash
spoor rails <command>
```

For example:

```bash
spoor rails console
spoor rails db:migrate
```

### Run Bundler Commands

To run Bundler commands, use:

```bash
spoor bundle <command>
```

For example:

```bash
spoor bundle install
```

### Access the Database

To start a PostgreSQL CLI session, run:

```bash
spoor psql
```

### Access Redis

To start a Redis CLI session, run:

```bash
spoor redis
```

### Start a Shell in the App Container

To start a Bash shell in the app container, run:

```bash
spoor bash
```

---

## Configuration

### Environment Variables

The `.env` file generated during installation contains the following environment variables:

```env
APP_PORT=3000
FORWARD_DB_PORT=5432
FORWARD_REDIS_PORT=6379
WWWUSER=1000
WWWGROUP=1000
```

You can customize these values to fit your project's needs.

### Docker Compose

The `docker-compose.yml` file is pre-configured with the following services:

- **web**: The Rails application.
- **db**: PostgreSQL database.
- **redis**: Redis for caching or background jobs.

You can modify this file to add or remove services as needed.

---

## Example Workflow

1. Install Spoor:

   ```bash
   spoor install
   ```

2. Start the environment:

   ```bash
   spoor up
   ```

3. Run database migrations:

   ```bash
   spoor rails db:migrate
   ```

4. Access the Rails console:

   ```bash
   spoor rails console
   ```

5. Stop the environment when done:

   ```bash
   spoor down
   ```

---

## Contributing

Contributions are welcome! If you'd like to contribute to Spoor, please follow these steps:

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Commit your changes.
4. Submit a pull request.

---

## License

Spoor is open-source software licensed under the [MIT License](https://opensource.org/licenses/MIT).

---

## Support

If you encounter any issues or have questions, please [open an issue](https://github.com/mohammed-bageri/spoor/issues) on GitHub.
