# 🥛 Tapi-Drink

## ❔ What's tapi-drink?
tapi-drink create on rails api server and vue front.

## 📝 API document

<!-- this is a template. -->

### Template
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
<details><summary></summary><div>

```
{
  "user_id": 1,
  "user_name": "test"
}
```

</div></details>
<!-- template end -->

### CreateUser　API
Success message is returned when user creation is successful, and failure message is returned when failure
#### EndPoint
```
POST localhost/users/
```
#### Params
|Specified  |Param  |Type  |Description  |
|-----------|-------|------|-------------|
|Body       |name  |String  |UserName  |
|Body       |password  |String  |password  |
#### Responce
Please use the curl command to check the operation

```
$ curl -X POST http://localhost:3000/api/users -d 'user[name]={user_name}&user[password]={user_password}'
```

Please replace the {user_name} and {user_password} part with a concrete value  
ex)  
```
{user_name} => user,
{user_password} => password
```

〇Success pattern

```
$ curl -X POST http://localhost:3000/api/users -d 'user[name]=user&user[password]=password'
```

✖Failure pattern

```
$ curl -X POST http://localhost:3000/api/users -d 'user[name]=&user[password]=password'
                    or
$ curl -X POST http://localhost:3000/api/users -d ''
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
