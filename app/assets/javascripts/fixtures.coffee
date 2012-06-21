window.FixturesMapping = []

window.BuildCollection = ( model, qtd ) ->
  objs = []
  for i in [0..16]
    objs.push model()
  objs

UserFixture = () ->
  name: Faker.Name.findName()
  age: Faker.Helpers.randomNumber(10)+15
  email: Faker.Internet.email().toLowerCase()

UsersFixtures = () ->
  BuildCollection UserFixture, 10

PlacesData = [
  {
    name: "Museu da Casa Brasileira"
    lat: -23.579991
    lon: -46.684604
  },
  {
    name: "Esporte Clube Pinheiros"
    lat: -23.578285
    lon: -46.6869
  },
  {
    name: "Habibs"
    lat: -23.578924
    lon: -46.685586
  },
  {
    name: "Bolados Sucos"
    lat: -23.579642
    lon:  -46.685114
  },
  {
    name: "Starbucks Café"
    lat: -23.581128
    lon: -46.683281
  },
  {
    name: "Lartiste Grill"
    lat: -23.579568
    lon:  -46.685168
  },
  {
    name: "Hamburguinho Lanches"
    lat: -23.581544
    lon: -46.684011
  },
  {
    name: "Trindade Restaurante"
    lat: -23.581324
    lon: -46.683522
  },
  {
    name: "Yo-kota Sushi"
    lat: -23.580522
    lon: -46.685386
  },
  {
    name: "The Sailor Bar"
    lat: -23.58067
    lon: -46.6853
  },
  {
    name: "Banco Itaú"
    lat: 23.581204
    lon: -46.685066
  },
  {
    name: "Octávio Café"
    lat: -23.582785
    lon: -46.684352
  },
  {
    name: "Shopping Iguatemi"
    lat: -23.576793
    lon: -46.687761
  }
]

window.FixturesMapping['/user$'] = UserFixture
window.FixturesMapping['/users$'] = UsersFixtures
window.FixturesMapping['/current_user$'] = UserFixture()

window.GetFixturesFor = ( url ) ->
  url = new String(url)
  for matcher of window.FixturesMapping
    if (new RegExp( matcher )).test( url )
      obj = FixturesMapping[ matcher ]
      if typeof(obj) == 'function'
        obj = obj()
      return obj
  return false
