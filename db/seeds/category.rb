#親カテゴリ
lady = Category.create(name: "レディース")
man = Category.create(name: "メンズ")
child = Category.create(name: "子ども服")
funiture = Category.create(name: "家具")
hobby = Category.create(name: "本・音楽・ゲーム")
cosmetic = Category.create(name: "コスメ・美容")
machine = Category.create(name: "家電・スマホ・カメラ")
sport = Category.create(name: "スポーツ・レジャー")
other = Category.create(name: "その他")




#子カテゴリー
lady_1 = lady.children.create(name: "トップス")
lady_2 = lady.children.create(name: "ボトムス")

man_1 = man.children.create(name: "トップス")
man_2 = man.children.create(name: "ボトムス")

child_1 = child.children.create(name: "トップス")
child_2 = child.children.create(name: "ボトムス")

funiture_1 = funiture.children.create(name: "インテリア")
funiture_2 = funiture.children.create(name: "小物")

hobby_1 = hobby.children.create(name: "本")
hobby_2 = hobby.children.create(name: "音楽")
hobby_3 = hobby.children.create(name: "ゲーム")

cosmetic_1 = cosmetic.children.create(name: "コスメ")
cosmetic_2 = cosmetic.children.create(name: "美容")

machine_1 = machine.children.create(name: "家電")
machine_2 = machine.children.create(name: "スマホ")
machine_3 = machine.children.create(name: "カメラ")

sport_1 = sport.children.create(name: "スポーツ")
sport_2 = sport.children.create(name: "レジャー")

other_1 = other.children.create(name: "食品")
other_2 = other.children.create(name: "日用品・雑貨")
other_3 = other.children.create(name: "その他")



#孫カテゴリ
lady_1.children.create([{name: "Tシャツ"},{name: "シャツ"},{name: "ニット/セーター"},{name: "パーカー"},{name: "その他"}])
lady_2.children.create([{name: "パンツ"},{name: "スカート"},{name: "デニム"},{name: "その他"}])

man_1.children.create([{name: "Tシャツ"},{name: "シャツ"},{name: "ニット/セーター"},{name: "パーカー"},{name: "その他"}])
man_2.children.create([{name: "パンツ"},{name: "デニム"},{name: "その他"}])

child_1.children.create([{name: "Tシャツ"},{name: "シャツ"},{name: "ニット/セーター"},{name: "パーカー"},{name: "その他"}])
child_2.children.create([{name: "パンツ"},{name: "スカート"},{name: "デニム"},{name: "その他"}])

funiture_1.children.create([{name: "椅子"},{name: "机"},{name: "収納家具"},{name: "寝具"},{name: "その他"}])
funiture_2.children.create([{name: "証明"},{name: "クッション"},{name: "花瓶"},{name: "その他"}])

hobby_1.children.create([{name: "文学/小説"},{name: "人文/社会"},{name: "ノンフィクション/教養"},{name: "アート/エンタメ"},{name: "コンピュータ/IT"},{name: "旅行/地図"},{name: "その他"}])
hobby_2.children.create([{name: "邦楽"},{name: "洋楽"},{name: "アニメ"},{name: "クラシック"},{name: "Kポップ/アジア"},{name: "キッズ/ファミリー"},{name: "その他"}])
hobby_3.children.create([{name: "家庭用ゲーム本体"},{name: "家庭用ゲームソフト"},{name: "携帯用ゲーム本体"},{name: "携帯用ゲームソフト"},{name: "PC用ゲーム"},{name: "その他"}])

cosmetic_1.children.create([{name: "ベースメイク"},{name: "メイクアップ"},{name: "ネイルケア"},{name: "香水"},{name: "その他"}])
cosmetic_2.children.create([{name: "スキンケア"},{name: "ボディケア"},{name: "ヘアケア"},{name: "オーラルケア"},{name: "その他"}])

machine_1.children.create([{name: "テレビ/映像機器"},{name: "オーディオ機器"},{name: "冷暖房/空調"},{name: "生活家電"},{name: "その他"}])
machine_2.children.create([{name: "スマートフォン/携帯電話"},{name: "スマホカバー"},{name: "タブレット／PC"},{name: "その他"}])
machine_3.children.create([{name: "デジタルカメラ"},{name: "ビデオカメラ"},{name: "レンズ"},{name: "フィルムカメラ"},{name: "防犯カメラ"},{name: "その他"}])

sport_1.children.create([{name: "ゴルフ"},{name: "自転車"},{name: "野球"},{name: "サッカー/フットサル"},{name: "その他"}])
sport_2.children.create([{name: "スキー"},{name: "スノーボード"},{name: "ボウリング"},{name: "その他"}])

other_1.children.create([{name: "菓子"},{name: "米"},{name: "野菜"},{name: "果物"},{name: "調味料"},{name: "加工食品"},{name: "酒/飲料"},{name: "その他"}])
other_2.children.create([{name: "タオル/バス用品"},{name: "洗剤/柔軟剤"},{name: "防災用品"},{name: "その他"}])
other_3.children.create([{name: "文房具/事務用品"},{name: "旅行用品"},{name: "文房具/事務用品"},{name: "ペット用品"},{name: "その他"}])


