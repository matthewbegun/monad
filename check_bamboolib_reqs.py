import requests

url = 'https://pypi.python.org/pypi/bamboolib/json'
data = requests.get(url).json()
requirements = data['info']['requires_dist']

for requirement in requirements:
    print(requirement)
