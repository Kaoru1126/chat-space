== README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.

# DB設計
## users table

| Column     | Type        | Options                     |
|------------|-------------|-----------------------------|
| name       | string      | null: false, index: true    |
| mail       | string      | null: false, unique: true   |
| password   | string      | null: false,                |

### Association

 - has_many : messages
 - has_many : members
 - has_many : gropus, through members


## messages table

| Column     | Type        | Options                     |
|------------|-------------|-----------------------------|
| body       | text        | null: false                 |
| image      | string      |                             |
| user_id    | integer     | null: false                 |
| group_id   | integer     | null: false                 |

### Association

 - belongs_to : user


## members table

| Column     | Type        | Options                     |
|------------|-------------|-----------------------------|
| user_id    | integer     | null: false                 |
| group_id   | integer     | null: false                 |

### Association

 - belongs_to : user
 - belongs_to : group


## groups table

| Column     | Type        | Options                     |
|------------|-------------|-----------------------------|
| name       | string      | null: false                 |

### Association

 - has_many :users, thorugh members
 - has_many :members
 - has_many :messages


