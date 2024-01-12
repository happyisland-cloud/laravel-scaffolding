Laravel scaffolding 
---
This is a simple docker environment used to start a laravel project, following [Laravel documentation](https://laravel.com/docs/10.x/installation)

## How start a new project
* Run a find and replace in the whole project about **laravel-scaffolding**, replacing with the name of your project
* In your /etc/hosts file set 127.0.0.1     {name-of-your-project}
* set up db credentials in the `.env` in the root of the project
* From root directory run `docker compose up -d --build`
* remove the file `.gitignore` from *app/src/* directory: `rm app/src/.gitignore`
* Go in the app container with `docker compose exec app bash` and create your laravel project following the documentation
`composer create-project laravel/laravel .`
* Fix the configurations in your `app/src/.env` file
* Going now in your browser at address **https://{name-of-your-project}** you should see the laravel project

