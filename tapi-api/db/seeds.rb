# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# coding: utf-8
[
  [
    "タピオカジュース本店",
    "XX県XX市XX区XX町XX丁目XX番地",
    "タピオカを一から作成しておりもっちりとした触感がおいしいです",
    1
  ],
  [
    "新宿タピジュー",
    "OO県OO市OO区OO町OO丁目OO番地",
    "自分好きなようにドリンクを作成できるのでインスタ映えに最高です",
    2
  ],
  [
    "タピタピ",
    "XX県XX市XX区XX町XX丁目XX番地",
    "タピタピしてら",
    3
  ],
  [
    "tapi-drink",
    "OO県OO市OO区OO町OO丁目OO番地",
    "安い",
    4
  ]
].each do |name, address, details, user_id|
  User.transaction do
    Shop.create!(
      { 
        name:     name,
        address:  address,
        details:  details,
        user_id:  user_id
      }
    )
    p "success create  { name: #{name}, address: #{address}, details: #{details}, user_id: #{user_id} }"
  end
  rescue => e
    p "failed create { name: #{name}, address: #{address}, details: #{details}, user_id: #{user_id} }"
end