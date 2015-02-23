web: bundle exec unicorn -p $PORT -c ./config/unicorn.rb
echo "RACK_ENV=production" >> .env
echo "PORT=80" >> .env
echo ".env" >> .gitignore
git add .gitignore
git commit -m "add .env to .gitignore"
