nobunaga = User.create(
  email: 'aaa@aaa',
  nickname: '織田信長',
  password: '111aaa'
)

hideyosi = User.create(
  email: 'bbb@bbb',
  nickname: '豊臣秀吉',
  password: '111bbb'
)

ieyasu = User.create(
  email: 'ccc@ccc',
  nickname: '徳川家康',
  password: '111ccc'
)

singen = User.create(
  email: 'ddd@ddd',
  nickname: '武田信玄',
  password: '111ddd'
)

kensin = User.create(
  email: 'eee@eee',
  nickname: '上杉謙信',
  password: '111eee'
)

masamune = User.create(
  email: 'fff@fff',
  nickname: '伊達政宗',
  password: '111fff'
)

toshiie = User.create(
  email: 'ggg@ggg',
  nickname: '前田利家',
  password: '111ggg'
)

motonari = User.create(
  email: 'hhh@hhh',
  nickname: '毛利元就',
  password: '111hhh'
)

mototika = User.create(
  email: 'iii@iii',
  nickname: '長宗我部元親',
  password: '111iii'
)

kiyomasa = User.create(
  email: 'jjj@jjj',
  nickname: '加藤清正',
  password: '111jjj'
)

koumei = User.create(
  email: 'kkk@kkk',
  nickname: '諸葛孔明',
  password: '111kkk'
)


booking_1 = Booking.create(
  area_id: '14',
  genre_id: '5',
  date_start: Date.today,
  date_end: Faker::Date.forward(days: 365),
  venue: 'ビルボードライブ東京',
  detail: '未定',
  user_id: nobunaga.id
)

booking_2 = Booking.create(
  area_id: '28',
  genre_id: '5',
  date_start: Date.today,
  date_end: Faker::Date.forward(days: 365),
  venue: '梅田クラブクアトロ',
  detail: '未定',
  user_id: nobunaga.id
)

booking_3 = Booking.create(
  area_id: '28',
  genre_id: '5',
  date_start: Date.today,
  date_end: Faker::Date.forward(days: 365),
  venue: 'BIGCAT',
  detail: '未定',
  user_id: nobunaga.id
)

booking_4 = Booking.create(
  area_id: '14',
  genre_id: '9',
  date_start: Date.today,
  date_end: Faker::Date.forward(days: 365),
  venue: 'TSUTAYA O-EAST',
  detail: '未定',
  user_id: hideyosi.id
)

booking_5 = Booking.create(
  area_id: '14',
  genre_id: '9',
  date_start: Date.today,
  date_end: Faker::Date.forward(days: 365),
  venue: 'Zepp DiverCity(TOKYO)',
  detail: '未定',
  user_id: hideyosi.id
)

booking_6 = Booking.create(
  area_id: '28',
  genre_id: '9',
  date_start: Date.today,
  date_end: Faker::Date.forward(days: 365),
  venue: '南堀江knave',
  detail: '未定',
  user_id: hideyosi.id
)

booking_7 = Booking.create(
  area_id: '2',
  genre_id: '6',
  date_start: Date.today,
  date_end: Faker::Date.forward(days: 365),
  venue: 'SAPPORO SPIRITUAL LOUNGE',
  detail: '未定',
  user_id: masamune.id
)

booking_8 = Booking.create(
  area_id: '5',
  genre_id: '6',
  date_start: Date.today,
  date_end: Faker::Date.forward(days: 365),
  venue: 'ライヴホールdarwin',
  detail: '未定',
  user_id: masamune.id
)

booking_9 = Booking.create(
  area_id: '4',
  genre_id: '6',
  date_start: Date.today,
  date_end: Faker::Date.forward(days: 365),
  venue: 'CLUB CHANGE WAVE',
  detail: '未定',
  user_id: masamune.id
)

booking_10 = Booking.create(
  area_id: '6',
  genre_id: '6',
  date_start: Date.today,
  date_end: Faker::Date.forward(days: 365),
  venue: '秋田CLUB SWINDLE',
  detail: '未定',
  user_id: masamune.id
)

