# DB設計
## users table

| Column     | Type        | Options                                |
|------------|-------------|----------------------------------------|
| name       | string      | null: false, index: true, unique: true |
| mail       | string      | null: false, unique: true              |
| password   | string      | null: false,                           |

### Association

 - has_many : messages
 - has_many : members
 - has_many : gropus, through members


## messages table

| Column     | Type        | Options                        |
|------------|-------------|--------------------------------|
| body       | text        | null: false                    |
| image      | string      |                                |
| user_id    | integer     | null: false, foreign_key: true |
| group_id   | integer     | null: false  foreign_key: true |

### Association

 - belongs_to : user


## members table

| Column     | Type        | Options                        |
|------------|-------------|--------------------------------|
| user_id    | integer     | null: false, foreign_key: true |
| group_id   | integer     | null: false, foreign_key: true |

### Association

 - belongs_to : user
 - belongs_to : group


## groups table

| Column     | Type        | Options                     |
|------------|-------------|-----------------------------|
| name       | string      | null: false, unique: true   |

### Association

 - has_many :users, thorugh members
 - has_many :members
 - has_many :messages

