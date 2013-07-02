data = []
for l in open('album_genre_data.txt'):
    id, genres = l.split(':')
    data.append((id, map(lambda x: x.strip(), genres.split(','))))

print(data)

