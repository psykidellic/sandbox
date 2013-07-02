data = []
for l in open('album_genre_data.txt'):
    id, genres = l.split(':')
    data.append((id, set(map(lambda x: x.strip().lower(), genres.split(',')))))

jc = {}

# simple m X n complexity algorithm
for x in range(len(data)-1):
    jc[x] = []
    for y in data:
        if x==y:
            continue






print(data)

#def compute_jaccard_index(set_1, set_2):
    #return len(set_1.intersection(set_2)) / float(len(set_1.union(set_2))) 


#But we can make it more efficient. If you think for a moment, you will find that we really don't need to compute the union set, rather the cardinality. So this code works better:

#def compute_jaccard_index(set_1, set_2):
    #n = len(set_1.intersection(set_2))
    #return n / float(len(set_1) + len(set_2) - n) 

