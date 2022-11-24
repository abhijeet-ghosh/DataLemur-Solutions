/* Level : Medium

Company : Spotify

Assume there are three Spotify tables containing information about the artists, songs, and music charts. Write a query to determine the top 5 artists whose songs appear in the Top 10 of the global_song_rank table the highest number of times. From now on, we'll refer to this ranking number as "song appearances".

Output the top 5 artist names in ascending order along with their song appearances ranking (not the number of song appearances, but the rank of who has the most appearances). The order of the rank should take precedence.

For example, Ed Sheeran's songs appeared 5 times in Top 10 list of the global song rank table; this is the highest number of appearances, so he is ranked 1st. Bad Bunny's songs appeared in the list 4, so he comes in at a close 2nd.

Assumptions:

    If two artists' songs have the same number of appearances, the artists should have the same rank.
    The rank number should be continuous (1, 2, 2, 3, 4, 5) and not skipped (1, 2, 2, 4, 5).

artists Table:
Column Name	Type
artist_id	integer
artist_name	varchar

artists Example Input:
artist_id	artist_name
101		Ed Sheeran
120		Drake

songs Table:
Column Name	Type
song_id		integer
artist_id	integer

songs Example Input:
song_id	artist_id
45202	101
19960	120

global_song_rank Table:
Column Name	Type
day		integer (1-52)
song_id		integer
rank		integer (1-1,000,000)

global_song_rank Example Input:
day	song_id	rank
1	45202	5
3	45202	2
1	19960	3
9	19960	15

Example Output:
artist_name	artist_rank
Ed Sheeran	1
Drake		2

Explanation

Ed Sheeran's song appeared twice in the Top 10 list of global song rank while Drake's song is only listed once. Therefore, Ed is ranked #1 and Drake is ranked #2.

The dataset you are querying against may have different input & output - this is just an example!

*/

DataLemur Question Link : https://datalemur.com/questions/top-fans-rank

Solution:

WITH top5artist AS
(
SELECT a.artist_name, COUNT(gsr.rank) AS rank_count,
DENSE_RANK() OVER (ORDER BY COUNT(a.artist_name) DESC) AS artist_rank
FROM artists a
INNER JOIN songs s ON a.artist_id = s.artist_id
INNER JOIN global_song_rank gsr ON s.song_id = gsr.song_id
WHERE gsr.rank <=10
GROUP BY a.artist_name
ORDER BY rank_count DESC, artist_name ASC
)

SELECT artist_name, artist_rank FROM top5artist
WHERE artist_rank <=5;