booking_11 = Booking.create(
  area_id: '8',
  genre_id: '6',
  date_start: Date.today,
  date_end: Faker::Date.forward(days: 365),
  venue: 'Live Space C-moon',
  detail: '未定',
  user_id: masamune.id
)

booking_13 = Booking.create(
  area_id: '7',
  genre_id: '6',
  date_start: Date.today,
  date_end: Faker::Date.forward(days: 365),
  venue: 'Jazz Bar Rino',
  detail: '未定',
  user_id: masamune.id
)

booking_14 = Booking.create(
  area_id: '20',
  genre_id: '3',
  date_start: Date.today,
  date_end: Faker::Date.forward(days: 365),
  venue: 'Nao Studio KAZOO HALL',
  detail: '未定',
  user_id: kensin.id
)

booking_15 = Booking.create(
  area_id: '16',
  genre_id: '3',
  date_start: Date.today,
  date_end: Faker::Date.forward(days: 365),
  venue: 'Live House柳都SHOW!CASE!!',
  detail: '未定',
  user_id: kensin.id
)

booking_16 = Booking.create(
  area_id: '21',
  genre_id: '3',
  date_start: Date.today,
  date_end: Faker::Date.forward(days: 365),
  venue: '長野CLUB JUNK BOX',
  detail: '未定',
  user_id: kensin.id
)

booking_17 = Booking.create(
  area_id: '24',
  genre_id: '8',
  date_start: Date.today,
  date_end: Faker::Date.forward(days: 365),
  venue: '名古屋クラブクアトロ',
  detail: '未定',
  user_id: hideyosi.id
)

booking_18 = Booking.create(
  area_id: '22',
  genre_id: '8',
  date_start: Date.today,
  date_end: Faker::Date.forward(days: 365),
  venue: '岐阜CLUB ROOTS',
  detail: '未定',
  user_id: hideyosi.id
)

booking_19 = Booking.create(
  area_id: '24',
  genre_id: '8',
  date_start: Date.today,
  date_end: Faker::Date.forward(days: 365),
  venue: 'LIVE HOUSE SAKAE R.A.D',
  detail: '未定',
  user_id: hideyosi.id
)

booking_20 = Booking.create(
  area_id: '17',
  genre_id: '10',
  date_start: Date.today,
  date_end: Faker::Date.forward(days: 365),
  venue: 'MAIRO',
  detail: '未定',
  user_id: toshiie.id
)

booking_21 = Booking.create(
  area_id: '19',
  genre_id: '10',
  date_start: Date.today,
  date_end: Faker::Date.forward(days: 365),
  venue: 'ライブハウス福井CHOP',
  detail: '未定',
  user_id: toshiie.id
)

booking_22 = Booking.create(
  area_id: '18',
  genre_id: '10',
  date_start: Date.today,
  date_end: Faker::Date.forward(days: 365),
  venue: '金沢AZホール',
  detail: '未定',
  user_id: toshiie.id
)

booking_23 = Booking.create(
  area_id: '27',
  genre_id: '10',
  date_start: Date.today,
  date_end: Faker::Date.forward(days: 365),
  venue: 'LiVE Buzz KYOTO',
  detail: '未定',
  user_id: nobunaga.id
)

booking_24 = Booking.create(
  area_id: '34',
  genre_id: '2',
  date_start: Date.today,
  date_end: Faker::Date.forward(days: 365),
  venue: '岡山CRAZYMAMA KINGDOM',
  detail: '未定',
  user_id: motonari.id
)

booking_25 = Booking.create(
  area_id: '35',
  genre_id: '2',
  date_start: Date.today,
  date_end: Faker::Date.forward(days: 365),
  venue: '広島クラブクアトロ',
  detail: '未定',
  user_id: motonari.id
)

booking_26 = Booking.create(
  area_id: '36',
  genre_id: '2',
  date_start: Date.today,
  date_end: Faker::Date.forward(days: 365),
  venue: 'ライブハウス Gumbo',
  detail: '未定',
  user_id: motonari.id
)

booking_27 = Booking.create(
  area_id: '33',
  genre_id: '2',
  date_start: Date.today,
  date_end: Faker::Date.forward(days: 365),
  venue: 'ライブハウスアポロ(出雲APOLLO)',
  detail: '未定',
  user_id: motonari.id
)

