# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.delete_all

Product.create(title: 'Programming Ruby 1.9',
    description:
      %{<p>
      定評があるRubyの解説書を、Ruby作者の監訳により日本語に翻訳!
      Ruby は、まつもとゆきひろ氏によるオブジェクト指向プログラミング言語で、楽しく生産的なプログラミングを支援する。言語本来の強力さと使いやすさに加えて、アジャイル開発との相性の良さや、Webアプリケーション開発フレームワークRuby on Railsの圧倒的な人気などに後押しされて、今では日本だけでなく世界中で使われている。
      本書は、Ruby1.9 の定番解説書“Programming Ruby 1.9: The Pragmatic Programmers' Guide”を、作者自身の監訳で翻訳発行するもの。(日本語版は、言語編とライブラリ編の二分冊) 
      },
  image_url: 'rails.png',
  price: 49.95)

Product.create(title: 'test',
    description:
      %{<p>
          Ruby is the fastest ...
      },
  image_url: 'rails.png',
  price: 50.95)
