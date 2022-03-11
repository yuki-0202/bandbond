# users
nobunaga = User.create( email: 'aaa@aaa', nickname: '織田信長', password: '111aaa' )
hideyosi = User.create( email: 'bbb@bbb', nickname: '豊臣秀吉', password: '111bbb' )
ieyasu = User.create( email: 'ccc@ccc', nickname: '徳川家康', password: '111ccc' )
singen = User.create( email: 'ddd@ddd', nickname: '武田信玄', password: '111ddd' )
kensin = User.create( email: 'eee@eee', nickname: '上杉謙信', password: '111eee' )
masamune = User.create( email: 'fff@fff', nickname: '伊達政宗', password: '111fff' )
toshiie = User.create( email: 'ggg@ggg', nickname: '前田利家', password: '111ggg' )
motonari = User.create( email: 'hhh@hhh', nickname: '毛利元就', password: '111hhh' )
mototika = User.create( email: 'iii@iii', nickname: '長宗我部元親', password: '111iii' )
kiyomasa = User.create( email: 'jjj@jjj', nickname: '加藤清正', password: '111jjj' )
koumei = User.create(
  email: 'kkk@kkk',
  nickname: '諸葛孔明',
  password: '111kkk',
  birthday: Date.today.ago(20.years),
  sex_id: 1,
  genre_id: 11,
  area_id: 48,
  part_id: 5,
  introduction: "天下三分の計"
)
chutatsu = User.create(
  email: 'mmm@mmm',
  nickname: '司馬仲達',
  password: '111mmm',
  birthday: Date.today.ago(20.years),
  sex_id: 1,
  genre_id: 9,
  area_id: 2,
  part_id: 4,
  introduction: "罠じゃないよね？"
)


# bookings
hokkaido = Booking.create(
  area_id: '2',
  genre_id: '11',
  date_start: Date.today,
  date_end: Date.tomorrow,
  venue: 'SAPPORO SPIRITUAL LOUNGE',
  detail: '未定',
  user_id: chutatsu.id
)

aomori = Booking.create(
  area_id: '3',
  genre_id: '6',
  date_start: Date.today,
  date_end: Date.tomorrow,
  venue: '青森Quarter',
  detail: '未定',
  user_id: masamune.id
)

iwate = Booking.create(
  area_id: '4',
  genre_id: '6',
  date_start: Date.today,
  date_end: Date.tomorrow,
  venue: 'CLUB CHANGE WAVE',
  detail: '未定',
  user_id: masamune.id
)

miyagi = Booking.create(
  area_id: '5',
  genre_id: '6',
  date_start: Date.today,
  date_end: Date.tomorrow,
  venue: 'ライヴホールdarwin',
  detail: '未定',
  user_id: masamune.id
)

akita = Booking.create(
  area_id: '6',
  genre_id: '6',
  date_start: Date.today,
  date_end: Date.tomorrow,
  venue: '秋田CLUB SWINDLE',
  detail: '未定',
  user_id: masamune.id
)

yamagata = Booking.create(
  area_id: '7',
  genre_id: '6',
  date_start: Date.today,
  date_end: Date.tomorrow,
  venue: 'Jazz Bar Rino',
  detail: '未定',
  user_id: masamune.id
)

hukushima = Booking.create(
  area_id: '8',
  genre_id: '6',
  date_start: Date.today,
  date_end: Date.tomorrow,
  venue: 'Live Space C-moon',
  detail: '未定',
  user_id: masamune.id
)

ibaraki = Booking.create(
  area_id: '9',
  genre_id: '4',
  date_start: Date.today,
  date_end: Date.tomorrow,
  venue: "ライブハウス つくばPARKDINER",
  detail: '未定',
  user_id: ieyasu.id
)

tochigi = Booking.create(
  area_id: '10',
  genre_id: '4',
  date_start: Date.today,
  date_end: Date.tomorrow,
  venue: "HEAVEN'S ROCK 宇都宮VJ-2",
  detail: '未定',
  user_id: ieyasu.id
)

gunma = Booking.create(
  area_id: '11',
  genre_id: '4',
  date_start: Date.today,
  date_end: Date.tomorrow,
  venue: "TAKASAKI club FLEEZ",
  detail: '未定',
  user_id: ieyasu.id
)

