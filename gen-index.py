import os
from html import escape
from typing import Tuple

def is_entry(file: str) -> bool:
	return file.endswith('.md') and not file.startswith('_')

# Returns `(name, html)`.
def file_to_entry(file: str) -> Tuple[str, str]:
	html_path = f'/{file.removesuffix(".md")}.html'
	with open(file, 'r') as f:
		title = f.readline().removeprefix('#').strip()
	html = f'<li><a href="{escape(html_path, quote=True)}">{escape(title, quote=False)}</a></li>'
	return (title, html)

print('<style>')
with open('style.css', 'r') as f:
	print(f.read())
print('</style>')
print('<ul>')
files = sorted((file_to_entry(file) for file in os.listdir('.') if is_entry(file)), key=lambda entry: entry[0])
for file in files:
	print(file[1])
print('</ul>')
