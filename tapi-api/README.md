# 🥛 Tapi-Drink-Api

* [Tapi-Drink-Document](../README.md)
* [Tapi-Drink-Front](../vue-js/README.md)

## 📝 API document

<!-- this is a template. -->

### [POST] Template
#### EndPoint
```
POST localhost/user/login
```
#### Params
|Specified  |Param  |Type  |Description  |
|-----------|-------|------|-------------|
|Body       |address  |String  |MailAddress  |
|Body       |password  |String  |password  |
#### Responce
<details><summary>Example</summary><div>

```
{
  "user_id": 1,
  "user_name": "test"
}
```

</div></details>
<!-- template end -->

### [POST] CreateUser
CreateUser API returns the success or error message in json format
#### EndPoint
```
POST localhost/user/new
```
#### Params
|Specified  |Param  |Type  |Description  |
|-----------|-------|------|-------------|
|Body       |name  |String  |UserName  |
|Body       |email  |String  |EmailAdress  |
|Body       |password  |String  |password  |
#### Responce
<details><summary>Example</summary><div>
Please use the curl command to check the operation

```
$ curl -X POST http://localhost:3000/user/new -d 'user[email]={user_email}&user[name]={user_name}&user[password]={user_password}'
```

Please replace the {user_email} and {user_name} and {user_password} part with a concrete value  
ex)  
```
{user_email} => test@example.com,
{user_name} => user,
{user_password} => password
```

〇Success pattern

```
$ curl -X POST http://localhost:3000/user/new -d 'user[email]=test@example.com&user[name]=user&user[password]=password'
```

✖Failure pattern

```
$ curl -X POST http://localhost:3000/user/new -d 'user[name]=&user[password]=password'
                    or
$ curl -X POST http://localhost:3000/user/new -d ''
```

Successful message
  
```
{
  "message":"success!!"
}
```

Failure message
  
```
{
  "error":"failed save"
}
```
</div></details>

### [POST] UserLogin
UserLogin API  returns a success_message and user_token when login is successful and an error message when failure
#### EndPoint
```
POST localhost/auth/login
```
#### Params
|Specified  |Param  |Type  |Description  |
|-----------|-------|------|-------------|
|Body       |email  |String  |EmailAdress  |
|Body       |password  |String  |password  |
#### Responce
<details><summary>Example</summary><div>
Please use the curl command to check the operation

```
$ curl -X POST http://localhost:3000/auth/login -d 'login[email]={login_email}&login[password]={login_password}'
```

Please replace the {login_email} and {login_password} part with a concrete value  
ex)  
```
{login_email} => test@example.com,
{login_password} => password
```

```
$ curl -X POST http://localhost:3000/auth/login -d 'login[email]=test@example.com&login[password]=password'
```

Validation error is returned if you do not enter both email and password
Validation error message

```
{
  "params_error":"the email or password is incorrect"
}
```

Successful message will be returned if it matches the data registered in the table
If it does not match, an failure login message is returned

Successful login message
  
```
{
  "success_message":"succesful login",
  "user_token":{random_string}
}
```

Failure login message
  
```
{
  "failure_message":"failed login"
}
```
</div></details>