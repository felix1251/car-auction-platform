# XYZ Books

**_Ruby version 3.0.0_** (make sure you install the correct version of ruby)

**_Ruby on Rails version 7.0.5~_**

[Ruby and ROR Installation (Ubuntu, Mac, Windows)](https://gorails.com/setup/ubuntu/22.04)

<a href="" target="_blank" rel="noopener">Live App</a>

## Clone Repo

```
git clone https://github.com/felix1251/car-auction-platform.git
```

```
cd xyz_books
```

## Install Dependencies

```
bundle install
```

## **Setup DB**

Setup env variables for mysql credentials (create .env file inside project directory)

Make sure MySQL is installed on your machine

**ENV variables**

```
DB_USERNAME = your_db_username
DB_PASSWORD = your_db_pasword
```

**Active Record**

```
rails db:create
```

```
rails db:migrate
```

```
rails db:seed
```

<sub>Note: Expect warnings running <b>rails db:seed</b> command, because we are creating multple records at the same time for the purpose of having records in our db for the meantime. Though it won't break the app just a warning.</sub>

**Reset Setup** (Only if needed, not required)

```
rails db:reset
```

## **Run Local Server**

```
./bin/dev
```
