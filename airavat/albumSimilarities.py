#-*-coding: utf-8 -*-

'''
 Given a dataset of albums and genres, how can we compute the
 similarity between pairs of movies?

'''
from mrjob.job import MRJob
from itertools import combinations

class AlbumsSimilarities(MRJob):

    # OUTPUT_PROTOCOL = SemicolonValueProtocol

    def steps(self):
        return [
            self.mr(mapper=self.group_by_user_rating,
                    reducer=self.count_ratings_users_freq),]
            # self.mr(mapper=self.pairwise_items,
            #         reducer=self.calculate_similarity),
            # self.mr(mapper=self.calculate_ranking,
            #         reducer=self.top_similar_items)]

    def group_by_genre(self, key, line):
      '''
      Emit each genre token and album id.

      1: darkpsy, experimental
      2: experimental, cheezy

      darkpsy 1
      experimental 1
      experimental 2
      cheezy 2
      '''
      album_id, genres = l.split(':')
      for genre in map(lambda x: x.strip().lower(), genres.split(',')):
        yield genre, album_id



