#!/usr/bin/env python
# check_bamboolib_requirements.py
# check requirements of bamboolib on pypi
import requests

# url = 'https://pypi.python.org/pypi/fuzzymatcher/json'
# url = 'https://pypi.python.org/pypi/strsimpy/json'
# url = 'https://pypi.python.org/pypi/recordlinkage/json'
# url = 'https://pypi.python.org/pypi/bamboolib/json'
url = 'https://pypi.python.org/pypi/string-grouper/json'
data = requests.get(url).json()
requirements = data['info']['requires_dist'] + ["py" + data['info']['requires_python']]
# requirements = data['info']['requires_dist']

for requirement in requirements:
    print(requirement)
