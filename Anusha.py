# import math
import numpy as np
# Given data points
data_points = [(1, 1), (1, 2), (2, 1), (2, 2), (3, 3), (3, 4), (4, 5), (5, 5), (5, 6), (6, 6), (7, 7), (8, 8)]

# Initial code word values
code_words = [(2, 2), (4, 6), (6, 5), (8, 8)]

def calculate_distance(point1, point2):
    # return math.sqrt((point1[0] - point2[0])*2 + (point1[1] - point2[1])*2)
    return np.sqrt(np.sum(point1[0] - point2[0])**2)

def find_closest_code_word(data_point):
    min_distance = float('inf')
    closest_code_word = None
    for code_word in code_words:
        distance = calculate_distance(data_point, code_word)
        if distance < min_distance:
            min_distance = distance
            closest_code_word = code_word
    return closest_code_word

def update_code_words(cluster_points):
    new_code_words = []
    for cluster in cluster_points:
        cluster_x_sum = sum(point[0] for point in cluster)
        cluster_y_sum = sum(point[1] for point in cluster)
        cluster_size = len(cluster)
        new_code_words.append((cluster_x_sum / cluster_size, cluster_y_sum / cluster_size))
    return new_code_words

def k_means(data_points, code_words):
    prev_code_words = None
    while prev_code_words != code_words:
        cluster_points = [[] for _ in range(len(code_words))]
        for data_point in data_points:
            closest_code_word = find_closest_code_word(data_point)
            cluster_index = code_words.index(closest_code_word)
            cluster_points[cluster_index].append(data_point)
        prev_code_words = code_words
        code_words = update_code_words(cluster_points)
    return cluster_points

# Perform K-means clustering
clusters = k_means(data_points, code_words)

# Print codebook of 4 clusters
for i, cluster in enumerate(clusters):
    print(f"Cluster {i+1} code word: {code_words[i]}")
    print(f"Cluster {i+1} data points: {cluster}")
    print()