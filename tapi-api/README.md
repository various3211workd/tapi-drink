# 🥛 Tapi-Drink-Api

* [Tapi-Drink-Document](../README.md)
* [Tapi-Drink-Front](../vue-js/README.md)

## 🔧 Build Setup

If you do not have ruby ​​installed, please install ruby

``` bash
# Please install if rails are not installed
$ gem install rails

# Install the package used by Tapi-drink
$ bundle install

# start server
$ rails s

```

You should be able to access http://localhost:3000/ if the server is up

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

***

<!-- template end -->

### [POST] CreateUser
CreateUser API returns the success or error message in json format
#### EndPoint
```
POST localhost:3000/api/user/new
```
#### Params
|Specified  |Param  |Type  |Description  |
|-----------|-------|------|-------------|
|Header       |API_KEY  |String  |tapi-drink  API KEY  |
|Body       |name  |String  |UserName  |
|Body       |email  |String  |EmailAdress  |
|Body       |password  |String  |password  |
|Body       |image  |image  |user profile image  |
#### Responce
<details><summary>Example</summary><div>
Please use the curl command to check the operation

```
$ curl -H 'API_KEY:{API_KEY}' -X POST http://localhost:30000/api/user/new -d 'user[email]={user_email}&user[name]={user_name}&user[password]={user_password}'
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
$ curl -X POST http://localhost:30000/api/user/new -d 'user[email]=test@example.com&user[name]=user&user[password]=password'
```

✖Failure pattern

```
$ curl -X POST http://localhost:30000/api/user/new -d 'user[name]=&user[password]=password'
                    or
$ curl -X POST http://localhost:30000/api/user/new -d ''
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
  "message":"failed save"
}
```
</div></details>

***

### [POST] UserLogin
UserLogin API  returns a success_message and user_token when login is successful and an error message when failure
#### EndPoint
```
POST localhost:3000/api/auth/login
```
#### Params
|Specified  |Param  |Type  |Description  |
|-----------|-------|------|-------------|
|Header       |API_KEY  |String  |tapi-drink  API KEY  |
|Body       |email  |String  |EmailAdress  |
|Body       |password  |String  |password  |
#### Responce
<details><summary>Example</summary><div>
Please use the curl command to check the operation

```
$ curl -H 'API_KEY:{API_KEY}' -X POST http://localhost:30000/api/auth/login -d 'login[email]={login_email}&login[password]={login_password}'
```

Please replace the {login_email} and {login_password} part with a concrete value  
ex)  
```
{login_email} => test@example.com,
{login_password} => password
```

```
$ curl -X POST http://localhost:30000/api/auth/login -d 'login[email]=test@example.com&login[password]=password'
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
  "message":"succesful login",
  "user_token":{random_string},
  "user_name": {user_name} ,
  "user_id":{user_id},
  "user_image_url":{user_image_url}
}
```

Failure login message
  
```
{
  "message":"failed login"
}
```
</div></details>

***

### [DELETE] UserDelete API 
UserDelete API  returns a success_message when UserDelete is successful and an error message when failure
#### EndPoint
```
DELETE localhost:3000/api/user/delete
```
#### Params
|Specified  |Param  |Type  |Description  |
|-----------|-------|------|-------------|
|Header       |API_KEY  |String  |tapi-drink  API KEY  |
|Header       |USER_TOKEN  |String  |user_token  |
#### Responce
<details><summary>Example</summary><div>
Please use the curl command to check the operation

```
$ curl -H 'API_KEY:{API_KEY}' -H 'USER_TOKEN:{USER_TOKEN}' -X DELETE http://localhost:30000/api/user/delete
```

Successful delete message
  
```
{
  "message":"complete"
}
```

Failure delete message
  
```
{
  "message":"error"
}
```
</div></details>

***

### [POST] ShopCreate API
ShopCreate API  returns a success_message when create is successful and an error message when failure
#### EndPoint
```
POST localhost:30000/api/shops/create
```
#### Params
|Specified  |Param  |Type  |Description  |
|-----------|-------|------|-------------|
|Header       |API_KEY  |string  |tapi-drink API KEY  |
|Header       |USER_TOKEN  |string  |user_token  |
|Body       |name  |String  |Shop Name  |
|Body       |address  |String  |Shop Address  |
|Body       |details  |text  |Shop Details  |
|Body       |user_id  |integer  |ID of created user  |
|Body       |images[]  |image  |Shop images  |

#### Responce
<details><summary>Example</summary><div>
Please use the curl command to check the operation

```
$ curl -H 'API_KEY:{API_KEY}' -H 'USER_TOKEN:{USER_TOKEN}' -X POST http://localhost:30000/api/shops/create -d 'shop[name]={shop_name}&shop[address]={shop_addres}&shop[details]={shop_details}&shop[user_id]={user_id}'
```

Successful  message
  
```
{
  "message":"success create"
}
```

Failure  message
  
```
{
  "message":"failed create"
}
```
</div></details>

***

### [GET] ShopList API
ShopList API  returns a list data when search is successful
#### EndPoint
```
GET localhost:3000/api/shops/show
```
#### Params
|Specified  |Param  |Type  |Description  |
|-----------|-------|------|-------------|
|Header       |API_KEY  |string  |tapi-drink API KEY  |
|Body       |number  |integer  |Number of searches  |

#### Responce
<details><summary>Example</summary><div>
Please use the curl command to check the operation

```
$ curl -H 'API_KEY:{API_KEY}' -X GET http://localhost:30000/api/shops/show -d "number=10"
```

return  shop_list_datas
  
```
{
  "shop_list_data":
    [
      {"id":1,"name":"tapi","address":"xxx","details":"aaa","created_at":"2019-06-28T01:31:51.311Z","updated_at":"2019-06-26T04:42:13.053Z","user_id":1,"user_name":"sample"},
      {"id":2,"name":"tapi-drink","address":"xxx","details":"bbb","created_at":"2019-06-26T04:42:12.975Z","updated_at":"2019-06-26T04:42:12.975Z","user_id":1,"user_name":"sample"},
      :
      {"id":10,"name":"tapitapi","address":"xxxmmm","details":"zzz","created_at":"2019-06-26T04:42:12.975Z","updated_at":"2019-06-26T04:42:12.975Z","user_id":1,"user_name":"sample"}
    ]
}
```

</div></details>

***