booking_27 = Booking.create(
  area_id: '38',
  genre_id: '7',
  date_start: Date.today,
  date_end: Faker::Date.forward(days: 365),
  venue: '高松 DIME',
  detail: '未定',
  user_id: mototika.id
)

booking_28 = Booking.create(
  area_id: '37',
  genre_id: '7',
  date_start: Date.today,
  date_end: Faker::Date.forward(days: 365),
  venue: '徳島club GRINDHOUSE',
  detail: '未定',
  user_id: mototika.id
)

booking_29 = Booking.create(
  area_id: '39',
  genre_id: '7',
  date_start: Date.today,
  date_end: Faker::Date.forward(days: 365),
  venue: 'LIVEHOUSE　KITTYHALL',
  detail: '未定',
  user_id: mototika.id
)

booking_30 = Booking.create(
  area_id: '40',
  genre_id: '7',
  date_start: Date.today,
  date_end: Faker::Date.forward(days: 365),
  venue: '高知X-pt.',
  detail: '未定',
  user_id: mototika.id
)

booking_31 = Booking.create(
  area_id: '44',
  genre_id: '4',
  date_start: Date.today,
  date_end: Faker::Date.forward(days: 365),
  venue: 'KUMAMOTO Django.',
  detail: '未定',
  user_id: kiyomasa.id
)

booking_32 = Booking.create(
  area_id: '45',
  genre_id: '4',
  date_start: Date.today,
  date_end: Faker::Date.forward(days: 365),
  venue: 'T.O.P.S Bitts HALL',
  detail: '未定',
  user_id: kiyomasa.id
)

booking_33 = Booking.create(
  area_id: '42',
  genre_id: '4',
  date_start: Date.today,
  date_end: Faker::Date.forward(days: 365),
  venue: 'LIVE HOUSE 佐賀GEILS',
  detail: '未定',
  user_id: kiyomasa.id
)

booking_34 = Booking.create(
  area_id: '46',
  genre_id: '4',
  date_start: Date.today,
  date_end: Faker::Date.forward(days: 365),
  venue: 'WEATHER KING',
  detail: '未定',
  user_id: kiyomasa.id
)

booking_35 = Booking.create(
  area_id: '41',
  genre_id: '4',
  date_start: Date.today,
  date_end: Faker::Date.forward(days: 365),
  venue: '小倉FUSE',
  detail: '未定',
  user_id: kiyomasa.id
)

booking_36 = Booking.create(
  area_id: '48',
  genre_id: '11',
  date_start: Date.today,
  date_end: Faker::Date.forward(days: 365),
  venue: 'Livehouse Output',
  detail: '未定',
  user_id: koumei.id
)

booking_36 = Booking.create(
  area_id: '15',
  genre_id: '4',
  date_start: Date.today,
  date_end: Faker::Date.forward(days: 365),
  venue: "CLUB CITTA'",
  detail: '未定',
  user_id: ieyasu.id
)

booking_37 = Booking.create(
  area_id: '13',
  genre_id: '4',
  date_start: Date.today,
  date_end: Faker::Date.forward(days: 365),
  venue: "稲毛 K'S DREAM",
  detail: '未定',
  user_id: ieyasu.id
)

booking_38 = Booking.create(
  area_id: '12',
  genre_id: '4',
  date_start: Date.today,
  date_end: Faker::Date.forward(days: 365),
  venue: "HEAVEN'S ROCK さいたま新都心 VJ-3",
  detail: '未定',
  user_id: ieyasu.id
)

booking_39 = Booking.create(
  area_id: '10',
  genre_id: '4',
  date_start: Date.today,
  date_end: Faker::Date.forward(days: 365),
  venue: "HEAVEN'S ROCK 宇都宮VJ-2",
  detail: '未定',
  user_id: ieyasu.id
)

booking_40 = Booking.create(
  area_id: '9',
  genre_id: '4',
  date_start: Date.today,
  date_end: Faker::Date.forward(days: 365),
  venue: "ライブハウス つくばPARKDINER",
  detail: '未定',
  user_id: ieyasu.id
)