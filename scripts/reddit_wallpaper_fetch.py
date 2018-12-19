import requests
import random

SUBREDDITS = [
    "earthporn"
]
REDDIT_FORMAT = "https://www.reddit.com/r/{}.json"


def fetch_wallpaper(subreddit):
    headers = {"User-Agent": "reddit_wallpaper_fetch"}
    data = requests.get(REDDIT_FORMAT.format(subreddit),
                        headers=headers).json()
    for post in data["data"]["children"]:
        print(post["data"]["title"])


if __name__ == "__main__":
    fetch_wallpaper(random.choice(SUBREDDITS))
