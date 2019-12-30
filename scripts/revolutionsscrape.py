from bs4 import BeautifulSoup
import requests
import re
import shutil
import eyed3


def edit_tag(file_name, season, episode, name):
    f = eyed3.load(file_name)
    f.tag.header.version = (2, 4, 0)
    f.tag.artist = u"Mike Duncan"
    f.tag.album = u"Revolutions"
    f.tag.track_num = episode
    f.tag.disk_num = season
    f.tag.genre = u"History"
    f.tag.title = name
    f.tag.save()


def scrape_audio(url, season, episode, name):
    url = url.replace("secure-ec", "hwcdn")
    response = requests.get(url, stream=True)
    file_name = season + "-" + episode + ".mp3"
    with open(file_name, "wb") as out:
        shutil.copyfileobj(response.raw, out)
    del response
    edit_tag(file_name, int(season), int(episode), name)


def scrape_page(url):
    page = requests.get(url)
    soup = BeautifulSoup(page.text).find_all(class_="entry")
    regex = re.compile("([0-9]+).([0-9]+)- (.+)")

    for entry in soup:
        title = entry.find_all(class_="entry-header")[0].find("a").text   
        m = regex.match(title)
        if m:
            body = entry.find_all(class_="entry-body")[0]
            direct_link = None
            for p in body.find_all("p"):
                if "direct link:" in p.text.lower() and "Sponsor" not in p.text:
                    direct_link = p.find("a").get("href")
            print("Downloading '" + title + "'...")
            scrape_audio(direct_link, m.group(1), m.group(2), m.group(3))


if __name__ == "__main__":
    page = requests.get("https://www.revolutionspodcast.com/archives.html")
    soup = BeautifulSoup(page.text)
    found = False
    for entry in soup.find(class_="archive-list").find_all("li"):
        link = entry.find("a")
        if link.text == "October 2014" or found:
            scrape_page(link.get('href'))
            found = True
    print("Done!")