saitama = Booking.create(
  area_id: '12',
  genre_id: '4',
  date_start: Date.today,
  date_end: Date.tomorrow,
  venue: "HEAVEN'S ROCK さいたま新都心 VJ-3",
  detail: '未定',
  user_id: ieyasu.id
)

chiba = Booking.create(
  area_id: '13',
  genre_id: '4',
  date_start: Date.today,
  date_end: Date.tomorrow,
  venue: "稲毛 K'S DREAM",
  detail: '未定',
  user_id: ieyasu.id
)

toukyo_1 = Booking.create(
  area_id: '14',
  genre_id: '5',
  date_start: Date.today,
  date_end: Date.tomorrow,
  venue: 'ビルボードライブ東京',
  detail: '未定',
  user_id: nobunaga.id
)

toukyo_2 = Booking.create(
  area_id: '14',
  genre_id: '9',
  date_start: Date.today,
  date_end: Date.tomorrow,
  venue: 'TSUTAYA O-EAST',
  detail: '未定',
  user_id: hideyosi.id
)

toukyo_3 = Booking.create(
  area_id: '14',
  genre_id: '9',
  date_start: Date.today,
  date_end: Date.tomorrow,
  venue: 'Zepp DiverCity(TOKYO)',
  detail: '未定',
  user_id: hideyosi.id
)

kanagawa = Booking.create(
  area_id: '15',
  genre_id: '4',
  date_start: Date.today,
  date_end: Date.tomorrow,
  venue: "CLUB CITTA'",
  detail: '未定',
  user_id: ieyasu.id
)

niigata = Booking.create(
  area_id: '16',
  genre_id: '3',
  date_start: Date.today,
  date_end: Date.tomorrow,
  venue: 'Live House柳都SHOW!CASE!!',
  detail: '未定',
  user_id: kensin.id
)

toyama = Booking.create(
  area_id: '17',
  genre_id: '10',
  date_start: Date.today,
  date_end: Date.tomorrow,
  venue: 'MAIRO',
  detail: '未定',
  user_id: toshiie.id
)

ishikawa = Booking.create(
  area_id: '18',
  genre_id: '10',
  date_start: Date.today,
  date_end: Date.tomorrow,
  venue: '金沢AZホール',
  detail: '未定',
  user_id: toshiie.id
)

fukui = Booking.create(
  area_id: '19',
  genre_id: '10',
  date_start: Date.today,
  date_end: Date.tomorrow,
  venue: 'ライブハウス福井CHOP',
  detail: '未定',
  user_id: toshiie.id
)

yamanashi = Booking.create(
  area_id: '20',
  genre_id: '3',
  date_start: Date.today,
  date_end: Date.tomorrow,
  venue: 'Nao Studio KAZOO HALL',
  detail: '未定',
  user_id: kensin.id
)

nagano = Booking.create(
  area_id: '21',
  genre_id: '3',
  date_start: Date.today,
  date_end: Date.tomorrow,
  venue: '長野CLUB JUNK BOX',
  detail: '未定',
  user_id: kensin.id
)

gifu = Booking.create(
  area_id: '22',
  genre_id: '8',
  date_start: Date.today,
  date_end: Date.tomorrow,
  venue: '岐阜CLUB ROOTS',
  detail: '未定',
  user_id: hideyosi.id
)

shizuoka = Booking.create(
  area_id: '23',
  genre_id: '8',
  date_start: Date.today,
  date_end: Date.tomorrow,
  venue: 'LIVE ROXY SHIZUOKA',
  detail: '未定',
  user_id: hideyosi.id
)

aichi_1 = Booking.create(
  area_id: '24',
  genre_id: '8',
  date_start: Date.today,
  date_end: Date.tomorrow,
  venue: '名古屋クラブクアトロ',
  detail: '未定',
  user_id: hideyosi.id
)

aichi_2 = Booking.create(
  area_id: '24',
  genre_id: '8',
  date_start: Date.today,
  date_end: Date.tomorrow,
  venue: 'LIVE HOUSE SAKAE R.A.D',
  detail: '未定',
  user_id: hideyosi.id
)

