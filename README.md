# CAR AUCTION APP

[auction.felixabacajen.info](https://auction.felixabacajen.info/)

**_Ruby version 3.2.2_** (make sure you install the correct version of ruby)

**_Ruby on Rails version 7.0.6~_**

[Ruby and ROR Installation (Ubuntu, Mac, Windows)](https://gorails.com/setup/ubuntu/22.04)

## Clone Repo

```
git clone https://github.com/felix1251/car-auction-platform.git
```

```
cd car-auction-platform
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

## **Run Local Server**

```
./bin/dev
```

## **Sample Accounts**

**Admin**

```
email: admin@dev.com
password: Password1!
```

**Regular users**

```
email: jdcruz@dev.com
password: Password1!
```

```
email: mmakiling@dev.com
password: Password1!
```
