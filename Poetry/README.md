## TODO
* modify the formating

----


- Install poetry
pip3 install poetry

- then create a poetry project by doing: 
poetry new fastapi-demo

- Add dependencies by doing:
poetry add fastapi uvicorn

- Install dependencies by doing (if you did not add it yourself):
poetry install

- run app by adding: creates a temporary poetry shell - think of this like a venv
poetry run uvicorn fastapi-demo.main:app --reload

- run app by adding: poetry shell - you are now in a virtual env
poetry shell
uvicorn fastapi-demo.main:app --reload

- exit virtual environment by saying:
exit

- find more about your env
poetry env info

- if you wanted to change python version (I only have 11 installed)
poetry env use python3.10

- if you wanted to remove that enviornment to only use default
- poetry env remove python3.10

- update versioning by going into .toml and changing version:
poetry update

- Add pytest:
poetry add pytest

- Remove pytest
poetry remove pytest

- Build projects by doing: This command generates distribution files in the dist/        - directory that you can publish to PyPI or a private package registry with:
poetry build 