mie = Booking.create(
  area_id: '25',
  genre_id: '8',
  date_start: Date.today,
  date_end: Date.tomorrow,
  venue: 'クラブケイオス',
  detail: '未定',
  user_id: hideyosi.id
)

shiga = Booking.create(
  area_id: '26',
  genre_id: '8',
  date_start: Date.today,
  date_end: Date.tomorrow,
  venue: 'LIVEHOUSE CLUB B-FLAT',
  detail: '未定',
  user_id: hideyosi.id
)

kyoto = Booking.create(
  area_id: '27',
  genre_id: '10',
  date_start: Date.today,
  date_end: Date.tomorrow,
  venue: 'LiVE Buzz KYOTO',
  detail: '未定',
  user_id: nobunaga.id
)

oosaka_1 = Booking.create(
  area_id: '28',
  genre_id: '5',
  date_start: Date.today,
  date_end: Date.tomorrow,
  venue: '梅田クラブクアトロ',
  detail: '未定',
  user_id: nobunaga.id
)

oosaka_2 = Booking.create(
  area_id: '28',
  genre_id: '5',
  date_start: Date.today,
  date_end: Date.tomorrow,
  venue: 'BIGCAT',
  detail: '未定',
  user_id: nobunaga.id
)

oosaka_3 = Booking.create(
  area_id: '28',
  genre_id: '9',
  date_start: Date.today,
  date_end: Date.tomorrow,
  venue: '南堀江knave',
  detail: '未定',
  user_id: hideyosi.id
)

hyougo = Booking.create(
  area_id: '29',
  genre_id: '9',
  date_start: Date.today,
  date_end: Date.tomorrow,
  venue: '神戸VARIT.',
  detail: '未定',
  user_id: hideyosi.id
)

nara = Booking.create(
  area_id: '30',
  genre_id: '9',
  date_start: Date.today,
  date_end: Date.tomorrow,
  venue: 'Billy -THE LIVE-',
  detail: '未定',
  user_id: hideyosi.id
)

wakayama = Booking.create(
  area_id: '31',
  genre_id: '9',
  date_start: Date.today,
  date_end: Date.tomorrow,
  venue: 'ライブハウスシェルター',
  detail: '未定',
  user_id: hideyosi.id
)

tottori = Booking.create(
  area_id: '32',
  genre_id: '9',
  date_start: Date.today,
  date_end: Date.tomorrow,
  venue: 'LIVE HOUSE RuRu Cafe',
  detail: '未定',
  user_id: hideyosi.id
)

shimane = Booking.create(
  area_id: '33',
  genre_id: '2',
  date_start: Date.today,
  date_end: Date.tomorrow,
  venue: 'ライブハウスアポロ(出雲APOLLO)',
  detail: '未定',
  user_id: motonari.id
)

okayama = Booking.create(
  area_id: '34',
  genre_id: '2',
  date_start: Date.today,
  date_end: Date.tomorrow,
  venue: '岡山CRAZYMAMA KINGDOM',
  detail: '未定',
  user_id: motonari.id
)

hiroshima = Booking.create(
  area_id: '35',
  genre_id: '2',
  date_start: Date.today,
  date_end: Date.tomorrow,
  venue: '広島クラブクアトロ',
  detail: '未定',
  user_id: motonari.id
)

yamaguchi = Booking.create(
  area_id: '36',
  genre_id: '2',
  date_start: Date.today,
  date_end: Date.tomorrow,
  venue: 'ライブハウス Gumbo',
  detail: '未定',
  user_id: motonari.id
)

tokushima = Booking.create(
  area_id: '37',
  genre_id: '7',
  date_start: Date.today,
  date_end: Date.tomorrow,
  venue: '徳島club GRINDHOUSE',
  detail: '未定',
  user_id: mototika.id
)

kagawa = Booking.create(
  area_id: '38',
  genre_id: '7',
  date_start: Date.today,
  date_end: Date.tomorrow,
  venue: '高松 DIME',
  detail: '未定',
  user_id: mototika.id
)

ehime = Booking.create(
  area_id: '39',
  genre_id: '7',
  date_start: Date.today,
  date_end: Date.tomorrow,
  venue: 'LIVEHOUSE KITTYHALL',
  detail: '未定',
  user_id: mototika.id
)

