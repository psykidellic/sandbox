from operator import itemgetter

data = []
for l in open('album_genre_data.txt'):
    id, genres = l.split(':')
    data.append((id, set(map(lambda x: x.strip().lower(), genres.split(',')))))

def compute_jaccard_index(set_1, set_2):
    return len(set_1.intersection(set_2)) / float(len(set_1.union(set_2)))

jc = {}

# simple m X n complexity algorithm
for source in data:
    source_id = source[0]
    similarities = jc[source_id] = []
    for target in data:
        target_id = target[0]
        # Same item?
        if source_id == target_id:
            continue

        similarities.append((target_id,
                compute_jaccard_index(source[1], target[1])))

        #similarities.sort(key=itemgetter(1))

        print(similarities[10:20])
        similarities.sort(key=itemgetter(1))
        print(similarities[:10])

# Top five for each?
#for k, v in jc.iteritems():
    #top10 = [x[1] for x in v[:10]]
    #print(top10)
    #prin
    #print("{0} : {1}".format(k, ', '.join(v[:10])))

#def compute_jaccard_index(set_1, set_2):
    #return len(set_1.intersection(set_2)) / float(len(set_1.union(set_2)))


#But we can make it more efficient. If you think for a moment, you will find that we really don't need to compute the union set, rather the cardinality. So this code works better:

#def compute_jaccard_index(set_1, set_2):
    #n = len(set_1.intersection(set_2))
    #return n / float(len(set_1) + len(set_2) - n)

