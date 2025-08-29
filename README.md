# Axolotl

A Laravel + Vue 3 + Vite + Docker project for learning and portfolio purposes.

## Run Locally

To set up and run the Axolotl project on your local machine, follow these steps:

1. **Clone the repository**

```bash
git clone <your-repo-url>
cd Axolotl
```

2. **Create the environment file**

```bash
cp .env.example .env
```

3. **Generate the Laravel application key**

```bash
php artisan key:generate
```

4. **Create the SQLite database file**

```bash
touch database/database.sqlite
```

5. **Build and start Docker containers**

```bash
docker-compose up --build
```

The Laravel backend and Vue frontend will be built automatically.

6. **Access the application**
   Open your browser and go to [http://localhost:8000](http://localhost:8000). You should see the Axolotl application running.

7. **Stop the application**

```bash
docker-compose down
```

8. **Optional: Rebuild frontend assets**
   If you make changes to Vue or Vite, run:

```bash
docker-compose run --rm app npm run build
```