kouchi = Booking.create(
  area_id: '40',
  genre_id: '7',
  date_start: Date.today,
  date_end: Date.tomorrow,
  venue: '高知X-pt.',
  detail: '未定',
  user_id: mototika.id
)

fukuoka = Booking.create(
  area_id: '41',
  genre_id: '4',
  date_start: Date.today,
  date_end: Date.tomorrow,
  venue: '小倉FUSE',
  detail: '未定',
  user_id: kiyomasa.id
)

saga = Booking.create(
  area_id: '42',
  genre_id: '4',
  date_start: Date.today,
  date_end: Date.tomorrow,
  venue: 'LIVE HOUSE 佐賀GEILS',
  detail: '未定',
  user_id: kiyomasa.id
)

nagasaki = Booking.create(
  area_id: '43',
  genre_id: '4',
  date_start: Date.today,
  date_end: Date.tomorrow,
  venue: 'Studio DO!',
  detail: '未定',
  user_id: kiyomasa.id
)

kumamoto = Booking.create(
  area_id: '44',
  genre_id: '4',
  date_start: Date.today,
  date_end: Date.tomorrow,
  venue: 'KUMAMOTO Django.',
  detail: '未定',
  user_id: kiyomasa.id
)

ooita = Booking.create(
  area_id: '45',
  genre_id: '4',
  date_start: Date.today,
  date_end: Date.tomorrow,
  venue: 'T.O.P.S Bitts HALL',
  detail: '未定',
  user_id: kiyomasa.id
)

miyazaki = Booking.create(
  area_id: '46',
  genre_id: '4',
  date_start: Date.today,
  date_end: Date.tomorrow,
  venue: 'WEATHER KING',
  detail: '未定',
  user_id: kiyomasa.id
)

kagoshima = Booking.create(
  area_id: '47',
  genre_id: '4',
  date_start: Date.today,
  date_end: Date.tomorrow,
  venue: 'Speed King -STUDIO-',
  detail: '未定',
  user_id: kiyomasa.id
)

okinawa = Booking.create(
  area_id: '48',
  genre_id: '11',
  date_start: Date.today,
  date_end: Date.tomorrow,
  venue: 'Livehouse Output',
  detail: '未定',
  user_id: koumei.id
)


# rooms, room_users, messages
room = Room.create( booking_id: okinawa.id, user_id: nobunaga.id )
RoomUser.create( room_id: room.id, user_id: nobunaga.id )
RoomUser.create( room_id: room.id, user_id: koumei.id )
Message.create( content: '鉄砲隊！', room_id: room.id, user_id: nobunaga.id )

room = Room.create( booking_id: okinawa.id, user_id: hideyosi.id )
RoomUser.create( room_id: room.id, user_id: hideyosi.id )
RoomUser.create( room_id: room.id, user_id: koumei.id )
Message.create( content: '刀狩り！', room_id: room.id, user_id: hideyosi.id )

room = Room.create( booking_id: okinawa.id, user_id: ieyasu.id )
RoomUser.create( room_id: room.id, user_id: ieyasu.id )
RoomUser.create( room_id: room.id, user_id: koumei.id )
Message.create( content: '鎖国！', room_id: room.id, user_id: ieyasu.id )

room = Room.create( booking_id: okinawa.id, user_id: chutatsu.id )
RoomUser.create( room_id: room.id, user_id: chutatsu.id )
RoomUser.create( room_id: room.id, user_id: koumei.id )
Message.create( content: 'こんばんは', room_id: room.id, user_id: chutatsu.id )
Message.create( content: 'こんばんは', room_id: room.id, user_id: koumei.id )
Message.create( content: '調子はどうですか？', room_id: room.id, user_id: koumei.id )
Message.create( content: 'ぼちぼちです', room_id: room.id, user_id: chutatsu.id )
Message.create( content: 'ライブを企画しようと思うのですが', room_id: room.id, user_id: chutatsu.id )
Message.create( content: '出演バンドを集める良い方法を知りませんか？', room_id: room.id, user_id: chutatsu.id )
Message.create( content: '天下三分の計', room_id: room.id, user_id: koumei.id )