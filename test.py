import kuzu

db = kuzu.Database('/database')
conn = kuzu.Connection(db)

conn.execute("CREATE NODE TABLE User(name STRING, age INT64, PRIMARY KEY (name))")
conn.execute("CREATE NODE TABLE City(name STRING, population INT64, PRIMARY KEY (name))")
conn.execute("CREATE REL TABLE Follows(FROM User TO User, since INT64)")
conn.execute("CREATE REL TABLE LivesIn(FROM User TO City)")

conn.execute('COPY User FROM "/data/user.csv"')
conn.execute('COPY City FROM "/data/city.csv"')
conn.execute('COPY Follows FROM "/data/follows.csv"')
conn.execute('COPY LivesIn FROM "/data/lives-in.csv"')

results = conn.execute('MATCH (u:User) RETURN u.name, u.age;')
while results.has_next():
    print(results.get_next())
