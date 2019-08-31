import os
import stat
import bs4
import click
import requests
from slugify import slugify


@click.command()
@click.argument('url')
@click.argument('destination')
def main(url, destination):
    title = bs4.BeautifulSoup(requests.get(url).text, 'html.parser').title.text

    if os.path.isdir(destination):
        destination = os.path.join(destination, f'{slugify(title)}.desktop')

    with open(destination, 'w') as f:
        f.write(f"""[Desktop Entry]
Encoding=UTF-8
Name={title}
Type=Link
URL={url}
Icon=applications-internet
""")

    mode = os.stat(destination).st_mode
    os.chmod(destination, mode | stat.S_IEXEC)


if __name__ == '__main__':
    main()
