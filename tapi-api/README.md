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
POST localhost/users/
```
#### Params
|Specified  |Param  |Type  |Description  |
|-----------|-------|------|-------------|
|Body       |name  |String  |UserName  |
|Body       |password  |String  |password  |
#### Responce
<details><summary>Example</summary><div>
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
</div></details>

