-- use the database
USE youtube_database;

-- drop table if already exists
DROP TABLE IF EXISTS youtube_videos;

-- create the table with all necessary columns
CREATE TABLE youtube_videos (
    video_id VARCHAR(20) PRIMARY KEY,
    duration INT,
    bitrate INT,
    bitrate_video INT,
    height INT,
    width INT,
    frame_rate FLOAT,
    frame_rate_est FLOAT,
    codec VARCHAR(20),
    category VARCHAR(100),
    url VARCHAR(255),
    title TEXT,
    description TEXT,
    hashtags TEXT,
    views BIGINT,
    likes BIGINT,
    comments BIGINT,
    title_sentiment FLOAT,
    description_sentiment FLOAT,
    engagement_score FLOAT,
    like_ratio FLOAT,
    comment_ratio FLOAT,
    title_length INT,
    description_length INT
);

-- load CSV data into the table
LOAD DATA LOCAL INFILE '/home/makhoe_7/projects/DataAnalysis/YoutubeDataAnalysis/dataset/raw/youtube_data.csv'
INTO TABLE youtube_videos
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(video_id, duration, bitrate, bitrate_video, height, width, frame_rate, frame_rate_est,
 codec, category, url, title, description, hashtags, views, likes, comments, 
 title_sentiment, description_sentiment, engagement_score, like_ratio, comment_ratio, 
 title_length, description_length);

-- verify data load
SELECT COUNT(*) AS total_videos FROM youtube_videos;

-- Do higher resolution videos lead to higher engagement ratios?
SELECT 
    height, width,
    AVG(likes/views) AS avg_like_ratio,
    AVG(comments/views) AS avg_comment_ratio
FROM youtube_videos
WHERE views > 0
GROUP BY height, width
ORDER BY avg_like_ratio DESC
LIMIT  5;

-- Is there an optimal video duration for likes and comments?
SELECT 
    CASE 
        WHEN duration < 180 THEN 'Short (<3 min)'
        WHEN duration BETWEEN 180 AND 600 THEN 'Medium (3-10 min)'
        WHEN duration BETWEEN 600 AND 1200 THEN 'Long (10-20 min)'
        ELSE 'Very Long (>20 min)'
    END AS duration_bucket,
    AVG(likes/views) AS avg_like_ratio,
    AVG(comments/views) AS avg_comment_ratio
FROM youtube_videos
WHERE views > 0
GROUP BY duration_bucket
ORDER BY avg_like_ratio DESC;


-- Do shorter or longer titles/descriptions correlate with better interaction?
SELECT 
    CASE 
        WHEN CHAR_LENGTH(title) < 30 THEN 'Short (<30 chars)'
        WHEN CHAR_LENGTH(title) BETWEEN 30 AND 70 THEN 'Medium (30-70 chars)'
        ELSE 'Long (>70 chars)'
    END AS title_length_group,
    AVG(likes/views) AS avg_like_ratio,
    AVG(comments/views) AS avg_comment_ratio
FROM youtube_videos
WHERE views > 0
GROUP BY title_length_group
ORDER BY avg_like_ratio DESC;


-- How does video category affect engagement ratios?
SELECT 
    category,
    AVG(likes/views) AS avg_like_ratio,
    AVG(comments/views) AS avg_comment_ratio,
    COUNT(*) AS total_videos
FROM youtube_videos
WHERE views > 0
GROUP BY category
ORDER BY avg_like_ratio DESC;

-- Are higher bitrate / frame rate videos more engaging?
SELECT 
    bitrate, frame_rate,
    AVG(likes/views) AS avg_like_ratio,
    AVG(comments/views) AS avg_comment_ratio
FROM youtube_videos
WHERE views > 0
GROUP BY bitrate, frame_rate
ORDER BY avg_like_ratio DESC
LIMIT 20;

-- Relationship between views and engagement ratios
SELECT 
    views,
    (likes/views) AS like_ratio,
    (comments/views) AS comment_ratio
FROM youtube_videos
WHERE views > 0
ORDER BY views DESC
LIMIT 100;

-- Which combinations of features maximize engagement?
SELECT 
    CASE 
        WHEN duration < 180 THEN 'Short'
        WHEN duration BETWEEN 180 AND 600 THEN 'Medium'
        WHEN duration BETWEEN 600 AND 1200 THEN 'Long'
        ELSE 'Very Long'
    END AS duration_bucket,
    CONCAT(height, 'x', width) AS resolution,
    category,
    AVG(likes/views) AS avg_like_ratio,
    AVG(comments/views) AS avg_comment_ratio
FROM youtube_videos
WHERE views > 0
GROUP BY duration_bucket, resolution, category
ORDER BY avg_like_ratio DESC
LIMIT 20;

-- Do hashtags and keywords improve interaction?
SELECT 
    CASE 
        WHEN hashtags IS NULL OR hashtags = '' THEN 'No Hashtags'
        ELSE 'Has Hashtags'
    END AS hashtag_presence,
    AVG(likes/views) AS avg_like_ratio,
    AVG(comments/views) AS avg_comment_ratio,
    AVG(views) AS avg_views
FROM youtube_videos
WHERE views > 0
GROUP BY hashtag_presence;

