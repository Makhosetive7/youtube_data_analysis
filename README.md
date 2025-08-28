### YouTube Analysis Insights

## Project Overview

Starting a YouTube channel is exciting but choosing the right niche and content strategy can be tricky. This project analyzes video metrics—like duration, resolution, category, title length, and hashtags—to uncover patterns that drive engagement. It helps aspiring creators make data-driven decisions, optimize their content, and grow their audience effectively.

Project is done in python and sql quesry analysis and the findings are closely similar

---

**1. Do higher resolution videos lead to higher engagement ratios?**

* Highest like ratios were observed in videos with lower resolutions, while higher resolutions had lower like ratios
* Comment ratios were mostly very low regardless of resolution.

**Insight:** High resolution doesn’t guarantee higher engagement; medium resolutions might actually perform better per view.

---

**2. Is there an optimal video duration for likes and comments?**

* Very Long (>20 min): Like ratio 0.0152, Comment ratio 0.0042
* Long (10-20 min): Like ratio 0.0130, Comment ratio 0.0045
* Medium (3-10 min): Like ratio 0.0088, Comment ratio 0.0021
* Short (<3 min): Like ratio 0.0084, Comment ratio 0.0018

**Insight:** Longer videos generally have higher engagement ratios. Very long videos perform slightly better in likes, long videos slightly better in comments.

---

**3. Do shorter or longer titles/descriptions correlate with better interaction?**

* Short titles has the highest like ratio.
* Medium titles has slightly lower engagement.
* Long titles performed the worst.

**Insight:** Concise titles slightly outperform longer ones. Keep titles short and clear for better interaction.

---

**4. How does video category affect engagement ratios?**

* Gaming: Highest avg like ratio, avg comment ratio
* Shows, Comedy, People & Blogs followed.
* Categories like Autos & Vehicles, Pets & Animals had the lowest like ratios.

**Insight:** Focus on high-engagement categories like Gaming or Shows for higher per-view interactions.

---

**5. Are higher bitrate / frame rate videos more engaging?**

* Some lower bitrate videos had extremely high like ratios
* Higher frame rates don’t consistently correlate with higher engagement.

**Insight:** Video technical quality alone (bitrate/frame rate) isn’t a strong predictor of engagement. Content and category matter more.

---

**6. Relationship between views and engagement ratios**

* Top-viewed videos (hundreds of millions of views) had very low like ratios and almost zero comment ratios.
* Lower-viewed videos sometimes show higher engagement ratios.

**Insight:** Viral reach doesn’t necessarily equal high per-view engagement. Engagement ratios are often higher for smaller, targeted audiences.

---

**7. Which combinations of features (duration + quality + category) maximize engagement?**

* Highest engagement observed in short gaming videos with moderate resolution
* Other medium/long videos in high-engagement categories like Gaming also performed well.

**Insight:** Short, high-interest category videos (e.g., Gaming) with medium resolution maximize per-view engagement.

---

**8. Do hashtags and keywords improve interaction?**

* Videos with hashtags: Avg views 76k, like ratio 0.00857
* Videos without hashtags: Avg views 1.7k, like ratio 0.0125

**Insight:** Hashtags increase **reach** (views) but not necessarily engagement ratios. Use hashtags to boost visibility, but quality content drives per-view interactions.

---

**Overall Recommendations for Content Creators:**

1. Prioritize high-interest categories like Gaming for maximum engagement.
2. Short, concise titles improve per-view engagement.
3. Longer videos tend to get slightly better engagement ratios.
4. Use hashtags to boost discoverability, but don’t rely solely on them.
5. Technical enhancements (resolution, bitrate) are less critical than content quality.
6. Focus on audience targeting rather than just chasing views for higher interaction ratios.