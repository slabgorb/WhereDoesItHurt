#Where Does It Hurt#

Predefined auth routes:

### `/signup`

**Request**:

```
curl -XPOST -H "Content-Type: application/json" -d '{ "user": { "email": "test@example.com", "password": "12345678", "password_confirmation": "12345678" } }' http://localhost:3000/signup
```

**Response**: Returns the details of the created user

```
{"data":{"id":"4","type":"user","attributes":{"email":"test@example.com","sign_in_count":1,"created_at":"2022-04-18T17:49:06.798Z"}}}
```

### `/login`

**Request**:

```bash
curl -XPOST -i -H "Content-Type: application/json" -d '{ "user": { "email": "test@example.com", "password": "12345678" } }' http://localhost:3000/login
```

**Response**: includes `Authorization` in header and details of the loggedin user

```bash
HTTP/1.1 200 OK
X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 0
X-Content-Type-Options: nosniff
X-Download-Options: noopen
....
Content-Type: application/vnd.api+json; charset=utf-8
Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI0Iiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNjUwMzA0MjU3LCJleHAiOjE2NTAzOTA2NTcsImp0aSI6IjM4ZmI4ZGIyLWVlMjgtNDg2Yy05YjE5LTA2NWVmYmQ0ZGE4MCJ9.p8766vPrhiGpPyV2FdShw1ljBx2Os3D1oE_rPjjAYrY
...

{"data":{"id":"4","type":"user","attributes":{"email":"test@example.com","sign_in_count":2,"created_at":"2022-04-18T17:49:06.798Z"}}}
```

<img width="400" src="https://zakaria.dev/assets/images/rails_base_app/login.png" alt="Login">

### `/logout`

**Request**: includes `Authorization` and its JWT token in the header of `DELETE` request

```bash
curl -XDELETE -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI0Iiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNjUwMzA0MjU3LCJleHAiOjE2NTAzOTA2NTcsImp0aSI6IjM4ZmI4ZGIyLWVlMjgtNDg2Yy05YjE5LTA2NWVmYmQ0ZGE4MCJ9.p8766vPrhiGpPyV2FdShw1ljBx2Os3D1oE_rPjjAYrY" -H "Content-Type: application/json" http://localhost:3000/logout
```

**Response**: nothing

<img width="400" src="https://zakaria.dev/assets/images/rails_base_app/logout.png" alt="Logout">

**Note** We are using JWT to authentication, it means you can use this Rails base app as a **vanilla rails app** (Backend and frontend together), or as a **Rails API app**. both you can use.


## Running this app

You need to do few small steps to run the app

### Clone the repo

```sh
git clone https://github.com/zakariaf/rails-base-app wheredoesithurt
cd wheredoesithurt
```

### Copy example file

```sh
cp .env.example .env.local
```

Environment variables defined here(`.env`), feel free to change or add variables as needed.
This file is ignored from git (Check `.gitignore`) so it will never be commit.

If you use different values for environment variables in other envs, e.g. **test**, you need to copy one more: `.env.test.local`

**Note** `.env.test` is used by github workflows.

### Setup the project

create databases

```sh
rails db:setup
```

### start the project

- rails server

  ```sh
  rails s
  ```

- frontend app

  ```sh
  yarn dev
  ```
